package com.smanga.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.core.text.Convert;
import com.smanga.system.domain.SysNotice;
import com.smanga.system.mapper.SysNoticeMapper;
import com.smanga.system.service.ISysNoticeService;

/**
 * Announcement Service layer implementation
 *
 * @author Trong Hieu
 * @date 2018-06-25
 */
@Service
public class SysNoticeServiceImpl implements ISysNoticeService {
	@Autowired
	private SysNoticeMapper noticeMapper;

	/**
	 * Query announcement information
	 *
	 * @param noticeId notice ID
	 * @return announcement information
	 */
	@Override
	public SysNotice selectNoticeById(Long noticeId) {
		return noticeMapper.selectNoticeById(noticeId);
	}

	/**
	 * Check the announcement list
	 *
	 * @param notice announcement information
	 * @return announcement collection
	 */
	@Override
	public List<SysNotice> selectNoticeList(SysNotice notice) {
		return noticeMapper.selectNoticeList(notice);
	}

	/**
	 * New announcement
	 *
	 * @param notice announcement information
	 * @return result
	 */
	@Override
	public int insertNotice(SysNotice notice) {
		return noticeMapper.insertNotice(notice);
	}

	/**
	 * Modification announcement
	 *
	 * @param notice announcement information
	 * @return result
	 */
	@Override
	public int updateNotice(SysNotice notice) {
		return noticeMapper.updateNotice(notice);
	}

	/**
	 * Delete the announcement object
	 *
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteNoticeByIds(String ids) {
		return noticeMapper.deleteNoticeByIds(Convert.toStrArray(ids));
	}
}
