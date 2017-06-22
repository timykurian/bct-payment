package com.bct.core.exception;

public class NotSupportedException extends RuntimeException {

    String message;

    public NotSupportedException(String message) {
        this.message = message;
    }

    public NotSupportedException(String message, Throwable cause) {
        super(message, cause);
    }

    @Override
    public String getMessage() {
        return message;
    }
}
