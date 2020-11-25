package com.smanga.quartz.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedList;
import java.util.List;

import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.spring.SpringUtils;
import com.smanga.quartz.domain.SysJob;

/**
 * Task execution tool
 *
 * @author Trong Hieu
 */
public class JobInvokeUtil {
	/**
	 * Execution method
	 *
	 * @param sysJob System task
	 */
	public static void invokeMethod(SysJob sysJob) throws Exception {
		String invokeTarget = sysJob.getInvokeTarget();
		String beanName = getBeanName(invokeTarget);
		String methodName = getMethodName(invokeTarget);
		List<Object[]> methodParams = getMethodParams(invokeTarget);

		if (!isValidClassName(beanName)) {
			Object bean = SpringUtils.getBean(beanName);
			invokeMethod(bean, methodName, methodParams);
		} else {
			Object bean = Class.forName(beanName).newInstance();
			invokeMethod(bean, methodName, methodParams);
		}
	}

	/**
	 * Call task method
	 *
	 * @param bean         target
	 * @param methodName   Method name
	 * @param methodParams Method parameters
	 */
	private static void invokeMethod(Object bean, String methodName, List<Object[]> methodParams)
			throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		if (StringUtils.isNotNull(methodParams) && methodParams.size() > 0) {
			Method method = bean.getClass().getDeclaredMethod(methodName, getMethodParamsType(methodParams));
			method.invoke(bean, getMethodParamsValue(methodParams));
		} else {
			Method method = bean.getClass().getDeclaredMethod(methodName);
			method.invoke(bean);
		}
	}

	/**
	 * Check whether it is the class package name
	 * 
	 * @param invokeTarget name
	 * @return true is false no
	 */
	public static boolean isValidClassName(String invokeTarget) {
		return StringUtils.countMatches(invokeTarget, ".") > 1;
	}

	/**
	 * Get the bean name
	 * 
	 * @param invokeTarget Target string
	 * @return bean name
	 */
	public static String getBeanName(String invokeTarget) {
		String beanName = StringUtils.substringBefore(invokeTarget, "(");
		return StringUtils.substringBeforeLast(beanName, ".");
	}

	/**
	 * Get bean method
	 * 
	 * @param invokeTarget Target string
	 * @return method method
	 */
	public static String getMethodName(String invokeTarget) {
		String methodName = StringUtils.substringBefore(invokeTarget, "(");
		return StringUtils.substringAfterLast(methodName, ".");
	}

	/**
	 * Get a list of method parameters
	 * 
	 * @param invokeTarget Target string
	 * @return Method method related parameter list
	 */
	public static List<Object[]> getMethodParams(String invokeTarget) {
		String methodStr = StringUtils.substringBetween(invokeTarget, "(", ")");
		if (StringUtils.isEmpty(methodStr)) {
			return null;
		}
		String[] methodParams = methodStr.split(",");
		List<Object[]> classs = new LinkedList<>();
		for (int i = 0; i < methodParams.length; i++) {
			String str = StringUtils.trimToEmpty(methodParams[i]);
			// String string type, contains'
			if (StringUtils.contains(str, "'")) {
				classs.add(new Object[] { StringUtils.replace(str, "'", ""), String.class });
			}
			// boolean boolean type, equal to true or false
			else if (StringUtils.equals(str, "true") || StringUtils.equalsIgnoreCase(str, "false")) {
				classs.add(new Object[] { Boolean.valueOf(str), Boolean.class });
			}
			// long long, contains L
			else if (StringUtils.containsIgnoreCase(str, "L")) {
				classs.add(new Object[] { Long.valueOf(StringUtils.replaceIgnoreCase(str, "L", "")), Long.class });
			}
			// double floating point type, including D
			else if (StringUtils.containsIgnoreCase(str, "D")) {
				classs.add(new Object[] { Double.valueOf(StringUtils.replaceIgnoreCase(str, "D", "")), Double.class });
			}
			// Other types are classified as plastic
			else {
				classs.add(new Object[] { Integer.valueOf(str), Integer.class });
			}
		}
		return classs;
	}

	/**
	 * Get parameter type
	 * 
	 * @param methodParams Parameter related list
	 * @return List of parameter types
	 */
	public static Class<?>[] getMethodParamsType(List<Object[]> methodParams) {
		Class<?>[] classs = new Class<?>[methodParams.size()];
		int index = 0;
		for (Object[] os : methodParams) {
			classs[index] = (Class<?>) os[1];
			index++;
		}
		return classs;
	}

	/**
	 * Get parameter value
	 * 
	 * @param methodParams Parameter related list
	 * @return Parameter value list
	 */
	public static Object[] getMethodParamsValue(List<Object[]> methodParams) {
		Object[] classs = new Object[methodParams.size()];
		int index = 0;
		for (Object[] os : methodParams) {
			classs[index] = (Object) os[0];
			index++;
		}
		return classs;
	}
}
