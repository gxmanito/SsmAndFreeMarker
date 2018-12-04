package gx.exception;

public class BusinessRuntimeException extends RuntimeException {
  private static final long serialVersionUID = 1L;

  public BusinessRuntimeException() {
    super();
  }

  public BusinessRuntimeException(String msg) {
    super(msg);
  }

  public BusinessRuntimeException(String msg, Throwable cause) {
    super(msg, cause);
  }

  public BusinessRuntimeException(Throwable cause) {
    super(cause);
  }
}
