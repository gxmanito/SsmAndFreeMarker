package gx.sys.entity;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.sun.istack.internal.NotNull;

public class SysRoleResource {
  // 权限对应实体
  @NotNull
  private String sysId;// 系统
  private String roleId;// 角色
  private Integer resId;// 权限

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

  public Integer getResId() {
    return resId;
  }

  public void setResId(Integer resId) {
    this.resId = resId;
  }

}
