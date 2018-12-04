package gx.base;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.resultset.DefaultResultSetHandler;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.executor.statement.BaseStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ResultMap;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import gx.common.CommonConstants;
import gx.common.Page;
import gx.util.CommonUtil;
import gx.util.jdbc.PagingUtil;


/**
 * 分页拦截器<br>
 * 在查询参数为wing.toolkits.common.Page时,自动转化为分页查询
 * 
 * @author gx
 * 
 */
@Intercepts({ @Signature(method = "prepare", type = StatementHandler.class, args = { Connection.class, Integer.class }),
    @Signature(method = "handleResultSets", type = ResultSetHandler.class, args = { Statement.class }) })
public class PagingInterceptor implements Interceptor, CommonConstants {
  private static final Logger logger = LoggerFactory.getLogger(PagingInterceptor.class);

  private DatabaseType databaseType;// 数据库类型

  @SuppressWarnings("unchecked")
  @Override
  public Object intercept(Invocation invocation) throws Throwable {
    logger.debug("in interceptor");
    Object target = invocation.getTarget();
    if (target instanceof RoutingStatementHandler) {
      // mybatis在进行sql语句处理的时候都是建立的RoutingStatementHandler
      RoutingStatementHandler handler = (RoutingStatementHandler) target;
      // RoutingStatementHandler中的delegate属性(StatementHandler类型)决定具体的处理
      // Statement的不同建立对应的BaseStatementHandler(SimpleStatementHandler /
      // PreparedStatementHandler / CallableStatementHandler)
      // StatementHandler delegate = (StatementHandler)
      // CommonUtils.getFieldValue(handler, "delegate");
      BaseStatementHandler delegate = (BaseStatementHandler) CommonUtil.getFieldValue(handler, "delegate");
      // 获取BoundSql对象
      BoundSql boundSql = delegate.getBoundSql();
      // 获取参数对象
      Object obj = boundSql.getParameterObject();
      if (obj instanceof Page<?>) {
        Page<?> page = (Page<?>) obj;
        if (!page.isPagingFlag()) {
          logger.debug("interceptor(not paging) effected");
          // 不分页
          return invocation.proceed();
        }
        // 获取实际分页
        String sql = boundSql.getSql();
        boolean empty = false;
        // 查询记录总数
        if (!page.isOnlyResults()) {
          // 拦截到的prepare方法参数是一个Connection对象
          Connection connection = (Connection) invocation.getArgs()[0];
          // 通过反射获取delegate父类BaseStatementHandler的mappedStatement属性
          MappedStatement mappedStatement = (MappedStatement) CommonUtil.getFieldValue(delegate, "mappedStatement");
          String countSql = PagingUtil.getCountSql(sql, databaseType);
          // 利用Configuration,查询记录数的Sql语句countSql,参数映射关系parameterMappings和参数对象page建立查询记录数对应的BoundSql对象
          BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql,
              boundSql.getParameterMappings(), page);
          // 通过mappedStatement,参数对象page和BoundSql对象countBoundSql建立一个用于设定参数的ParameterHandler对象
          ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, page, countBoundSql);

          PreparedStatement pstmt = null;
          ResultSet rs = null;
          // 通过connection建立一个countSql对应的PreparedStatement对象
          pstmt = connection.prepareStatement(countSql);
          // 通过parameterHandler给PreparedStatement对象设置参数
          parameterHandler.setParameters(pstmt);
          // 执行和获取结果
          rs = pstmt.executeQuery();
          if (rs.next()) {
            int totalCount = rs.getInt(1);
            // 给当前的参数page对象设置总记录数
            page.setTotalCount(totalCount);
            empty = totalCount == 0;
          }
          logger.debug("interceptor(page count) effected");
        }
        if (empty) {
          // 利用反射设置当前BoundSql对应的sql属性为空查询Sql语句
          CommonUtil.setFieldValue(boundSql, "sql", PagingUtil.getNullSql(databaseType));
          CommonUtil.setFieldValue(boundSql, "parameterMappings", null);
        } else {
          // 利用反射设置当前BoundSql对应的sql属性为分页Sql语句
          CommonUtil.setFieldValue(boundSql, "sql",
              PagingUtil.getPagingSql(sql, page.getStart(), page.getPageSize(), databaseType));
        }
      } else {
        logger.debug("interceptor(paging) not effected");
      }
    } else if (target instanceof DefaultResultSetHandler) {
      MappedStatement mappedStatement = (MappedStatement) CommonUtil.getFieldValue(target, "mappedStatement");
      List<ResultMap> maps = mappedStatement.getResultMaps();
      // 没有结果类型 并且参数为Page
      if (maps.size() == 0 && Page.class.equals(mappedStatement.getParameterMap().getType())) {
        Page<?> page = (Page<?>) ((BoundSql) CommonUtil.getFieldValue(target, "boundSql")).getParameterObject();
        Class<?> clazz = page.getEntityClass();
        // 拦截到的handleResultSets方法参数是一个Statement对象
        Statement statement = (Statement) invocation.getArgs()[0];
        // 获取结果集
        ResultSet rs = statement.getResultSet();
        // 处理结果集
        try {
          // 获取结果列对应TypeHandler
          ResultSetMetaData rsmd = rs.getMetaData();
          int l = rsmd.getColumnCount();
          List<TypeMapper> handlers = new ArrayList<TypeMapper>(l);
          TypeHandlerRegistry registry = mappedStatement.getConfiguration().getTypeHandlerRegistry();
          if (clazz == null || Map.class.isAssignableFrom(clazz)) {
            List<Map<String, Object>> results = (List<Map<String, Object>>) page.getResults();
            for (int i = 0; i++ < l;) {
              handlers.add(new TypeMapper(CommonUtil.toCamelCase(rsmd.getColumnLabel(i)),
                  registry.getTypeHandler(JdbcType.forCode(rsmd.getColumnType(i)))));
            }
            while (rs.next()) {
              Map<String, Object> map = CommonUtil.newHashMapWithExpectedSize(l);
              int i = 0;
              while (i < l) {
                TypeMapper handler = handlers.get(i++);
                map.put(handler.colName,
                    handler.typeHandler == null ? rs.getObject(i) : handler.typeHandler.getResult(rs, i));
              }
              results.add(map);
            }
          } else {
            List<?> results = page.getResults();
            for (int i = 0; i++ < l;) {
              String cn = CommonUtil.toCamelCase(rsmd.getColumnLabel(i));
              Field field = CommonUtil.getField(clazz, cn);
              handlers.add(field == null ? null
                  : new TypeMapper(cn,
                      registry.getTypeHandler(field.getType(), JdbcType.forCode(rsmd.getColumnType(i)))));
            }
            Method method = results.getClass().getMethod("add", Object.class);
            while (rs.next()) {
              Object obj = clazz.newInstance();
              int i = 0;
              while (i < l) {
                TypeMapper handler = handlers.get(i++);
                if (handler != null) {
                  CommonUtil.setFieldValue(obj, handler.colName,
                      handler.typeHandler == null ? rs.getObject(i) : handler.typeHandler.getResult(rs, i));
                }
              }
              method.invoke(results, obj);
            }
          }
        } catch (Exception e) {
          throw e;
        } finally {
          rs.close();
        }
        logger.debug("interceptor(paging result) effected");
        return new ArrayList<Object>(0);

        // 单个结果集 没有配置resultMap 且为Map
      } else if (maps.size() > 0 && maps.get(0).getResultMappings().size() == 0
          && Map.class.isAssignableFrom(maps.get(0).getType())) {
        Statement statement = (Statement) invocation.getArgs()[0];
        // 获取结果集
        ResultSet rs = statement.getResultSet();
        if (rs == null) {
          return null;
        }
        // 处理结果集
        List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
        try {
          // 获取结果列对应TypeHandler
          ResultSetMetaData rsmd = rs.getMetaData();
          int l = rsmd.getColumnCount();
          List<TypeMapper> handlers = new ArrayList<TypeMapper>(l);
          TypeHandlerRegistry registry = mappedStatement.getConfiguration().getTypeHandlerRegistry();
          for (int i = 0; i++ < l;) {
            handlers.add(new TypeMapper(CommonUtil.toCamelCase(rsmd.getColumnLabel(i)),
                registry.getTypeHandler(JdbcType.forCode(rsmd.getColumnType(i)))));
          }
          while (rs.next()) {
            Map<String, Object> map = CommonUtil.newHashMapWithExpectedSize(l);
            int i = 0;
            while (i < l) {
              TypeMapper handler = handlers.get(i++);
              map.put(handler.colName,
                  handler.typeHandler == null ? rs.getObject(i) : handler.typeHandler.getResult(rs, i));
            }
            results.add(map);
          }
        } catch (Exception e) {
          throw e;
        } finally {
          rs.close();
        }
        logger.debug("interceptor(map result) effected");
        return results;
      } else{
        logger.debug("interceptor(result) not effected");
      }
    }
    return invocation.proceed();
  }

  @Override
  public Object plugin(Object target) {
    return Plugin.wrap(target, this);
  }

  @Override
  public void setProperties(Properties properties) {
    String type = properties.getProperty("databaseType");
    databaseType = StringUtils.isBlank(type) ? null : DatabaseType.valueOf(type.toUpperCase());
  }
}

class TypeMapper {
  public String colName;
  public TypeHandler<?> typeHandler;

  public TypeMapper(String colName, TypeHandler<?> typeHandler) {
    this.colName = colName;
    this.typeHandler = typeHandler;
  }
}