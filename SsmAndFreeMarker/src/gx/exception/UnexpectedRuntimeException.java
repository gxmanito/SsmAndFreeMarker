package gx.exception;

public class UnexpectedRuntimeException extends RuntimeException {
  private static final long serialVersionUID = 1L;

  public UnexpectedRuntimeException() {
    super();
  }

  public UnexpectedRuntimeException(String msg) {
    super(msg);
  }

  public UnexpectedRuntimeException(String msg, Throwable cause) {
    super(msg, cause);
  }

  public UnexpectedRuntimeException(Throwable cause) {
    super(cause);
  }
}
