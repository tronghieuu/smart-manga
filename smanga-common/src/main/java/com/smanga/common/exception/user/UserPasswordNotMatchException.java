package com.smanga.common.exception.user;

/**
 * The user password is incorrect or does not meet the standard exception category
 * 
 * @author Trong Hieu
 */
public class UserPasswordNotMatchException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserPasswordNotMatchException()
    {
        super("user.password.not.match", null);
    }
}
