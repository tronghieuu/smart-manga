package com.smanga.system.service;

import java.util.List;

import com.smanga.system.domain.SysNotice;

/**
 * Announcement Service Layer
 *
 * @author Trong Hieu
 */
public interface ISysNoticeService
{
    /**
     * Query announcement information
     *
     * @param noticeId notice ID
     * @return announcement information
     */
    public SysNotice selectNoticeById(Long noticeId);

    /**
     * Check the announcement list
     *
     * @param notice announcement information
     * @return announcement collection
     */
    public List<SysNotice> selectNoticeList(SysNotice notice);

    /**
     * New announcement
     *
     * @param notice announcement information
     * @return result
     */
    public int insertNotice(SysNotice notice);

    /**
     * Modification announcement
     *
     * @param notice announcement information
     * @return result
     */
    public int updateNotice(SysNotice notice);

    /**
     * Delete announcement information
     *
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteNoticeByIds(String ids);
}
