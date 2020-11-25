package com.smanga.framework.web.service;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.smanga.common.utils.StringUtils;

/**
 * Smanga pioneered js calling thymeleaf to achieve button permission visibility
 * 
 * @author Trong Hieu
 */
@Service("permission")
public class PermissionService {
	private static final Logger log = LoggerFactory.getLogger(PermissionService.class);

	/** Without permission, hidden is used to hide buttons on the front end */
	public static final String NOACCESS = "hidden";

	private static final String ROLE_DELIMETER = ",";

	private static final String PERMISSION_DELIMETER = ",";

	/**
	 * Verify whether the user has a certain permission, and return to hidden for front-end hiding if there is no permission (if you need to return Boolean, use isPermitted)
	 * 
	 * @param permission Permission string
	 * @return Does the user have certain permissions
	 */
	public String hasPermi(String permission) {
		return isPermitted(permission) ? StringUtils.EMPTY : NOACCESS;
	}

	/**
	 * Verifying whether the user does not have a certain permission is contrary to the logic of hasPermi. No permission to return hidden for front-end hiding (if you need to return Boolean, use isLacksPermitted)
	 *
	 * @param permission Permission string
	 * @return Whether the user does not have a certain permission
	 */
	public String lacksPermi(String permission) {
		return isLacksPermitted(permission) ? StringUtils.EMPTY : NOACCESS;
	}

	/**
	 * Verify whether the user has any of the following permissions, and return to hidden for hiding if there is no permission (if you need to return Boolean, use hasAnyPermissions)
	 *
	 * @param permissions List of permissions separated by PERMISSION_NAMES_DELIMETER
	 * @return Does the user have any of the following permissions
	 */
	public String hasAnyPermi(String permissions) {
		return hasAnyPermissions(permissions, PERMISSION_DELIMETER) ? StringUtils.EMPTY : NOACCESS;
	}

	/**
	 * Verify whether the user has a certain role, without permission, return to hidden for hiding (if you need to return Boolean, use isRole)
	 * 
	 * @param role Role string
	 * @return Does the user have a certain role
	 */
	public String hasRole(String role) {
		return isRole(role) ? StringUtils.EMPTY : NOACCESS;
	}

	/**
	 * Verify whether the user does not have a certain role, which is the opposite of hasRole logic. No permission to return hidden for hiding (if you need to return Boolean, use isLacksRole)
	 * 
	 * @param role Role string
	 * @return Whether the user does not have a certain role
	 */
	public String lacksRole(String role) {
		return isLacksRole(role) ? StringUtils.EMPTY : NOACCESS;
	}

	/**
	 * Verify whether the user has any of the following roles, and return to hidden for hiding without permission (if you need to return Boolean, use isAnyRoles)
	 *
	 * @param roles List of roles separated by ROLE_NAMES_DELIMETER
	 * @return Does the user have any of the following roles
	 */
	public String hasAnyRoles(String roles) {
		return isAnyRoles(roles, ROLE_DELIMETER) ? StringUtils.EMPTY : NOACCESS;
	}

	/**
	 * Verify whether the user is authenticated or remembered.
	 *
	 * @return Whether the user is authenticated or remembered
	 */
	public boolean isUser() {
		Subject subject = SecurityUtils.getSubject();
		return subject != null && subject.getPrincipal() != null;
	}

	/**
	 * Determine whether the user has a certain permission
	 * 
	 * @param permission Permission string
	 * @return Does the user have certain permissions
	 */
	public boolean isPermitted(String permission) {
		return SecurityUtils.getSubject().isPermitted(permission);
	}

	/**
	 * Judging whether the user does not have a certain permission, contrary to the logic of isPermitted.
	 *
	 * @param permission Authority name
	 * @return Whether the user does not have a certain permission
	 */
	public boolean isLacksPermitted(String permission) {
		return isPermitted(permission) != true;
	}

	/**
	 * Verify that the user has any of the following permissions.
	 *
	 * @param permissions List of permissions separated by PERMISSION_NAMES_DELIMETER
	 * @return Does the user have any of the following permissions
	 */
	public boolean hasAnyPermissions(String permissions) {
		return hasAnyPermissions(permissions, PERMISSION_DELIMETER);
	}

	/**
	 * Verify that the user has any of the following permissions.
	 *
	 * @param permissions A list of permissions separated by delimeter
	 * @param delimeter   Permission list separator
	 * @return Does the user have any of the following permissions
	 */
	public boolean hasAnyPermissions(String permissions, String delimeter) {
		Subject subject = SecurityUtils.getSubject();

		if (subject != null) {
			if (delimeter == null || delimeter.length() == 0) {
				delimeter = PERMISSION_DELIMETER;
			}

			for (String permission : permissions.split(delimeter)) {
				if (permission != null && subject.isPermitted(permission.trim()) == true) {
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * Determine whether the user has a certain role
	 * 
	 * @param role Role string
	 * @return Does the user have a certain role
	 */
	public boolean isRole(String role) {
		return SecurityUtils.getSubject().hasRole(role);
	}

	/**
	 * Verify whether the user does not have a role, which is the opposite of isRole logic.
	 *
	 * @param role Role Name
	 * @return Whether the user does not have a certain role
	 */
	public boolean isLacksRole(String role) {
		return isRole(role) != true;
	}

	/**
	 * Verify that the user has any of the following roles.
	 *
	 * @param roles List of roles separated by ROLE_NAMES_DELIMETER
	 * @return Does the user have any of the following roles
	 */
	public boolean isAnyRoles(String roles) {
		return isAnyRoles(roles, ROLE_DELIMETER);
	}

	/**
	 * Verify that the user has any of the following roles.
	 *
	 * @param roles     List of roles separated by delimeter
	 * @param delimeter Role list separator
	 * @return Does the user have any of the following roles
	 */
	public boolean isAnyRoles(String roles, String delimeter) {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			if (delimeter == null || delimeter.length() == 0) {
				delimeter = ROLE_DELIMETER;
			}

			for (String role : roles.split(delimeter)) {
				if (subject.hasRole(role.trim()) == true) {
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * Return user attribute value
	 *
	 * @param property Attribute name
	 * @return User attribute value
	 */
	public Object getPrincipalProperty(String property) {
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			Object principal = subject.getPrincipal();
			try {
				BeanInfo bi = Introspector.getBeanInfo(principal.getClass());
				for (PropertyDescriptor pd : bi.getPropertyDescriptors()) {
					if (pd.getName().equals(property) == true) {
						return pd.getReadMethod().invoke(principal, (Object[]) null);
					}
				}
			} catch (Exception e) {
				log.error("Error reading property [{}] from principal of type [{}]", property,
						principal.getClass().getName());
			}
		}
		return null;
	}
}
