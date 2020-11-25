package com.smanga.framework.shiro.web.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smanga.common.constant.Constants;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.utils.MessageUtils;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.spring.SpringUtils;
import com.smanga.framework.manager.AsyncManager;
import com.smanga.framework.manager.factory.AsyncFactory;
import com.smanga.system.service.ISysUserOnlineService;

/**
 * Exit filter
 * 
 * @author Trong Hieu
 */
public class LogoutFilter extends org.apache.shiro.web.filter.authc.LogoutFilter {
	private static final Logger log = LoggerFactory.getLogger(LogoutFilter.class);

	/**
	 * Address to redirect after logout
	 */
	private String loginUrl;

	public String getLoginUrl() {
		return loginUrl;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}

	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		try {
			Subject subject = getSubject(request, response);
			String redirectUrl = getRedirectUrl(request, response, subject);
			try {
				SysUser user = ShiroUtils.getSysUser();
				if (StringUtils.isNotNull(user)) {
					String loginName = user.getLoginName();
					// Record user exit log
					AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.LOGOUT,
							MessageUtils.message("user.logout.success")));
					// Clear cache
					SpringUtils.getBean(ISysUserOnlineService.class).removeUserCache(loginName,
							ShiroUtils.getSessionId());
				}
				// sign out
				subject.logout();
			} catch (SessionException ise) {
				log.error("logout fail.", ise);
			}
			issueRedirect(request, response, redirectUrl);
		} catch (Exception e) {
			log.error("Encountered session exception during logout.  This can generally safely be ignored.", e);
		}
		return false;
	}

	/**
	 * Exit redirect URL
	 */
	@Override
	protected String getRedirectUrl(ServletRequest request, ServletResponse response, Subject subject) {
		String url = getLoginUrl();
		if (StringUtils.isNotEmpty(url)) {
			return url;
		}
		return super.getRedirectUrl(request, response, subject);
	}
}
