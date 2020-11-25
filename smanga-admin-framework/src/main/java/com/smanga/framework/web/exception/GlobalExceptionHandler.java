package com.smanga.framework.web.exception;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.exception.DemoModeException;
import com.smanga.common.utils.ServletUtils;
import com.smanga.common.utils.security.PermissionUtils;

/**
 * Global exception handler
 * 
 * @author Trong Hieu
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
	private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	/**
	 * Permission verification failed. If the request is ajax and return json, the normal request will jump to the page
	 */
	@ExceptionHandler(AuthorizationException.class)
	public Object handleAuthorizationException(HttpServletRequest request, AuthorizationException e) {
		log.error(e.getMessage(), e);
		if (ServletUtils.isAjaxRequest(request)) {
			return AjaxResult.error(PermissionUtils.getMsg(e.getMessage()));
		} else {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("error/unauth");
			return modelAndView;
		}
	}

	/**
	 * Request method not supported
	 */
	@ExceptionHandler({ HttpRequestMethodNotSupportedException.class })
	public AjaxResult handleException(HttpRequestMethodNotSupportedException e) {
		log.error(e.getMessage(), e);
		return AjaxResult.error("Does not support '"+ e.getMethod() + "' request");
	}

	/**
	 * Intercept unknown runtime exceptions
	 */
	@ExceptionHandler(RuntimeException.class)
	public AjaxResult notFount(RuntimeException e) {
		log.error("Runtime exception: ", e);
		return AjaxResult.error("Runtime exception: " + e.getMessage());
	}

	/**
	 * System exception
	 */
	@ExceptionHandler(Exception.class)
	public AjaxResult handleException(Exception e) {
		log.error(e.getMessage(), e);
		return AjaxResult.error("Server error, please contact the administrator");
	}

	/**
	 * Business exception
	 */
	@ExceptionHandler(BusinessException.class)
	public Object businessException(HttpServletRequest request, BusinessException e) {
		log.error(e.getMessage(), e);
		if (ServletUtils.isAjaxRequest(request)) {
			return AjaxResult.error(e.getMessage());
		} else {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("errorMessage", e.getMessage());
			modelAndView.setViewName("error/business");
			return modelAndView;
		}
	}

	/**
	 * Custom validation exception
	 */
	@ExceptionHandler(BindException.class)
	public AjaxResult validatedBindException(BindException e) {
		log.error(e.getMessage(), e);
		String message = e.getAllErrors().get(0).getDefaultMessage();
		return AjaxResult.error(message);
	}

	/**
	 * Demo mode is abnormal
	 */
	@ExceptionHandler(DemoModeException.class)
	public AjaxResult demoModeException(DemoModeException e) {
		return AjaxResult.error("Demo mode, operation is not allowed");
	}
}
