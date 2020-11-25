package com.smanga.framework.shiro.service;

import java.io.Serializable;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smanga.common.utils.StringUtils;
import com.smanga.framework.shiro.session.OnlineSession;
import com.smanga.system.domain.SysUserOnline;
import com.smanga.system.service.ISysUserOnlineService;

/**
 * Session db operation processing
 * 
 * @author Trong Hieu
 */
@Component
public class SysShiroService {
	@Autowired
	private ISysUserOnlineService onlineService;

	/**
	 * Delete conversation
	 *
	 * @param onlineSession Session information
	 */
	public void deleteSession(OnlineSession onlineSession) {
		onlineService.deleteOnlineById(String.valueOf(onlineSession.getId()));
	}

	/**
	 * Get session information
	 *
	 * @param sessionId
	 * @return
	 */
	public Session getSession(Serializable sessionId) {
		SysUserOnline userOnline = onlineService.selectOnlineById(String.valueOf(sessionId));
		return StringUtils.isNull(userOnline) ? null : createSession(userOnline);
	}

	public Session createSession(SysUserOnline userOnline) {
		OnlineSession onlineSession = new OnlineSession();
		if (StringUtils.isNotNull(userOnline)) {
			onlineSession.setId(userOnline.getSessionId());
			onlineSession.setHost(userOnline.getIpaddr());
			onlineSession.setBrowser(userOnline.getBrowser());
			onlineSession.setOs(userOnline.getOs());
			onlineSession.setDeptName(userOnline.getDeptName());
			onlineSession.setLoginName(userOnline.getLoginName());
			onlineSession.setStartTimestamp(userOnline.getStartTimestamp());
			onlineSession.setLastAccessTime(userOnline.getLastAccessTime());
			onlineSession.setTimeout(userOnline.getExpireTime());
		}
		return onlineSession;
	}
}
