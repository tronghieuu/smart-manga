package com.smanga.common.exception.user;

/**
 * The user does not have an exception class
 * 
 * @author Trong Hieu
 */
public class UserNotExistsException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserNotExistsException()
    {
        super("user.not.exists", null);
    }
}
