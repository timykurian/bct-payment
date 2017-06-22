package com.bct.core.exception;

/**
 * Created by timy on 6/9/17.
 */
public class TwoCheckOutException extends Exception {

    public TwoCheckOutException() {
    }

    public TwoCheckOutException(String message) {
        super(message);
    }

    public TwoCheckOutException(String message, Throwable cause) {
        super(message, cause);
    }

    public TwoCheckOutException(Throwable cause) {
        super(cause);
    }

}
