package com.smanga.framework.aspectj;

import java.lang.reflect.Method;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import com.smanga.common.annotation.DataScope;
import com.smanga.common.core.domain.BaseEntity;
import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.StringUtils;

/**
 * Data filtering processing
 * 
 * @author Trong Hieu
 */
@Aspect
@Component
public class DataScopeAspect {
	/**
	 * All data permissions
	 */
	public static final String DATA_SCOPE_ALL = "1";

	/**
	 * Custom data permissions
	 */
	public static final String DATA_SCOPE_CUSTOM = "2";

	/**
	 * Department data permissions
	 */
	public static final String DATA_SCOPE_DEPT = "3";

	/**
	 * Department and below data permissions
	 */
	public static final String DATA_SCOPE_DEPT_AND_CHILD = "4";

	/**
	 * Personal data access only
	 */
	public static final String DATA_SCOPE_SELF = "5";

	/**
	 * Data permission filtering keywords
	 */
	public static final String DATA_SCOPE = "dataScope";

	// Configure weaving point
	@Pointcut("@annotation(com.smanga.common.annotation.DataScope)")
	public void dataScopePointCut() {
	}

	@Before("dataScopePointCut()")
	public void doBefore(JoinPoint point) throws Throwable {
		handleDataScope(point);
	}

	protected void handleDataScope(final JoinPoint joinPoint) {
		// Get comments
		DataScope controllerDataScope = getAnnotationLog(joinPoint);
		if (controllerDataScope == null) {
			return;
		}
		// Get current user
		SysUser currentUser = ShiroUtils.getSysUser();
		if (currentUser != null) {
			// If you are a super administrator, do not filter data
			if (!currentUser.isAdmin()) {
				dataScopeFilter(joinPoint, currentUser, controllerDataScope.deptAlias(),
						controllerDataScope.userAlias());
			}
		}
	}

	/**
	 * Data range filtering
	 * 
	 * @param joinPoint Cut-off point
	 * @param user      user
	 * @param deptAlias Department alias
	 * @param userAlias User alias
	 */
	public static void dataScopeFilter(JoinPoint joinPoint, SysUser user, String deptAlias, String userAlias) {
		StringBuilder sqlString = new StringBuilder();

		for (SysRole role : user.getRoles()) {
			String dataScope = role.getDataScope();
			if (DATA_SCOPE_ALL.equals(dataScope)) {
				sqlString = new StringBuilder();
				break;
			} else if (DATA_SCOPE_CUSTOM.equals(dataScope)) {
				sqlString.append(StringUtils.format(
						" OR {}.dept_id IN ( SELECT dept_id FROM sys_role_dept WHERE role_id = {} ) ", deptAlias,
						role.getRoleId()));
			} else if (DATA_SCOPE_DEPT.equals(dataScope)) {
				sqlString.append(StringUtils.format(" OR {}.dept_id = {} ", deptAlias, user.getDeptId()));
			} else if (DATA_SCOPE_DEPT_AND_CHILD.equals(dataScope)) {
				sqlString.append(StringUtils.format(
						" OR {}.dept_id IN ( SELECT dept_id FROM sys_dept WHERE dept_id = {} or find_in_set( {} , ancestors ) )",
						deptAlias, user.getDeptId(), user.getDeptId()));
			} else if (DATA_SCOPE_SELF.equals(dataScope)) {
				if (StringUtils.isNotBlank(userAlias)) {
					sqlString.append(StringUtils.format(" OR {}.user_id = {} ", userAlias, user.getUserId()));
				} else {
					// The data permission is only for me and there is no userAlias ​​alias, do not query any data
					sqlString.append(" OR 1=0 ");
				}
			}
		}

		if (StringUtils.isNotBlank(sqlString.toString())) {
			Object params = joinPoint.getArgs()[0];
			if (StringUtils.isNotNull(params) && params instanceof BaseEntity) {
				BaseEntity baseEntity = (BaseEntity) params;
				baseEntity.getParams().put(DATA_SCOPE, " AND (" + sqlString.substring(4) + ")");
			}
		}
	}

	/**
	 * Whether there is an annotation, get it if it exists
	 */
	private DataScope getAnnotationLog(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		MethodSignature methodSignature = (MethodSignature) signature;
		Method method = methodSignature.getMethod();

		if (method != null) {
			return method.getAnnotation(DataScope.class);
		}
		return null;
	}
}
