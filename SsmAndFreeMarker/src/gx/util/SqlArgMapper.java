package gx.util;

import java.util.ArrayList;
import java.util.List;

import ognl.Ognl;
import ognl.OgnlException;

/**
 * sql参数映射转换<br>
 * 依赖ognl<br>
 * 将字符串中的#{ognlExpression}使用"?"替换并将实际值放入args中，${ognlExpression}则直接替换
 * 
 * @author wings
 * 
 */
public class SqlArgMapper {
  public String result;// 处理后的字符串
  public Object[] args;// 参数

  /**
   * 构造函数<br>
   * 直接进行处理
   * 
   * @param sql 待转换sql
   * @param params 参数对象
   * @throws OgnlException
   */
  public SqlArgMapper(String sql, Object params) throws OgnlException {
    int i = sql.indexOf("{");
    if (i == -1) {
      return;
    }
    List<Object> list = new ArrayList<Object>();
    StringBuilder builder = new StringBuilder();
    char[] src = sql.toCharArray();
    int offset = 0;
    while (i != -1) {
      int end = sql.indexOf("}", i);
      if (end == -1) {
        builder.append(src, offset, src.length - offset);
        offset = src.length;
      } else {
        i -= 1;
        char c = src[i];
        if (c == '#' || c == '$') {
          builder.append(src, offset, i - offset);
          offset = i + 2;
          Object v = Ognl.getValue(new String(src, offset, end - offset), params);
          if (c == '#') {
            builder.append('?');
            list.add(v);
          } else {
            builder.append(v);
          }
          offset = end + 1;
        } else {
          builder.append(src, offset, 2);
          offset = i + 2;
        }
      }
      i = sql.indexOf("{", offset);
    }
    if (offset < src.length) {
      builder.append(src, offset, src.length - offset);
    }
    result = builder.toString();
    args = list.toArray();
  }
}