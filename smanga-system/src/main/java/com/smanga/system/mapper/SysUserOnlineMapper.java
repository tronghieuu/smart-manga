package com.smanga.system.mapper;

import java.util.List;

import com.smanga.system.domain.SysUserOnline;

/**
 * Online users Data layer
 *
 * @author Trong Hieu
 */
public interface SysUserOnlineMapper
{
    /**
     * Query information by session serial number
     *
     * @param sessionId session ID
     * @return online user information
     */
    public SysUserOnline selectOnlineById(String sessionId);

    /**
     * Delete information by session number
     *
     * @param sessionId session ID
     * @return online user information
     */
    public int deleteOnlineById(String sessionId);

    /**
     * Save session information
     *
     * @param online session information
     * @return result
     */
    public int saveOnline(SysUserOnline online);

    /**
     * Query session collection
     *
     * @param userOnline session parameters
     * @return session collection
     */
    public List<SysUserOnline> selectUserOnlineList(SysUserOnline userOnline);

    /**
     * Query the collection of expired sessions
     *
     * @param lastAccessTime expiration time
     * @return session collection
     */
    public List<SysUserOnline> selectOnlineByExpired(String lastAccessTime);
}
