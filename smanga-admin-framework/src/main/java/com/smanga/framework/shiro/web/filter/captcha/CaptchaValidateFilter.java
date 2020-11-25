package com.smanga.framework.shiro.web.filter.captcha;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.filter.AccessControlFilter;

import com.google.code.kaptcha.Constants;
import com.smanga.common.constant.ShiroConstants;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.StringUtils;

/**
 * Verification code filter
 * 
 * @author Trong Hieu
 */
public class CaptchaValidateFilter extends AccessControlFilter {
	/**
	 * Whether to open the verification code
	 */
	private boolean captchaEnabled = true;

	/**
	 * Verification code type
	 */
	private String captchaType = "math";

	public void setCaptchaEnabled(boolean captchaEnabled) {
		this.captchaEnabled = captchaEnabled;
	}

	public void setCaptchaType(String captchaType) {
		this.captchaType = captchaType;
	}

	@Override
	public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		request.setAttribute(ShiroConstants.CURRENT_ENABLED, captchaEnabled);
		request.setAttribute(ShiroConstants.CURRENT_TYPE, captchaType);
		return super.onPreHandle(request, response, mappedValue);
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		// Verification code is disabled or not form submission Allow access
		if (captchaEnabled == false || !"post".equals(httpServletRequest.getMethod().toLowerCase())) {
			return true;
		}
		return validateResponse(httpServletRequest,
				httpServletRequest.getParameter(ShiroConstants.CURRENT_VALIDATECODE));
	}

	public boolean validateResponse(HttpServletRequest request, String validateCode) {
		Object obj = ShiroUtils.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		String code = String.valueOf(obj != null ? obj : "");
		// The verification code is cleared to prevent multiple use.
		request.getSession().removeAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (StringUtils.isEmpty(validateCode) || !validateCode.equalsIgnoreCase(code)) {
			return false;
		}
		return true;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		request.setAttribute(ShiroConstants.CURRENT_CAPTCHA, ShiroConstants.CAPTCHA_ERROR);
		return true;
	}
}
