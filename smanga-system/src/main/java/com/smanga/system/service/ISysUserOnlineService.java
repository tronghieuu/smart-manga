package com.smanga.system.service;

import java.util.Date;
import java.util.List;

import com.smanga.system.domain.SysUserOnline;

/**
 * Online user service layer
 *
 * @author Trong Hieu
 */
public interface ISysUserOnlineService
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
    public void deleteOnlineById(String sessionId);

    /**
     * Delete information by session number
     *
     * @param sessions session ID collection
     * @return online user information
     */
    public void batchDeleteOnline(List<String> sessions);

    /**
     * Save session information
     *
     * @param online session information
     */
    public void saveOnline(SysUserOnline online);

    /**
     * Query session collection
     *
     * @param userOnline paging parameters
     * @return session collection
     */
    public List<SysUserOnline> selectUserOnlineList(SysUserOnline userOnline);

    /**
     * Forcibly log out users
     *
     * @param sessionId session ID
     */
    public void forceLogout(String sessionId);

    /**
     * Clean user cache
     *
     * @param loginName login name
     * @param sessionId session ID
     */
    public void removeUserCache(String loginName, String sessionId);

    /**
     * Query session collection
     *
     * @param expiredDate valid period
     * @return session collection
     */
    public List<SysUserOnline> selectOnlineByExpired(Date expiredDate);
}
