package com.smanga.framework.shiro.service;

import java.util.concurrent.atomic.AtomicInteger;

import javax.annotation.PostConstruct;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.smanga.business.domain.BusinessUser;
import com.smanga.common.constant.Constants;
import com.smanga.common.constant.ShiroConstants;
import com.smanga.common.exception.user.UserPasswordNotMatchException;
import com.smanga.common.exception.user.UserPasswordRetryLimitExceedException;
import com.smanga.common.utils.MessageUtils;
import com.smanga.framework.manager.AsyncManager;
import com.smanga.framework.manager.factory.AsyncFactory;

/**
 * Login password method
 * 
 * @author Trong Hieu
 */
@Component
public class SysPasswordService {
	@Autowired
	private CacheManager cacheManager;

	private Cache<String, AtomicInteger> loginRecordCache;

	@Value(value = "${user.password.maxRetryCount}")
	private String maxRetryCount;

	@PostConstruct
	public void init() {
		loginRecordCache = cacheManager.getCache(ShiroConstants.LOGINRECORDCACHE);
	}

	public void validate(BusinessUser user, String password) {
		String loginName = user.getLoginName();

		AtomicInteger retryCount = loginRecordCache.get(loginName);

		if (retryCount == null) {
			retryCount = new AtomicInteger(0);
			loginRecordCache.put(loginName, retryCount);
		}
		if (retryCount.incrementAndGet() > Integer.valueOf(maxRetryCount).intValue()) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.LOGIN_FAIL,
					MessageUtils.message("user.password.retry.limit.exceed", maxRetryCount)));
			throw new UserPasswordRetryLimitExceedException(Integer.valueOf(maxRetryCount).intValue());
		}

		if (!matches(user, password)) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.LOGIN_FAIL,
					MessageUtils.message("user.password.retry.limit.count", retryCount)));
			loginRecordCache.put(loginName, retryCount);
			throw new UserPasswordNotMatchException();
		} else {
			clearLoginRecordCache(loginName);
		}
	}

	public boolean matches(BusinessUser user, String newPassword) {
		return user.getPassword().equals(encryptPassword(user.getLoginName(), newPassword, user.getSalt()));
	}

	public void clearLoginRecordCache(String loginName) {
		loginRecordCache.remove(loginName);
	}

	public String encryptPassword(String loginName, String password, String salt) {
		return new Md5Hash(loginName + password + salt).toHex();
	}
}
