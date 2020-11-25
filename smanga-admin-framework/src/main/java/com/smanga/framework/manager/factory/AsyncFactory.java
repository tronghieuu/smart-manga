package com.smanga.framework.manager.factory;

import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smanga.common.constant.Constants;
import com.smanga.common.utils.AddressUtils;
import com.smanga.common.utils.LogUtils;
import com.smanga.common.utils.ServletUtils;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.spring.SpringUtils;
import com.smanga.framework.shiro.session.OnlineSession;
import com.smanga.system.domain.SysLogininfor;
import com.smanga.system.domain.SysOperLog;
import com.smanga.system.domain.SysUserOnline;
import com.smanga.system.service.ISysOperLogService;
import com.smanga.system.service.ISysUserOnlineService;
import com.smanga.system.service.impl.SysLogininforServiceImpl;

import eu.bitwalker.useragentutils.UserAgent;

/**
 * Asynchronous factory (for generating tasks)
 * 
 * @author Trong Hieu
 *
 */
public class AsyncFactory {
	private static final Logger sys_user_logger = LoggerFactory.getLogger("sys-user");

	/**
	 * Synchronize session to database
	 * 
	 * @param session Online user session
	 * @return Task
	 */
	public static TimerTask syncSessionToDb(final OnlineSession session) {
		return new TimerTask() {
			@Override
			public void run() {
				SysUserOnline online = new SysUserOnline();
				online.setSessionId(String.valueOf(session.getId()));
				online.setDeptName(session.getDeptName());
				online.setLoginName(session.getLoginName());
				online.setStartTimestamp(session.getStartTimestamp());
				online.setLastAccessTime(session.getLastAccessTime());
				online.setExpireTime(session.getTimeout());
				online.setIpaddr(session.getHost());
				online.setLoginLocation(AddressUtils.getRealAddressByIP(session.getHost()));
				online.setBrowser(session.getBrowser());
				online.setOs(session.getOs());
				online.setStatus(session.getStatus());
				SpringUtils.getBean(ISysUserOnlineService.class).saveOnline(online);

			}
		};
	}

	/**
	 * Operation log record
	 * 
	 * @param operLog Operation log information
	 * @return Task
	 */
	public static TimerTask recordOper(final SysOperLog operLog) {
		return new TimerTask() {
			@Override
			public void run() {
				// Remote query operation location
				operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
				SpringUtils.getBean(ISysOperLogService.class).insertOperlog(operLog);
			}
		};
	}

	/**
	 * Record login information
	 * 
	 * @param username username
	 * @param status   status
	 * @param message  news
	 * @param args     List
	 * @return Task
	 */
	public static TimerTask recordLogininfor(final String username, final String status, final String message,
			final Object... args) {
		final UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
		final String ip = ShiroUtils.getIp();
		return new TimerTask() {
			@Override
			public void run() {
				String address = AddressUtils.getRealAddressByIP(ip);
				StringBuilder s = new StringBuilder();
				s.append(LogUtils.getBlock(ip));
				s.append(address);
				s.append(LogUtils.getBlock(username));
				s.append(LogUtils.getBlock(status));
				s.append(LogUtils.getBlock(message));
				// Print information to log
				sys_user_logger.info(s.toString(), args);
				// Get the client operating system
				String os = userAgent.getOperatingSystem().getName();
				// Get the client browser
				String browser = userAgent.getBrowser().getName();
				// Package object
				SysLogininfor logininfor = new SysLogininfor();
				logininfor.setLoginName(username);
				logininfor.setIpaddr(ip);
				logininfor.setLoginLocation(address);
				logininfor.setBrowser(browser);
				logininfor.setOs(os);
				logininfor.setMsg(message);
				// Log status
				if (StringUtils.equalsAny(status, Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
					logininfor.setStatus(Constants.SUCCESS);
				} else if (Constants.LOGIN_FAIL.equals(status)) {
					logininfor.setStatus(Constants.FAIL);
				}
				// Insert data
				SpringUtils.getBean(SysLogininforServiceImpl.class).insertLogininfor(logininfor);
			}
		};
	}
}
