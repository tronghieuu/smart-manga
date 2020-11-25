package com.smanga.framework.shiro.web.session;

import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.shiro.session.mgt.DefaultSessionManager;
import org.apache.shiro.session.mgt.SessionValidationScheduler;
import org.apache.shiro.session.mgt.ValidatingSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import com.smanga.common.utils.Threads;

/**
 * Custom task scheduler completed
 * 
 * @author Trong Hieu
 */
@Component
public class SpringSessionValidationScheduler implements SessionValidationScheduler {
	private static final Logger log = LoggerFactory.getLogger(SpringSessionValidationScheduler.class);

	public static final long DEFAULT_SESSION_VALIDATION_INTERVAL = DefaultSessionManager.DEFAULT_SESSION_VALIDATION_INTERVAL;

	/**
	 * The timer is used to handle the timeout suspension request, and is also used to reconnect when the connection is disconnected.
	 */
	@Autowired
	@Qualifier("scheduledExecutorService")
	private ScheduledExecutorService executorService;

	private volatile boolean enabled = false;

	/**
	 * Session authentication manager
	 */
	@Autowired
	@Qualifier("sessionManager")
	@Lazy
	private ValidatingSessionManager sessionManager;

	// How often to check the validity of the session, in milliseconds, the default is 10 minutes
	@Value("${shiro.session.validationInterval}")
	private long sessionValidationInterval;

	@Override
	public boolean isEnabled() {
		return this.enabled;
	}

	/**
	 * Specifies how frequently (in milliseconds) this Scheduler will call the
	 * {@link org.apache.shiro.session.mgt.ValidatingSessionManager#validateSessions()
	 * ValidatingSessionManager#validateSessions()} method.
	 *
	 * <p>
	 * Unless this method is called, the default value is
	 * {@link #DEFAULT_SESSION_VALIDATION_INTERVAL}.
	 *
	 * @param sessionValidationInterval
	 */
	public void setSessionValidationInterval(long sessionValidationInterval) {
		this.sessionValidationInterval = sessionValidationInterval;
	}

	/**
	 * Starts session validation by creating a spring PeriodicTrigger.
	 */
	@Override
	public void enableSessionValidation() {

		enabled = true;

		if (log.isDebugEnabled()) {
			log.debug("Scheduling session validation job using Spring Scheduler with "
					+ "session validation interval of [" + sessionValidationInterval + "]ms...");
		}

		try {
			executorService.scheduleAtFixedRate(new Runnable() {
				@Override
				public void run() {
					if (enabled) {
						sessionManager.validateSessions();
					}
				}
			}, 1000, sessionValidationInterval * 60 * 1000, TimeUnit.MILLISECONDS);

			this.enabled = true;

			if (log.isDebugEnabled()) {
				log.debug("Session validation job successfully scheduled with Spring Scheduler.");
			}

		} catch (Exception e) {
			if (log.isErrorEnabled()) {
				log.error(
						"Error starting the Spring Scheduler session validation job.  Session validation may not occur.",
						e);
			}
		}
	}

	@Override
	public void disableSessionValidation() {
		if (log.isDebugEnabled()) {
			log.debug("Stopping Spring Scheduler session validation job...");
		}

		if (this.enabled) {
			Threads.shutdownAndAwaitTermination(executorService);
		}
		this.enabled = false;
	}
}
