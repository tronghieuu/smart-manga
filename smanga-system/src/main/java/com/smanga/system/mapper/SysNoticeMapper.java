package com.smanga.system.mapper;

import java.util.List;

import com.smanga.system.domain.SysNotice;

/**
 * Announcement data layer
 *
 * @author Trong Hieu
 */
public interface SysNoticeMapper
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
     * Delete announcements in bulk
     *
     * @param noticeIds ID of the data to be deleted
     * @return result
     */
    public int deleteNoticeByIds(String[] noticeIds);
}