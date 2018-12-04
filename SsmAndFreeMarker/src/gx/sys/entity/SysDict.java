package gx.sys.entity;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

/**
 * 代码字典
 * 
 * @author gx
 * 
 */
public class SysDict {
  @Range(min = 0, max = 255, message = "代码类型必须在0-255之间")
  private Short codeType;// 代码类型
  @Length(min = 1, max = 15, message = "类型名称最多15个字")
  private String typeName;// 类型名称
  @Length(min = 1, max = 10, message = "代码最多10个字符")
  private String code;// 代码
  @Length(min = 1, max = 50, message = "名称最多50个字")
  private String name;// 名称
  @Length(min = 0, max = 120, message = "备注最多120个字")
  private String remarks;// 备注

  @Override
  public String toString() {
    return ReflectionToStringBuilder.toString(this);
  }

  public Short getCodeType() {
    return codeType;
  }

  public void setCodeType(Short codeType) {
    this.codeType = codeType;
  }

  public String getTypeName() {
    return typeName;
  }

  public void setTypeName(String typeName) {
    this.typeName = typeName;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }
}
