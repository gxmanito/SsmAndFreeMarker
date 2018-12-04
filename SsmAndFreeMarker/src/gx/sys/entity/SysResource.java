package gx.sys.entity;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;

import com.sun.istack.internal.NotNull;

/**
 * 资源
 * 
 * @author gx
 * 
 */
public class SysResource {
  @NotNull
  private String sysId;// 资源id
  private int resId;// 资源id
  private int parent;// 上级资源id
  @Length(min = 2, max = 20, message = "资源名称最多20个字")
  private String resName;// 资源名称
  private String resPy;// 名称拼音
  private Short resType;// 资源类型 sys_code.code_type=2
  @Length(max = 200, message = "资源地址最多200个字符")
  private String resUrl;// 资源地址
  private String icon;// 显示图标
  private Short state;// 状态 sys_code.code_type=3
  private String permission;// 所需权限
  @Length(max = 120, message = "备注最多120个字")
  private String remarks;// 备注
  private Integer lvl;// 等级/深度
  private Integer lft;// 左值
  private Integer rgt;// 右值

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

  public int getResId() {
    return resId;
  }

  public void setResId(int resId) {
    this.resId = resId;
  }

  public int getParent() {
    return parent;
  }

  public void setParent(int parent) {
    this.parent = parent;
  }

  public String getResName() {
    return resName;
  }

  public void setResName(String resName) {
    this.resName = resName;
  }

  public String getResPy() {
    return resPy;
  }

  public void setResPy(String resPy) {
    this.resPy = resPy;
  }

  public Short getResType() {
    return resType;
  }

  public void setResType(Short resType) {
    this.resType = resType;
  }

  public String getResUrl() {
    return resUrl;
  }

  public void setResUrl(String resUrl) {
    this.resUrl = resUrl;
  }

  public String getIcon() {
    return icon;
  }

  public void setIcon(String icon) {
    this.icon = icon;
  }

  public Short getState() {
    return state;
  }

  public void setState(Short state) {
    this.state = state;
  }

  public String getPermission() {
    return permission;
  }

  public void setPermission(String permission) {
    this.permission = permission;
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
}
