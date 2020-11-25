package com.smanga.common.exception.user;

/**
 * Role lock exception class
 * 
 * @author Trong Hieu
 */
public class RoleBlockedException extends UserException
{
    private static final long serialVersionUID = 1L;

    public RoleBlockedException()
    {
        super("role.blocked", null);
    }
}
