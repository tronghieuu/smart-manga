package com.smanga.common.exception.user;

/**
 * Verification code error exception class
 * 
 * @author Trong Hieu
 */
public class CaptchaException extends UserException
{
    private static final long serialVersionUID = 1L;

    public CaptchaException()
    {
        super("user.jcaptcha.error", null);
    }
}
