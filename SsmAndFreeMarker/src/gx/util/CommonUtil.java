package gx.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class CommonUtil {
  private static final int MAX_POWER_OF_TWO = 1 << (Integer.SIZE - 2);

  /**
   * 创建一个期望大小的hashmap
   * 
   * @param expectedSize 期望大小
   * @return
   */
  public static <K, V> HashMap<K, V> newHashMapWithExpectedSize(int expectedSize) {
    return new HashMap<K, V>(capacity(expectedSize));
  }

  static int capacity(int expectedSize) {// expectedSize = 7；这传进去个7，返回的是10；
    if (expectedSize < 3) {
      return expectedSize + 1;
    }
    if (expectedSize < MAX_POWER_OF_TWO) {
      // This is the calculation used in JDK8 to resize when a putAll
      // happens; it seems to be the most conservative calculation we
      // can make. 0.75 is the default load factor.
      return (int) ((float) expectedSize / 0.75F + 1.0F);
    }
    return Integer.MAX_VALUE; // any large value //MAX_VALUE = 0x7fffffff;
  }

  /**
   * 获取对象属性
   * 
   * @param clazz 目标类
   * @param fieldName 属性名
   * @return
   */
  public static Field getField(Class<?> clazz, String fieldName) {
    Field field = null;
    for (; clazz != Object.class; clazz = clazz.getSuperclass()) {
      try {
        field = clazz.getDeclaredField(fieldName);
      } catch (Exception e) {
        // do nothing
      }
    }
    return field;
  }

  /**
   * 获取对象属性值 无需get方法
   * 
   * @param obj 目标对象
   * @param fieldName 属性名
   * @return
   * @throws IllegalArgumentException
   * @throws IllegalAccessException
   */
  public static Object getFieldValue(Object obj, String fieldName)
      throws IllegalArgumentException, IllegalAccessException {
    Object result = null;
    Field field = getField(obj.getClass(), fieldName);
    if (field != null) {
      field.setAccessible(true);
      result = field.get(obj);
    }
    return result;
  }

  /**
   * 设置对象属性值 无需set方法
   * 
   * @param obj 目标对象
   * @param fieldName 属性名
   * @param fieldValue 属性值
   * @throws IllegalArgumentException
   * @throws IllegalAccessException
   */
  public static void setFieldValue(Object obj, String fieldName,
      Object fieldValue) throws IllegalArgumentException,
      IllegalAccessException {
    Field field = getField(obj.getClass(), fieldName);
    if (field != null) {
      field.setAccessible(true);
      field.set(obj, fieldValue);
    }
  }

  public static String toCamelCase(String str) {
    if (str == null || "".equals(str)) {
      return str;
    }
    int l = str.length();
    char kc = '_';
    char c = str.charAt(l - 1);

    // 结尾是下划线直接返回
    if (c == kc) {
      return str.toLowerCase();
    }
    char[] cs;
    c = str.charAt(0);
    if (c == kc) {
      return str.toLowerCase();
    } else {
      cs = new char[l];
      cs[0] = Character.toLowerCase(c);
    }
    int ci = 1;
    for (int i = 1; i < l; i++) {
      c = str.charAt(i);
      if (c == kc) {
        cs[ci++] = Character.toUpperCase(str.charAt(++i));
      } else {
        cs[ci++] = Character.isUpperCase(c) ? Character.toLowerCase(c) : c;
      }
    }
    return new String(cs, 0, ci);
  }

  /**
   * 判断字符串全为小写字母
   * 
   * @param str
   * @return
   */
  public static boolean isAllLowerCase(String str) {
    if (str == null) {
      return false;
    }
    boolean b = true;
    for (int i = 0; i < str.length(); i++) {
      char c = str.charAt(i);
      if (c < 'a' || c > 'z') {
        b = false;
        break;
      }
    }
    return b;
  }

  /**
   * 无序集合转换为有序列表
   * 
   * @param set
   * @return
   */
  public static List<String> setSortToList(Set<String> set) {
    List<String> setList = new ArrayList<String>(set);
    Collections.sort(setList, new Comparator<String>() {
      @Override
      public int compare(String o1, String o2) {
        return o1.compareTo(o2);
      }
    });
    return setList;
  }
}
