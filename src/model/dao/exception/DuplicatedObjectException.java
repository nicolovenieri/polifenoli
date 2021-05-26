/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.exception;

/**
 *
 * @author zambrima
 */
public class DuplicatedObjectException extends Exception {

  /**
   * Creates a new instance of
   * <code>DuplicatedObjectException</code> without detail message.
   */
  public DuplicatedObjectException() {
  }

  /**
   * Constructs an instance of
   * <code>DuplicatedObjectException</code> with the specified detail message.
   *
   * @param msg the detail message.
   */
  public DuplicatedObjectException(String msg) {
    super(msg);
  }
}
