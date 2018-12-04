package gx.util;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 对象拷贝工具 没有诸多检查
 * 
 * @author wings
 *
 */
public class Copier {

  /**
   * 将简单对象所有属性复制到map对象中
   * 
   * @param source 简单对象
   * @param target map对象
   * @param excludeFields 排除的属性名
   * @throws IllegalAccessException
   * @throws IllegalArgumentException
   */
  public static void bean2Map(Object source, Map<String, Object> target, String... excludeFields)
      throws IllegalArgumentException, IllegalAccessException {
    Map<String, Field> map = getFields(source.getClass());

    if (excludeFields.length != 0) {
      for (String field : excludeFields) {
        map.remove(field);
      }
    }

    for (Iterator<Entry<String, Field>> it = map.entrySet().iterator(); it.hasNext();) {
      Entry<String, Field> entry = it.next();
      Field field = entry.getValue();
      field.setAccessible(true);
      target.put(entry.getKey(), field.get(source));
    }
  }

  /**
   * 将map对象所有属性复制到简单对象中
   * 
   * @param source map对象
   * @param target 简单对象
   * @param excludeFields 排除的属性名
   * @throws IllegalAccessException
   * @throws IllegalArgumentException
   */
  public static void map2Bean(Map<String, Object> source, Object target, String... excludeFields)
      throws IllegalArgumentException, IllegalAccessException {
    Map<String, Field> map = getFields(target.getClass());

    if (excludeFields.length != 0) {
      for (String field : excludeFields) {
        map.remove(field);
      }
    }

    for (Iterator<Entry<String, Field>> it = map.entrySet().iterator(); it.hasNext();) {
      Entry<String, Field> entry = it.next();
      String key = entry.getKey();
      if (source.containsKey(key)) {
        Field field = entry.getValue();
        field.setAccessible(true);
        field.set(target, source.get(key));
      }
    }
  }

  /**
   * 将map对象所有属性复制到简单对象中
   * 
   * @param source map对象
   * @param target 简单对象
   * @param excludeFields 排除的属性名
   * @throws IllegalAccessException
   * @throws IllegalArgumentException
   */
  public static void bean2Bean(Object source, Object target, String... excludeFields)
      throws IllegalArgumentException, IllegalAccessException {
    Map<String, Field> sMap = getFields(source.getClass());
    Map<String, Field> tMap = getFields(target.getClass());

    if (excludeFields.length != 0) {
      for (String field : excludeFields) {
        sMap.remove(field);
      }
    }

    for (Iterator<Entry<String, Field>> it = sMap.entrySet().iterator(); it.hasNext();) {
      Entry<String, Field> entry = it.next();
      String key = entry.getKey();
      if (tMap.containsKey(key)) {
        Field s = entry.getValue();
        Field t = tMap.get(key);
        s.setAccessible(true);
        t.setAccessible(true);
        t.set(target, s.get(key));
      }
    }
  }

  /**
   * 获取类属性集合
   * 
   * @param clazz
   * @return
   */
  private static Map<String, Field> getFields(Class<?> clazz) {
    Field[] fields = clazz.getDeclaredFields();
    Map<String, Field> map = CommonUtil.newHashMapWithExpectedSize(fields.length);

    for (Field field : fields) {
      if (!Modifier.isStatic(field.getModifiers())) {
        map.put(field.getName(), field);
      }
    }

    Class<?> superClazz = clazz.getSuperclass();
    if (Object.class != superClazz) {
      map.putAll(getFields(superClazz));
    }

    return map;
  }
}
