package gx.common;

import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

//资源树的映射实体对象
public class IviewTreeNode {
  private String id;
  private String parent;
  private String title;
  private List<IviewTreeNode> children;
  private String remarks;
  private boolean disabled;
  private boolean disableCheckbox;
  private boolean checked;
  private boolean expand;

  @Override
  public String toString() {
    return ReflectionToStringBuilder.toString(this);
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getParent() {
    return parent;
  }

  public void setParent(String parent) {
    this.parent = parent;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public List<IviewTreeNode> getChildren() {
    return children;
  }

  public void setChildren(List<IviewTreeNode> children) {
    this.children = children;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  public boolean isDisabled() {
    return disabled;
  }

  public void setDisabled(boolean disabled) {
    this.disabled = disabled;
  }

  public boolean isDisableCheckbox() {
    return disableCheckbox;
  }

  public void setDisableCheckbox(boolean disableCheckbox) {
    this.disableCheckbox = disableCheckbox;
  }

  public boolean isChecked() {
    return checked;
  }

  public void setChecked(boolean checked) {
    this.checked = checked;
  }

  public boolean isExpand() {
    return expand;
  }

  public void setExpand(boolean expand) {
    this.expand = expand;
  }
}
