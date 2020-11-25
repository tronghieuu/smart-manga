package com.smanga.system.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.Deque;
import java.util.List;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.constant.ShiroConstants;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.system.domain.SysUserOnline;
import com.smanga.system.mapper.SysUserOnlineMapper;
import com.smanga.system.service.ISysUserOnlineService;

/**
 * Online user service layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysUserOnlineServiceImpl implements ISysUserOnlineService {
	@Autowired
	private SysUserOnlineMapper userOnlineDao;

	@Autowired
	private EhCacheManager ehCacheManager;

	/**
	 * Query information by session serial number
	 *
	 * @param sessionId session ID
	 * @return online user information
	 */
	@Override
	public SysUserOnline selectOnlineById(String sessionId) {
		return userOnlineDao.selectOnlineById(sessionId);
	}

	/**
	 * Delete information by session number
	 *
	 * @param sessionId session ID
	 * @return online user information
	 */
	@Override
	public void deleteOnlineById(String sessionId) {
		SysUserOnline userOnline = selectOnlineById(sessionId);
		if (StringUtils.isNotNull(userOnline)) {
			userOnlineDao.deleteOnlineById(sessionId);
		}
	}

	/**
	 * Delete information by session number
	 *
	 * @param sessions session ID collection
	 * @return online user information
	 */
	@Override
	public void batchDeleteOnline(List<String> sessions) {
		for (String sessionId : sessions) {
			SysUserOnline userOnline = selectOnlineById(sessionId);
			if (StringUtils.isNotNull(userOnline)) {
				userOnlineDao.deleteOnlineById(sessionId);
			}
		}
	}

	/**
	 * Save session information
	 *
	 * @param online session information
	 */
	@Override
	public void saveOnline(SysUserOnline online) {
		userOnlineDao.saveOnline(online);
	}

	/**
	 * Query session collection
	 *
	 * @param userOnline online users
	 */
	@Override
	public List<SysUserOnline> selectUserOnlineList(SysUserOnline userOnline) {
		return userOnlineDao.selectUserOnlineList(userOnline);
	}

	/**
	 * Forcibly log out users
	 *
	 * @param sessionId session ID
	 */
	@Override
	public void forceLogout(String sessionId) {
		userOnlineDao.deleteOnlineById(sessionId);
	}

	/**
	 * Clean user cache
	 *
	 * @param loginName login name
	 * @param sessionId session ID
	 */
	@Override
	public void removeUserCache(String loginName, String sessionId) {
		Cache<String, Deque<Serializable>> cache = ehCacheManager.getCache(ShiroConstants.SYS_USERCACHE);
		Deque<Serializable> deque = cache.get(loginName);
		if (StringUtils.isEmpty(deque) || deque.size() == 0) {
			return;
		}
		deque.remove(sessionId);
	}

	/**
	 * Query session collection
	 *
	 * @param expiredDate expiration date
	 */
	@Override
	public List<SysUserOnline> selectOnlineByExpired(Date expiredDate) {
		String lastAccessTime = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, expiredDate);
		return userOnlineDao.selectOnlineByExpired(lastAccessTime);
	}
}
