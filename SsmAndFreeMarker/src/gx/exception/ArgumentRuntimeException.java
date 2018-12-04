package gx.exception;

public class ArgumentRuntimeException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public ArgumentRuntimeException() {
        super();
    }

    public ArgumentRuntimeException(String msg) {
        super(msg);
    }

    public ArgumentRuntimeException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public ArgumentRuntimeException(Throwable cause) {
        super(cause);
    }
}
