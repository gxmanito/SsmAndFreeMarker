package gx.common;

/**
 * 简单的JSON返回值对象
 * 
 * @author gx
 * 
 */
public class SimpleJSONResult {
  private boolean success;// 成功标志
  private Object data;// 数据对象

  public SimpleJSONResult(boolean success, Object data) {
    this.success = success;
    this.data = data;
  }

  public Boolean getSuccess() {
    return success;
  }

  public void setSuccess(boolean success) {
    this.success = success;
  }

  public Object getData() {
    return data;
  }

  public void setData(Object data) {
    this.data = data;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("SimpleJSONResult [success=").append(success).append(", data=").append(data).append("]");
    return builder.toString();
  }
}
