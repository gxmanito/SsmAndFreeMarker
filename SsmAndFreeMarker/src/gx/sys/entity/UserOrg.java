package gx.sys.entity;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class UserOrg {
  @NotNull
  private String code;
  @NotNull
  private String parent;
  @NotNull
  private String name;
  @Pattern(regexp = "^(((\\d{3,4}-{0,1}){0,1}\\d{7,8}(-{0,1}\\d{3,4}){0,1})|(1[3|4|5|7|8]\\d{9}))$", message = "电话号码格式错误")
  private String phone;
  private String busiLicense;
  private String delegate;
  private String remarks;
  @NotNull
  private Integer lvl;
  @NotNull
  private Integer lft;
  @NotNull
  private Integer rgt;
  private String certType;// 证件类型
  private String address;// 联系地址
  @Pattern(regexp = "^(((\\d{3,4}-{0,1}){0,1}\\d{7,8}(-{0,1}\\d{3,4}){0,1})|(1[3|4|5|7|8]\\d{9}))$", message = "电话格式错误")
  private String delegatePhone;// 法人电话

  @Override
  public String toString() {
    return ReflectionToStringBuilder.toString(this);
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getParent() {
    return parent;
  }

  public void setParent(String parent) {
    this.parent = parent;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getBusiLicense() {
    return busiLicense;
  }

  public void setBusiLicense(String busiLicense) {
    this.busiLicense = busiLicense;
  }

  public String getDelegate() {
    return delegate;
  }

  public void setDelegate(String delegate) {
    this.delegate = delegate;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  public Integer getLvl() {
    return lvl;
  }

  public void setLvl(Integer lvl) {
    this.lvl = lvl;
  }

  public Integer getLft() {
    return lft;
  }

  public void setLft(Integer lft) {
    this.lft = lft;
  }

  public Integer getRgt() {
    return rgt;
  }

  public void setRgt(Integer rgt) {
    this.rgt = rgt;
  }

  public String getCertType() {
    return certType;
  }

  public void setCertType(String certType) {
    this.certType = certType;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getDelegatePhone() {
    return delegatePhone;
  }

  public void setDelegatePhone(String delegatePhone) {
    this.delegatePhone = delegatePhone;
  }
}
