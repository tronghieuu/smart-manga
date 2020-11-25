package com.smanga.common.exception.user;

/**
 * User lock exception class
 * 
 * @author Trong Hieu
 */
public class UserBlockedException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserBlockedException()
    {
        super("user.blocked", null);
    }
}
