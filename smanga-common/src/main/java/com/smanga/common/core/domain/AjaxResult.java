package com.smanga.common.core.domain;

import java.util.HashMap;

import com.smanga.common.utils.StringUtils;

/**
 * Operation message reminder
 *
 * @author Trong Hieu
 */
public class AjaxResult extends HashMap<String, Object>
{
    private static final long serialVersionUID = 1L;

    /** status code */
    public static final String CODE_TAG = "code";

    /** Return content */
    public static final String MSG_TAG = "msg";

    /** Data object */
    public static final String DATA_TAG = "data";

    /**
     * Status type
     */
    public enum Type
    {
        /** Success */
        SUCCESS(0),
        /** Warning */
        WARN(301),
        /** Error */
        ERROR(500);
        private final int value;

        Type(int value)
        {
            this.value = value;
        }

        public int value()
        {
            return this.value;
        }
    }

    /**
     * Initialize a newly created AjaxResult object so that it represents an empty message.
     */
    public AjaxResult()
    {
    }

    /**
     * Initialize a newly created AjaxResult object
     *
     * @param type status type
     * @param msg return content
     */
    public AjaxResult(Type type, String msg)
    {
        super.put(CODE_TAG, type.value);
        super.put(MSG_TAG, msg);
    }

    /**
     * Initialize a newly created AjaxResult object
     *
     * @param type status type
     * @param msg return content
     * @param data data object
     */
    public AjaxResult(Type type, String msg, Object data)
    {
        super.put(CODE_TAG, type.value);
        super.put(MSG_TAG, msg);
        if (StringUtils.isNotNull(data))
        {
            super.put(DATA_TAG, data);
        }
    }

    /**
     * Convenient chain call
     *
     * @param key key
     * @param value
     * @return data object
     */
    @Override
    public AjaxResult put(String key, Object value)
    {
        super.put(key, value);
        return this;
    }

    /**
     * Return success message
     *
     * @return success message
     */
    public static AjaxResult success()
    {
        return AjaxResult.success("The operation was successful");
    }

    /**
     * Return successful data
     *
     * @return success message
     */
    public static AjaxResult success(Object data)
    {
        return AjaxResult.success("Successful operation", data);
    }

    /**
     * Return success message
     *
     * @param msg return content
     * @return success message
     */
    public static AjaxResult success(String msg)
    {
        return AjaxResult.success(msg, null);
    }

    /**
     * Return success message
     *
     * @param msg return content
     * @param data data object
     * @return success message
     */
    public static AjaxResult success(String msg, Object data)
    {
        return new AjaxResult(Type.SUCCESS, msg, data);
    }

    /**
     * Return warning message
     *
     * @param msg return content
     * @return warning message
     */
    public static AjaxResult warn(String msg)
    {
        return AjaxResult.warn(msg, null);
    }

    /**
     * Return warning message
     *
     * @param msg return content
     * @param data data object
     * @return warning message
     */
    public static AjaxResult warn(String msg, Object data)
    {
        return new AjaxResult(Type.WARN, msg, data);
    }

    /**
     * Return error message
     *
     * @return
     */
    public static AjaxResult error()
    {
        return AjaxResult.error("The operation failed");
    }

    /**
     * Return error message
     *
     * @param msg return content
     * @return warning message
     */
    public static AjaxResult error(String msg)
    {
        return AjaxResult.error(msg, null);
    }

    /**
     * Return error message
     *
     * @param msg return content
     * @param data data object
     * @return warning message
     */
    public static AjaxResult error(String msg, Object data)
    {
        return new AjaxResult(Type.ERROR, msg, data);
    }
}
