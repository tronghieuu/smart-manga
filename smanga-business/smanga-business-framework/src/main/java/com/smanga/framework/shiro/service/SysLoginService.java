package com.smanga.framework.shiro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.smanga.business.domain.BusinessUser;
import com.smanga.business.service.IBusinessUserService;
import com.smanga.common.constant.Constants;
import com.smanga.common.constant.ShiroConstants;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.enums.UserStatus;
import com.smanga.common.exception.user.CaptchaException;
import com.smanga.common.exception.user.UserBlockedException;
import com.smanga.common.exception.user.UserDeleteException;
import com.smanga.common.exception.user.UserNotExistsException;
import com.smanga.common.exception.user.UserPasswordNotMatchException;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.MessageUtils;
import com.smanga.common.utils.ServletUtils;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.framework.manager.AsyncManager;
import com.smanga.framework.manager.factory.AsyncFactory;

/**
 * Login verification method
 * 
 * @author Trong Hieu
 */
@Component
public class SysLoginService {
	@Autowired
	private SysPasswordService passwordService;

//	@Autowired
//	private ISysUserService userService;

	@Autowired
	private IBusinessUserService businessUserService;

	/**
	 * log in
	 */
	public BusinessUser login(String username, String password) {
		// Verification code verification
		if (ShiroConstants.CAPTCHA_ERROR
				.equals(ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA))) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
					MessageUtils.message("user.jcaptcha.error")));
			throw new CaptchaException();
		}
		// Username or password is empty error
		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			AsyncManager.me().execute(
					AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null")));
			throw new UserNotExistsException();
		}
		// If the password is not in the specified range, error
		if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
				|| password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
					MessageUtils.message("user.password.not.match")));
			throw new UserPasswordNotMatchException();
		}

		// Username is not in the specified range error
		if (username.length() < UserConstants.USERNAME_MIN_LENGTH
				|| username.length() > UserConstants.USERNAME_MAX_LENGTH) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
					MessageUtils.message("user.password.not.match")));
			throw new UserPasswordNotMatchException();
		}

		// Query user information
//		SysUser user = userService.selectUserByLoginName(username);
		BusinessUser user = businessUserService.selectUserByLoginName(username);

		/**
		 * if (user == null && maybeMobilePhoneNumber(username)) { user =
		 * userService.selectUserByPhoneNumber(username); }
		 * 
		 * if (user == null && maybeEmail(username)) { user =
		 * userService.selectUserByEmail(username); }
		 */

		if (user == null) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
					MessageUtils.message("user.not.exists")));
			throw new UserNotExistsException();
		}

		if (UserStatus.DELETED.getCode().equals(user.getDelFlag())) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
					MessageUtils.message("user.password.delete")));
			throw new UserDeleteException();
		}

		if (UserStatus.DISABLE.getCode().equals(user.getStatus())) {
			AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL,
					MessageUtils.message("user.blocked", user.getRemark())));
			throw new UserBlockedException();
		}

		passwordService.validate(user, password);

		AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS,
				MessageUtils.message("user.login.success")));
		recordLoginInfo(user);
		return user;
	}

	/**
	 * private boolean maybeEmail(String username) { if
	 * (!username.matches(UserConstants.EMAIL_PATTERN)) { return false; } return
	 * true; }
	 * 
	 * private boolean maybeMobilePhoneNumber(String username) { if
	 * (!username.matches(UserConstants.MOBILE_PHONE_NUMBER_PATTERN)) { return
	 * false; } return true; }
	 */

	/**
	 * Record login information
	 */
	public void recordLoginInfo(BusinessUser user) {
		user.setLoginIp(ShiroUtils.getIp());
		user.setLoginDate(DateUtils.getNowDate());
		businessUserService.updateBusinessUser(user);
	}
}
