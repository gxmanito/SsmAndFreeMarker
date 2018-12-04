package gx.sys.entity;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.sun.istack.internal.NotNull;

public class SysRole {
  // 用户角色
  @NotNull
  private String sysId;// 系统id
  private String roleId;// 角色id
  private String roleName;// 角色名称
  private String remarks;// 角色备注

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

  public String getRoleId() {
    return roleId;
  }

  public void setRoleId(String roleId) {
    this.roleId = roleId;
  }

  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }
}
