package com.smanga.framework.shiro.session;

import java.io.Serializable;
import java.util.Date;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.smanga.common.enums.OnlineStatus;
import com.smanga.framework.manager.AsyncManager;
import com.smanga.framework.manager.factory.AsyncFactory;
import com.smanga.framework.shiro.service.SysShiroService;

/**
 * Db operation for custom ShiroSession
 * 
 * @author Trong Hieu
 */
public class OnlineSessionDAO extends EnterpriseCacheSessionDAO {
	/**
	 * The period of synchronizing session to database, in milliseconds (default 1 minute)
	 */
	@Value("${shiro.session.dbSyncPeriod}")
	private int dbSyncPeriod;

	/**
	 * Timestamp of the last time the database was synchronized
	 */
	private static final String LAST_SYNC_DB_TIMESTAMP = OnlineSessionDAO.class.getName() + "LAST_SYNC_DB_TIMESTAMP";

	@Autowired
	private SysShiroService sysShiroService;

	public OnlineSessionDAO() {
		super();
	}

	public OnlineSessionDAO(long expireTime) {
		super();
	}

	/**
	 * Get the session based on the session ID
	 *
	 * @param sessionId Session id
	 * @return ShiroSession
	 */
	@Override
	protected Session doReadSession(Serializable sessionId) {
		return sysShiroService.getSession(sessionId);
	}

	@Override
	public void update(Session session) throws UnknownSessionException {
		super.update(session);
	}

	/**
	 * Update the session; such as update the last access time of the session/stop the session/set the timeout time/set the removal property, etc. will be called
	 */
	public void syncToDb(OnlineSession onlineSession) {
		Date lastSyncTimestamp = (Date) onlineSession.getAttribute(LAST_SYNC_DB_TIMESTAMP);
		if (lastSyncTimestamp != null) {
			boolean needSync = true;
			long deltaTime = onlineSession.getLastAccessTime().getTime() - lastSyncTimestamp.getTime();
			if (deltaTime < dbSyncPeriod * 60 * 1000) {
				// Insufficient time difference, no need to synchronize
				needSync = false;
			}
			// isGuest = true Visitors
			boolean isGuest = onlineSession.getUserId() == null || onlineSession.getUserId() == 0L;

			// The session data has changed. Synchronization
			if (!isGuest && onlineSession.isAttributeChanged()) {
				needSync = true;
			}

			if (!needSync) {
				return;
			}
		}
		// Update the last synchronization database time
		onlineSession.setAttribute(LAST_SYNC_DB_TIMESTAMP, onlineSession.getLastAccessTime());
		// After updating, reset the logo
		if (onlineSession.isAttributeChanged()) {
			onlineSession.resetAttributeChanged();
		}
		AsyncManager.me().execute(AsyncFactory.syncSessionToDb(onlineSession));
	}

	/**
	 * When the session expires/stops (such as when the user logs out) properties, etc. will be called
	 */
	@Override
	protected void doDelete(Session session) {
		OnlineSession onlineSession = (OnlineSession) session;
		if (null == onlineSession) {
			return;
		}
		onlineSession.setStatus(OnlineStatus.off_line);
		sysShiroService.deleteSession(onlineSession);
	}
}
