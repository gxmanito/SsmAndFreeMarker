package gx.base;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * String 处理
 * @author gx
 *
 */
public class StringConvertor implements Converter<String, String> {

  @Override
  public String convert(String str) {
    return StringUtils.isBlank(str) ? null : StringUtils.trim(str);
  }
}