package com.smanga.common.exception.user;

import com.smanga.common.exception.base.BaseException;

/**
 * User information exception class
 * 
 * @author Trong Hieu
 */
public class UserException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public UserException(String code, Object[] args)
    {
        super("user", code, args, null);
    }
}
