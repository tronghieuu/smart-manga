package com.smanga.framework.shiro.realm;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.smanga.business.domain.BusinessUser;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.exception.user.CaptchaException;
import com.smanga.common.exception.user.RoleBlockedException;
import com.smanga.common.exception.user.UserBlockedException;
import com.smanga.common.exception.user.UserNotExistsException;
import com.smanga.common.exception.user.UserPasswordNotMatchException;
import com.smanga.common.exception.user.UserPasswordRetryLimitExceedException;
import com.smanga.framework.shiro.service.SysLoginService;
import com.smanga.framework.shiro.util.ShiroUtils;
import com.smanga.system.service.ISysMenuService;
import com.smanga.system.service.ISysRoleService;

/**
 * Custom Realm to handle login permissions
 * 
 * @author Trong Hieu
 */
public class UserRealm extends AuthorizingRealm {
	private static final Logger log = LoggerFactory.getLogger(UserRealm.class);

	@Autowired
	private ISysMenuService menuService;

	@Autowired
	private ISysRoleService roleService;

	@Autowired
	private SysLoginService loginService;

	/**
	 * Authorization
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		BusinessUser user = ShiroUtils.getSysUser();
		// list of roles
		Set<String> roles = new HashSet<String>();
		// function list
		Set<String> menus = new HashSet<String>();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// The administrator has all permissions

		return info;
	}

	/**
	 * Login authentication
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername();
		String password = "";
		if (upToken.getPassword() != null) {
			password = new String(upToken.getPassword());
		}

		SysUser user = null;
		try {
			user = loginService.login(username, password);
		} catch (CaptchaException e) {
			throw new AuthenticationException(e.getMessage(), e);
		} catch (UserNotExistsException e) {
			throw new UnknownAccountException(e.getMessage(), e);
		} catch (UserPasswordNotMatchException e) {
			throw new IncorrectCredentialsException(e.getMessage(), e);
		} catch (UserPasswordRetryLimitExceedException e) {
			throw new ExcessiveAttemptsException(e.getMessage(), e);
		} catch (UserBlockedException e) {
			throw new LockedAccountException(e.getMessage(), e);
		} catch (RoleBlockedException e) {
			throw new LockedAccountException(e.getMessage(), e);
		} catch (Exception e) {
			log.info("Login verification for user [" + username + "].. verification failed {}", e.getMessage());
			throw new AuthenticationException(e.getMessage(), e);
		}
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, getName());
		return info;
	}

	/**
	 * Clear the specified user authorization information cache
	 */
	public void clearCachedAuthorizationInfo(Object principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
		this.clearCachedAuthorizationInfo(principals);
	}

	/**
	 * Clean up all user authorization information cache
	 */
	public void clearAllCachedAuthorizationInfo() {
		Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		if (cache != null) {
			for (Object key : cache.keys()) {
				cache.remove(key);
			}
		}
	}
}
