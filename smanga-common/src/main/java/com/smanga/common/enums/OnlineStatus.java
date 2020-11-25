package com.smanga.common.enums;

/**
 * User session
 *
 * @author Trong Hieu
 */
public enum OnlineStatus
{
    /** user status */
    on_line("online"), off_line("offline");

    private final String info;

    private OnlineStatus(String info)
    {
        this.info = info;
    }

    public String getInfo()
    {
        return info;
    }
}
