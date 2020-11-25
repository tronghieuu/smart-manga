package com.smanga.framework.aspectj;

import java.lang.reflect.Method;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.support.spring.PropertyPreFilters;
import com.smanga.business.domain.BusinessUser;
import com.smanga.common.annotation.Log;
import com.smanga.common.enums.BusinessStatus;
import com.smanga.common.json.JSON;
import com.smanga.common.utils.ServletUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.framework.manager.AsyncManager;
import com.smanga.framework.manager.factory.AsyncFactory;
import com.smanga.framework.shiro.util.ShiroUtils;
import com.smanga.system.domain.SysOperLog;

/**
 * Operation log record processing
 * 
 * @author Trong Hieu
 */
@Aspect
@Component
public class LogAspect {
	private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

	/** Exclude sensitive attribute fields */
	public static final String[] EXCLUDE_PROPERTIES = { "password", "oldPassword", "newPassword", "confirmPassword" };

	// Configure weaving point
	@Pointcut("@annotation(com.smanga.common.annotation.Log)")
	public void logPointCut() {
	}

	/**
	 * Execute after processing the request
	 *
	 * @param joinPoint Cut-off point
	 */
	@AfterReturning(pointcut = "logPointCut()", returning = "jsonResult")
	public void doAfterReturning(JoinPoint joinPoint, Object jsonResult) {
		handleLog(joinPoint, null, jsonResult);
	}

	/**
	 * Intercept abnormal operations
	 * 
	 * @param joinPoint Cut-off point
	 * @param e         abnormal
	 */
	@AfterThrowing(value = "logPointCut()", throwing = "e")
	public void doAfterThrowing(JoinPoint joinPoint, Exception e) {
		handleLog(joinPoint, e, null);
	}

	protected void handleLog(final JoinPoint joinPoint, final Exception e, Object jsonResult) {
		try {
			// Get comments
			Log controllerLog = getAnnotationLog(joinPoint);
			if (controllerLog == null) {
				return;
			}

			// Get current user
			BusinessUser currentUser = ShiroUtils.getSysUser();

			// *========Database log=========*//
			SysOperLog operLog = new SysOperLog();
			operLog.setStatus(BusinessStatus.SUCCESS.ordinal());
			// Requested address
			String ip = ShiroUtils.getIp();
			operLog.setOperIp(ip);
			// Return parameter
			operLog.setJsonResult(StringUtils.substring(JSON.marshal(jsonResult), 0, 2000));

			operLog.setOperUrl(ServletUtils.getRequest().getRequestURI());
			if (currentUser != null) {
				operLog.setOperName(currentUser.getLoginName());
				if (StringUtils.isNotNull(currentUser.getUserType())
						&& StringUtils.isNotEmpty(currentUser.getUserType())) {
					operLog.setDeptName(currentUser.getUserType());
				}
			}

			if (e != null) {
				operLog.setStatus(BusinessStatus.FAIL.ordinal());
				operLog.setErrorMsg(StringUtils.substring(e.getMessage(), 0, 2000));
			}
			// Setting method name
			String className = joinPoint.getTarget().getClass().getName();
			String methodName = joinPoint.getSignature().getName();
			operLog.setMethod(className + "." + methodName + "()");
			// Set request method
			operLog.setRequestMethod(ServletUtils.getRequest().getMethod());
			// Process the parameters on the setting annotation
			getControllerMethodDescription(controllerLog, operLog);
			// Save the database
			AsyncManager.me().execute(AsyncFactory.recordOper(operLog));
		} catch (Exception exp) {
			// Record local exception log
			log.error("==Pre-notification exception==");
			log.error("Exception information: {}", exp.getMessage());
			exp.printStackTrace();
		}
	}

	/**
	 * Get the description of the method in the annotation for the Controller layer
	 * annotation
	 * 
	 * @param log     Log
	 * @param operLog Operation log
	 * @throws Exception
	 */
	public void getControllerMethodDescription(Log log, SysOperLog operLog) throws Exception {
		// Set action
		operLog.setBusinessType(log.businessType().ordinal());
		// Set title
		operLog.setTitle(log.title());
		// Set operator category
		operLog.setOperatorType(log.operatorType().ordinal());
		// Do you need to save request, parameters and values
		if (log.isSaveRequestData()) {
			// Get the parameter information and transfer it to the database.
			setRequestValue(operLog);
		}
	}

	/**
	 * Get the requested parameters and put them in the log
	 * 
	 * @param operLog Operation log
	 * @throws Exception abnormal
	 */
	private void setRequestValue(SysOperLog operLog) throws Exception {
		Map<String, String[]> map = ServletUtils.getRequest().getParameterMap();
		if (StringUtils.isNotEmpty(map)) {
			PropertyPreFilters.MySimplePropertyPreFilter excludefilter = new PropertyPreFilters().addFilter();
			excludefilter.addExcludes(EXCLUDE_PROPERTIES);
			String params = JSONObject.toJSONString(map, excludefilter);
			operLog.setOperParam(StringUtils.substring(params, 0, 2000));
		}
	}

	/**
	 * Whether there is an annotation, get it if it exists
	 */
	private Log getAnnotationLog(JoinPoint joinPoint) throws Exception {
		Signature signature = joinPoint.getSignature();
		MethodSignature methodSignature = (MethodSignature) signature;
		Method method = methodSignature.getMethod();

		if (method != null) {
			return method.getAnnotation(Log.class);
		}
		return null;
	}
}
