package com.smanga.framework.shiro.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;

import com.smanga.business.domain.BusinessUser;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.bean.BeanUtils;

/**
 * shiro tools
 * 
 * @author Trong Hieu
 */
public class ShiroUtils {
	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	public static void logout() {
		getSubject().logout();
	}

	public static BusinessUser getSysUser() {
		BusinessUser user = null;
		Object obj = getSubject().getPrincipal();
		if (StringUtils.isNotNull(obj)) {
			user = new BusinessUser();
			BeanUtils.copyBeanProp(user, obj);
		}
		return user;
	}

	public static void setSysUser(SysUser user) {
		Subject subject = getSubject();
		PrincipalCollection principalCollection = subject.getPrincipals();
		String realmName = principalCollection.getRealmNames().iterator().next();
		PrincipalCollection newPrincipalCollection = new SimplePrincipalCollection(user, realmName);
		// Reload Principal
		subject.runAs(newPrincipalCollection);
	}

	public static Long getUserId() {
		return getSysUser().getUserId().longValue();
	}

	public static String getLoginName() {
		return getSysUser().getLoginName();
	}

	public static String getIp() {
		return getSubject().getSession().getHost();
	}

	public static String getSessionId() {
		return String.valueOf(getSubject().getSession().getId());
	}

	/**
	 * Generate random salt
	 */
	public static String randomSalt() {
		// A Byte occupies two bytes, the 3 bytes generated here, the string length is 6
		SecureRandomNumberGenerator secureRandom = new SecureRandomNumberGenerator();
		String hex = secureRandom.nextBytes(3).toHex();
		return hex;
	}
}
