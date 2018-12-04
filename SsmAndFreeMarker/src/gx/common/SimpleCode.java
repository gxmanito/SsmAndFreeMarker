package gx.common;

public class SimpleCode {
  private String id;// id
  private String pid;// pid
  private String name;// name
  private String remarks;// remarks

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPid() {
    return pid;
  }

  public void setPid(String pid) {
    this.pid = pid;
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

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("SimpleCode [id=").append(id).append(", pid=").append(pid).append(", name=").append(name)
        .append(", remarks=").append(remarks).append("]");
    return builder.toString();
  }
}
