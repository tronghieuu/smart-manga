package com.smanga.framework.interceptor.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.smanga.common.json.JSON;
import com.smanga.framework.interceptor.RepeatSubmitInterceptor;

/**
 * Determine whether the request URL and data are the same as the last time. If they are the same as the last time, the form is submitted repeatedly. The effective time is within 10 seconds.
 * 
 * @author Trong Hieu
 */
@Component
public class SameUrlDataInterceptor extends RepeatSubmitInterceptor {
	public final String REPEAT_PARAMS = "repeatParams";

	public final String REPEAT_TIME = "repeatTime";

	public final String SESSION_REPEAT_KEY = "repeatData";

	/**
	 * Interval time, unit: second, default 10 seconds
	 * 
	 * Two requests with the same parameters, if the interval time is longer than this parameter, the system will not recognize the data as repeated submissions
	 */
	private int intervalTime = 10;

	public void setIntervalTime(int intervalTime) {
		this.intervalTime = intervalTime;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean isRepeatSubmit(HttpServletRequest request) throws Exception {
		// This parameter and system time
		String nowParams = JSON.marshal(request.getParameterMap());
		Map<String, Object> nowDataMap = new HashMap<String, Object>();
		nowDataMap.put(REPEAT_PARAMS, nowParams);
		nowDataMap.put(REPEAT_TIME, System.currentTimeMillis());

		// Request address (as the key value for storing session)
		String url = request.getRequestURI();

		HttpSession session = request.getSession();
		Object sessionObj = session.getAttribute(SESSION_REPEAT_KEY);
		if (sessionObj != null) {
			Map<String, Object> sessionMap = (Map<String, Object>) sessionObj;
			if (sessionMap.containsKey(url)) {
				Map<String, Object> preDataMap = (Map<String, Object>) sessionMap.get(url);
				if (compareParams(nowDataMap, preDataMap) && compareTime(nowDataMap, preDataMap)) {
					return true;
				}
			}
		}
		Map<String, Object> sessionMap = new HashMap<String, Object>();
		sessionMap.put(url, nowDataMap);
		session.setAttribute(SESSION_REPEAT_KEY, sessionMap);
		return false;
	}

	/**
	 * Determine whether the parameters are the same
	 */
	private boolean compareParams(Map<String, Object> nowMap, Map<String, Object> preMap) {
		String nowParams = (String) nowMap.get(REPEAT_PARAMS);
		String preParams = (String) preMap.get(REPEAT_PARAMS);
		return nowParams.equals(preParams);
	}

	/**
	 * Determine the interval between two times
	 */
	private boolean compareTime(Map<String, Object> nowMap, Map<String, Object> preMap) {
		long time1 = (Long) nowMap.get(REPEAT_TIME);
		long time2 = (Long) preMap.get(REPEAT_TIME);
		if ((time1 - time2) < (this.intervalTime * 1000)) {
			return true;
		}
		return false;
	}
}
