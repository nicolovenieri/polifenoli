/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.exception;

/**
 *
 * @author zambrima
 */
public class DataTruncationException extends Exception {

    /**
     * Creates a new instance of
     * <code>DuplicatedObjectException</code> without detail message.
     */
    public DataTruncationException() {
    }

    /**
     * Constructs an instance of
     * <code>DuplicatedObjectException</code> with the specified detail message.
     *
     * @param msg the detail message.
     */
    public DataTruncationException(String msg) {
        super(msg);
    }
}
