package gx.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class PinyinUtil {

  /**
   * ASCII表中可见字符从!开始，偏移位值为33(Decimal)
   */
  static final char DBC_CHAR_START = 33; // 半角!

  /**
   * ASCII表中可见字符到~结束，偏移位值为126(Decimal)
   */
  static final char DBC_CHAR_END = 126; // 半角~

  /**
   * 全角对应于ASCII表的可见字符从！开始，偏移值为65281
   */
  static final char SBC_CHAR_START = 65281; // 全角！

  /**
   * 全角对应于ASCII表的可见字符到～结束，偏移值为65374
   */
  static final char SBC_CHAR_END = 65374; // 全角～

  /**
   * ASCII表中除空格外的可见字符与对应的全角字符的相对偏移
   */
  static final int CONVERT_STEP = 65248; // 全角半角转换间隔

  /**
   * 全角空格的值，它没有遵从与ASCII的相对偏移，必须单独处理
   */
  static final char SBC_SPACE = 12288; // 全角空格 12288

  /**
   * 半角空格的值，在ASCII中为32(Decimal)
   */
  static final char DBC_SPACE = ' '; // 半角空格

  /**
   * <PRE>
   *   
   * 半角字符->全角字符转换    
   * 只处理空格，!到˜之间的字符，忽略其他
   * </PRE>
   */
  public static String bj2qj(String src) {
    if (src == null) {
      return null;
    }
    StringBuilder buf = new StringBuilder(src.length());
    char[] ca = src.toCharArray();
    for (int i = 0; i < ca.length; i++) {
      char c = ca[i];
      if (c == DBC_SPACE) { // 如果是半角空格，直接用全角空格替代
        buf.append(SBC_SPACE);
      } else if ((c >= DBC_CHAR_START) && (c <= DBC_CHAR_END)) { // 字符是!到~之间的可见字符
        buf.append((char) (c + CONVERT_STEP));
      } else { // 不对空格以及ascii表中其他可见字符之外的字符做任何处理
        buf.append(c);
      }
    }
    return buf.toString();
  }

  /**
   * <PRE>
   *   
   * 全角字符->半角字符转换    
   * 只处理全角的空格，全角！到全角～之间的字符，忽略其他
   * </PRE>
   */
  public static String qj2bj(String src) {
    if (src == null) {
      return src;
    }
    StringBuilder buf = new StringBuilder(src.length());
    char[] ca = src.toCharArray();
    for (int i = 0; i < src.length(); i++) {
      char c = ca[i];
      if (c >= SBC_CHAR_START && c <= SBC_CHAR_END) { // 如果位于全角！到全角～区间内
        buf.append((char) (c - CONVERT_STEP));
      } else if (c == SBC_SPACE) { // 如果是全角空格
        buf.append(DBC_SPACE);
      } else { // 不处理全角空格，全角！到全角～区间外的字符
        buf.append(c);
      }
    }
    return buf.toString();
  }

  /**
   * 获取中文拼音首字母
   * @param chinese
   * @return
   */
  public static String getFirstSpell(String chinese) {
    if (chinese == null) {
      return null;
    }

    StringBuilder pybf = new StringBuilder();
    char[] arr = chinese.toCharArray();
    HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
    format.setCaseType(HanyuPinyinCaseType.LOWERCASE);
    format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
    for (int i = 0; i < arr.length; i++) {
      char c = arr[i];
      if (c >= SBC_CHAR_START && c <= SBC_CHAR_END) { // 如果位于全角！到全角～区间内
        c = (char) (c - CONVERT_STEP);
      } else if (c == SBC_SPACE) { // 如果是全角空格
        c = DBC_SPACE;
      }

      if (arr[i] > 128) {
        try {
          String[] temp = PinyinHelper.toHanyuPinyinStringArray(c, format);
          if (temp != null) {
            pybf.append(temp[0].charAt(0));
          }
        } catch (BadHanyuPinyinOutputFormatCombination e) {
          e.printStackTrace();
        }
      } else {
        pybf.append(c);
      }
    }
    return pybf.toString().replaceAll("\\W", "").trim();
  }
}
