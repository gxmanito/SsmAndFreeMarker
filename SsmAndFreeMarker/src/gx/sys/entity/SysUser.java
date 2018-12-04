package gx.sys.entity;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.internal.NotNull;

/**
 * 用户
 * 
 * @author gx
 * 
 */
public class SysUser {
  @NotNull
  private String sysId;
  @Pattern(regexp = "\\w{3,20}", message = "账号必须由3-20位字母、数字或下划线")
  private String userId;// 账号
  @JsonIgnore
  private String userPwd;// 密码
  @Length(min = 2, max = 250, message = "姓名最长250个字")
  private String userName;// 姓名
  private String userPy;// 姓名拼音
  @NotNull
  private String userOrg;// 用户类别
  @Range(min = 0, max = 9, message = "性别不正确")
  private Short sex;// 性别
  @Length(max = 300, message = "邮箱最长300个字符")
  private String email;// 有些
  @Pattern(regexp = "^(((\\d{3,4}-{0,1}){0,1}\\d{7,8}(-{0,1}\\d{3,4}){0,1})|(1[3|4|5|7|8]\\d{9}))$", message = "电话号码格式错误")
  private String mobilePhone;// 手机号
  @Range(min = 0, max = 3, message = "状态值不正确")
  private Short state;// 状态 sys_code.code_type=1
  @Length(max = 120, message = "备注最长120个字")
  private String remarks;// 备注
  @JsonIgnore
  private Date gmtCreate;// 创建时间
  @JsonIgnore
  private Date gmtUpdate;// 最后更新时间
  @JsonIgnore
  private Date gmtLogin;// 最后登陆时间
  private String orgName;// sys_user_class表对应的className
  private String ukeyId;//ukey的唯一Id
  
  
  public String getUkeyId() {
    return ukeyId;
  }
  public void setUkeyId(String ukeyId) {
    this.ukeyId = ukeyId;
  }

  @Override
  public String toString() {
    return ReflectionToStringBuilder.toString(this);
  }

  public String getSysId() {
    return sysId;
  }

  public void setSysId(String sysId) {
    this.sysId = sysId;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getUserPwd() {
    return userPwd;
  }

  public void setUserPwd(String userPwd) {
    this.userPwd = userPwd;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserPy() {
    return userPy;
  }

  public void setUserPy(String userPy) {
    this.userPy = userPy;
  }

  public String getUserOrg() {
    return userOrg;
  }

  public void setUserOrg(String userOrg) {
    this.userOrg = userOrg;
  }

  public Short getSex() {
    return sex;
  }

  public void setSex(Short sex) {
    this.sex = sex;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getMobilePhone() {
    return mobilePhone;
  }

  public void setMobilePhone(String mobilePhone) {
    this.mobilePhone = mobilePhone;
  }

  public Short getState() {
    return state;
  }

  public void setState(Short state) {
    this.state = state;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  public Date getGmtCreate() {
    return gmtCreate;
  }

  public void setGmtCreate(Date gmtCreate) {
    this.gmtCreate = gmtCreate;
  }

  public Date getGmtUpdate() {
    return gmtUpdate;
  }

  public void setGmtUpdate(Date gmtUpdate) {
    this.gmtUpdate = gmtUpdate;
  }

  public Date getGmtLogin() {
    return gmtLogin;
  }

  public void setGmtLogin(Date gmtLogin) {
    this.gmtLogin = gmtLogin;
  }

  public String getOrgName() {
    return orgName;
  }

  public void setOrgName(String orgName) {
    this.orgName = orgName;
  }
}
