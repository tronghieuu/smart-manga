package com.smanga.framework.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.smanga.common.annotation.RepeatSubmit;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.json.JSON;
import com.smanga.common.utils.ServletUtils;

/**
 * Prevent duplicate submission interceptor
 * 
 * @author Trong Hieu
 */
@Component
public abstract class RepeatSubmitInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();
			RepeatSubmit annotation = method.getAnnotation(RepeatSubmit.class);
			if (annotation != null) {
				if (this.isRepeatSubmit(request)) {
					AjaxResult ajaxResult = AjaxResult.error("Duplicate submission is not allowed, please try again later");
					ServletUtils.renderString(response, JSON.marshal(ajaxResult));
					return false;
				}
			}
			return true;
		} else {
			return super.preHandle(request, response, handler);
		}
	}

	/**
	 * Verify whether duplicate submissions are implemented by subclasses to implement specific anti-duplicate submission rules
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public abstract boolean isRepeatSubmit(HttpServletRequest request) throws Exception;
}
