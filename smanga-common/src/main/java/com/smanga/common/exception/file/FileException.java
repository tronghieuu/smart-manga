package com.smanga.common.exception.file;

import com.smanga.common.exception.base.BaseException;

/**
 * File information exception
 * 
 * @author Trong Hieu
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args)
    {
        super("file", code, args, null);
    }

}
