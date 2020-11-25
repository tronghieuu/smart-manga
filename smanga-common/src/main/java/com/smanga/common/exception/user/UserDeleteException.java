package com.smanga.common.exception.user;

/**
 * User account has been deleted
 * 
 * @author Trong Hieu
 */
public class UserDeleteException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserDeleteException()
    {
        super("user.password.delete", null);
    }
}
