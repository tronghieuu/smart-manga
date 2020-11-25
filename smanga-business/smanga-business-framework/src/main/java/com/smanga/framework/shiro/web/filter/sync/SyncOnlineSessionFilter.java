package com.smanga.framework.shiro.web.filter.sync;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import com.smanga.common.constant.ShiroConstants;
import com.smanga.framework.shiro.session.OnlineSession;
import com.smanga.framework.shiro.session.OnlineSessionDAO;

/**
 * Synchronize session data to Db
 * 
 * @author Trong Hieu
 */
public class SyncOnlineSessionFilter extends PathMatchingFilter {
	@Autowired
	private OnlineSessionDAO onlineSessionDAO;

	/**
	 * Synchronize session data to DB. Synchronize at most once per request to prevent excessive processing and need to be placed before Shiro filter
	 */
	@Override
	protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		OnlineSession session = (OnlineSession) request.getAttribute(ShiroConstants.ONLINE_SESSION);
		// If the session is stopped, it will not be synchronized
		// Session stop time, if stopTimestamp is not null, it means it has stopped
		if (session != null && session.getUserId() != null && session.getStopTimestamp() == null) {
			onlineSessionDAO.syncToDb(session);
		}
		return true;
	}
}
