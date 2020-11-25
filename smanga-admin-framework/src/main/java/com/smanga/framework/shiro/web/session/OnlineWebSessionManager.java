package com.smanga.framework.shiro.web.session;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.shiro.session.ExpiredSessionException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smanga.common.constant.ShiroConstants;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.bean.BeanUtils;
import com.smanga.common.utils.spring.SpringUtils;
import com.smanga.framework.shiro.session.OnlineSession;
import com.smanga.system.domain.SysUserOnline;
import com.smanga.system.service.ISysUserOnlineService;

/**
 * The main reason is that if the properties of the session are modified, mark the modification and then facilitate OnlineSessionDao synchronization
 * 
 * @author Trong Hieu
 */
public class OnlineWebSessionManager extends DefaultWebSessionManager {
	private static final Logger log = LoggerFactory.getLogger(OnlineWebSessionManager.class);

	@Override
	public void setAttribute(SessionKey sessionKey, Object attributeKey, Object value) throws InvalidSessionException {
		super.setAttribute(sessionKey, attributeKey, value);
		if (value != null && needMarkAttributeChanged(attributeKey)) {
			OnlineSession session = getOnlineSession(sessionKey);
			session.markAttributeChanged();
		}
	}

	private boolean needMarkAttributeChanged(Object attributeKey) {
		if (attributeKey == null) {
			return false;
		}
		String attributeKeyStr = attributeKey.toString();
		// Optimized flash properties do not need to be persistent
		if (attributeKeyStr.startsWith("org.springframework")) {
			return false;
		}
		if (attributeKeyStr.startsWith("javax.servlet")) {
			return false;
		}
		if (attributeKeyStr.equals(ShiroConstants.CURRENT_USERNAME)) {
			return false;
		}
		return true;
	}

	@Override
	public Object removeAttribute(SessionKey sessionKey, Object attributeKey) throws InvalidSessionException {
		Object removed = super.removeAttribute(sessionKey, attributeKey);
		if (removed != null) {
			OnlineSession s = getOnlineSession(sessionKey);
			s.markAttributeChanged();
		}

		return removed;
	}

	public OnlineSession getOnlineSession(SessionKey sessionKey) {
		OnlineSession session = null;
		Object obj = doGetSession(sessionKey);
		if (StringUtils.isNotNull(obj)) {
			session = new OnlineSession();
			BeanUtils.copyBeanProp(session, obj);
		}
		return session;
	}

	/**
	 * Verify that the session is valid for deleting expired sessions
	 */
	@Override
	public void validateSessions() {
		if (log.isInfoEnabled()) {
			log.info("invalidation sessions...");
		}

		int invalidCount = 0;

		int timeout = (int) this.getGlobalSessionTimeout();
		if (timeout < 0) {
			// Never expire without processing
			return;
		}
		Date expiredDate = DateUtils.addMilliseconds(new Date(), 0 - timeout);
		ISysUserOnlineService userOnlineService = SpringUtils.getBean(ISysUserOnlineService.class);
		List<SysUserOnline> userOnlineList = userOnlineService.selectOnlineByExpired(expiredDate);
		// Batch expiration delete
		List<String> needOfflineIdList = new ArrayList<String>();
		for (SysUserOnline userOnline : userOnlineList) {
			try {
				SessionKey key = new DefaultSessionKey(userOnline.getSessionId());
				Session session = retrieveSession(key);
				if (session != null) {
					throw new InvalidSessionException();
				}
			} catch (InvalidSessionException e) {
				if (log.isDebugEnabled()) {
					boolean expired = (e instanceof ExpiredSessionException);
					String msg = "Invalidated session with id [" + userOnline.getSessionId() + "]"
							+ (expired ? " (expired)" : " (stopped)");
					log.debug(msg);
				}
				invalidCount++;
				needOfflineIdList.add(userOnline.getSessionId());
				userOnlineService.removeUserCache(userOnline.getLoginName(), userOnline.getSessionId());
			}

		}
		if (needOfflineIdList.size() > 0) {
			try {
				userOnlineService.batchDeleteOnline(needOfflineIdList);
			} catch (Exception e) {
				log.error("batch delete db session error.", e);
			}
		}

		if (log.isInfoEnabled()) {
			String msg = "Finished invalidation session.";
			if (invalidCount > 0) {
				msg += " [" + invalidCount + "] sessions were stopped.";
			} else {
				msg += " No sessions were stopped.";
			}
			log.info(msg);
		}

	}

	@Override
	protected Collection<Session> getActiveSessions() {
		throw new UnsupportedOperationException("getActiveSessions method not supported");
	}
}
