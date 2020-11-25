package com.smanga.framework.shiro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.smanga.common.constant.Constants;
import com.smanga.common.constant.ShiroConstants;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.MessageUtils;
import com.smanga.common.utils.ServletUtils;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.framework.manager.AsyncManager;
import com.smanga.framework.manager.factory.AsyncFactory;
import com.smanga.system.service.ISysUserService;

/**
 * Registration verification method
 * 
 * @author Trong Hieu
 */
@Component
public class SysRegisterService {
	@Autowired
	private ISysUserService userService;

	@Autowired
	private SysPasswordService passwordService;

	/**
	 * Registered
	 */
	public String register(SysUser user) {
		String msg = "", loginName = user.getLoginName(), password = user.getPassword();

		if (!StringUtils.isEmpty(ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA))) {
			msg = "Verification code error";
		} else if (StringUtils.isEmpty(loginName)) {
			msg = "Username can not be empty";
		} else if (StringUtils.isEmpty(password)) {
			msg = "User password cannot be empty";
		} else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
				|| password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
			msg = "Password length must be between 5 and 20 characters";
		} else if (loginName.length() < UserConstants.USERNAME_MIN_LENGTH
				|| loginName.length() > UserConstants.USERNAME_MAX_LENGTH) {
			msg = "The account length must be between 2 and 20 characters";
		} else if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(loginName))) {
			msg = "Saving user '" + loginName + "' failed, the registered account already exists";
		} else {
			user.setPwdUpdateDate(DateUtils.getNowDate());
			user.setUserName(loginName);
			user.setSalt(ShiroUtils.randomSalt());
			user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
			boolean regFlag = userService.registerUser(user);
			if (!regFlag) {
				msg = "Registration failed, please contact the system administrator";
			} else {
				AsyncManager.me().execute(AsyncFactory.recordLogininfor(loginName, Constants.REGISTER,
						MessageUtils.message("user.register.success")));
			}
		}
		return msg;
	}
}
