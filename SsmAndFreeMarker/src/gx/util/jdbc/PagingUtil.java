package gx.util.jdbc;

import gx.common.CommonConstants;

import com.alibaba.druid.sql.PagerUtils;
import com.alibaba.druid.util.JdbcUtils;


/**
 * 分页工具<br>
 * 依赖druid数据连接池PageUtil
 * 
 * @author wings
 * 
 */
public class PagingUtil implements CommonConstants {
  /**
   * 转换为druid数据连接池对应的数据库类型字符串
   * 
   * @param dbType
   * @return
   */
  private static String getDatabaseType(DatabaseType databaseType) {
    switch (databaseType) {
    case ORACLE:
      return JdbcUtils.ORACLE;
    case MYSQL:
      return JdbcUtils.MYSQL;
    case DB2:
      return JdbcUtils.DB2;
    case SYBASE:
      return JdbcUtils.SYBASE;
    case SQL_SERVER:
      return JdbcUtils.SQL_SERVER;
    default:
      return null;
    }
  }

  /**
   * 获取空查询sql
   * 
   * @return
   */
  public static String getNullSql(DatabaseType databaseType) {
    switch (databaseType) {
    case ORACLE:
      return "select 1 from dual where 1=0";
    case MYSQL:
      return "select 1 from dual where 1=0"; // 貌似是后来的版本支持dual表
    case DB2:
      return "select 1 from sysibm.sysdummy1 where 1=0";
    case SYBASE:
      return "select 1 from sys.dummy where 1=0";
    case SQL_SERVER:
      return "select 1 where 1=0"; // 暂时未实现
    default:
      return null;
    }
  }

  /**
   * 获取总数查询sql
   * 
   * @param sql 查询sql语句
   * @return
   */
  public static String getCountSql(String sql, DatabaseType databaseType) {
    return PagerUtils.count(sql, getDatabaseType(databaseType));
  }

  /**
   * 获取分页查询sql
   * 
   * @param start 记录起始下标(从0开始)
   * @param limit 记录限制数(每页显示数量)
   * @return
   */
  public static String getPagingSql(String sql, int start, int limit, DatabaseType dbType) {
    return PagerUtils.limit(sql, getDatabaseType(dbType), start, limit);
  }
}
