package com.smanga.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smanga.common.annotation.DataScope;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.spring.SpringUtils;
import com.smanga.system.domain.SysRoleDept;
import com.smanga.system.domain.SysRoleMenu;
import com.smanga.system.domain.SysUserRole;
import com.smanga.system.mapper.SysRoleDeptMapper;
import com.smanga.system.mapper.SysRoleMapper;
import com.smanga.system.mapper.SysRoleMenuMapper;
import com.smanga.system.mapper.SysUserRoleMapper;
import com.smanga.system.service.ISysRoleService;

/**
 * Role business layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysRoleServiceImpl implements ISysRoleService {
	@Autowired
	private SysRoleMapper roleMapper;

	@Autowired
	private SysRoleMenuMapper roleMenuMapper;

	@Autowired
	private SysUserRoleMapper userRoleMapper;

	@Autowired
	private SysRoleDeptMapper roleDeptMapper;

	/**
	 * Query role data by condition
	 * 
	 * @param role Role information
	 * @return Role data collection information
	 */
	@Override
	@DataScope(deptAlias = "d")
	public List<SysRole> selectRoleList(SysRole role) {
		return roleMapper.selectRoleList(role);
	}

	/**
	 * Query permissions based on user ID
	 *
	 * @param userId user ID
	 * @return permission list
	 */
	@Override
	public Set<String> selectRoleKeys(Long userId) {
		List<SysRole> perms = roleMapper.selectRolesByUserId(userId);
		Set<String> permsSet = new HashSet<>();
		for (SysRole perm : perms) {
			if (StringUtils.isNotNull(perm)) {
				permsSet.addAll(Arrays.asList(perm.getRoleKey().trim().split(",")));
			}
		}
		return permsSet;
	}

	/**
	 * Query role based on user ID
	 *
	 * @param userId user ID
	 * @return role list
	 */
	@Override
	public List<SysRole> selectRolesByUserId(Long userId) {
		List<SysRole> userRoles = roleMapper.selectRolesByUserId(userId);
		List<SysRole> roles = selectRoleAll();
		for (SysRole role : roles) {
			for (SysRole userRole : userRoles) {
				if (role.getRoleId().longValue() == userRole.getRoleId().longValue()) {
					role.setFlag(true);
					break;
				}
			}
		}
		return roles;
	}

	/**
	 * Query all roles
	 *
	 * @return role list
	 */
	@Override
	public List<SysRole> selectRoleAll() {
		return SpringUtils.getAopProxy(this).selectRoleList(new SysRole());
	}

	/**
	 * Query role by role ID
	 *
	 * @param roleId role ID
	 * @return role object information
	 */
	@Override
	public SysRole selectRoleById(Long roleId) {
		return roleMapper.selectRoleById(roleId);
	}

	/**
	 * Delete role by role ID
	 *
	 * @param roleId role ID
	 * @return result
	 */
	@Override
	public boolean deleteRoleById(Long roleId) {
		return roleMapper.deleteRoleById(roleId) > 0 ? true : false;
	}

	/**
	 * Batch delete role information
	 *
	 * @param ids ID of the data to be deleted
	 * @throws Exception
	 */
	@Override
	public int deleteRoleByIds(String ids) throws BusinessException {
		Long[] roleIds = Convert.toLongArray(ids);
		for (Long roleId : roleIds) {
			checkRoleAllowed(new SysRole(roleId));
			SysRole role = selectRoleById(roleId);
			if (countUserRoleByRoleId(roleId) > 0) {
				throw new BusinessException(
						String.format("%1$s has been allocated and cannot be deleted", role.getRoleName()));
			}
		}
		return roleMapper.deleteRoleByIds(roleIds);
	}

	/**
	 * Added saving role information
	 *
	 * @param role role information
	 * @return result
	 */
	@Override
	@Transactional
	public int insertRole(SysRole role) {
// New role information
		roleMapper.insertRole(role);
		return insertRoleMenu(role);
	}

	/**
	 * Modify and save role information
	 *
	 * @param role role information
	 * @return result
	 */
	@Override
	@Transactional
	public int updateRole(SysRole role) {
// Modify role information
		roleMapper.updateRole(role);
// Delete the role associated with the menu
		roleMenuMapper.deleteRoleMenuByRoleId(role.getRoleId());
		return insertRoleMenu(role);
	}

	/**
	 * Modify data permission information
	 *
	 * @param role role information
	 * @return result
	 */
	@Override
	@Transactional
	public int authDataScope(SysRole role) {
		// Modify role information
		roleMapper.updateRole(role);
// Delete the role and department association
		roleDeptMapper.deleteRoleDeptByRoleId(role.getRoleId());
// Added role and department information (data permissions)
		return insertRoleDept(role);
	}

	/**
	 * Added role menu information
	 *
	 * @param role role object
	 */
	public int insertRoleMenu(SysRole role) {
		int rows = 1;
// Add user and role management
		List<SysRoleMenu> list = new ArrayList<SysRoleMenu>();
		for (Long menuId : role.getMenuIds()) {
			SysRoleMenu rm = new SysRoleMenu();
			rm.setRoleId(role.getRoleId());
			rm.setMenuId(menuId);
			list.add(rm);
		}
		if (list.size() > 0) {
			rows = roleMenuMapper.batchRoleMenu(list);
		}
		return rows;
	}

	/**
	 * Added role department information (data permissions)
	 *
	 * @param role role object
	 */
	public int insertRoleDept(SysRole role) {
		int rows = 1;
// Added role and department (data authority) management
		List<SysRoleDept> list = new ArrayList<SysRoleDept>();
		for (Long deptId : role.getDeptIds()) {
			SysRoleDept rd = new SysRoleDept();
			rd.setRoleId(role.getRoleId());
			rd.setDeptId(deptId);
			list.add(rd);
		}
		if (list.size() > 0) {
			rows = roleDeptMapper.batchRoleDept(list);
		}
		return rows;
	}

	/**
	 * Verify that the role name is unique
	 *
	 * @param role role information
	 * @return result
	 */
	@Override
	public String checkRoleNameUnique(SysRole role) {
		Long roleId = StringUtils.isNull(role.getRoleId()) ? -1L : role.getRoleId();
		SysRole info = roleMapper.checkRoleNameUnique(role.getRoleName());
		if (StringUtils.isNotNull(info) && info.getRoleId().longValue() != roleId.longValue()) {
			return UserConstants.ROLE_NAME_NOT_UNIQUE;
		}
		return UserConstants.ROLE_NAME_UNIQUE;
	}

	/**
	 * Verify that the role permissions are unique
	 *
	 * @param role Role information
	 * @return result
	 */
	@Override
	public String checkRoleKeyUnique(SysRole role) {
		Long roleId = StringUtils.isNull(role.getRoleId()) ? -1L : role.getRoleId();
		SysRole info = roleMapper.checkRoleKeyUnique(role.getRoleKey());
		if (StringUtils.isNotNull(info) && info.getRoleId().longValue() != roleId.longValue()) {
			return UserConstants.ROLE_KEY_NOT_UNIQUE;
		}
		return UserConstants.ROLE_KEY_UNIQUE;
	}

	/**
	 * Verify whether the role allows operation
	 *
	 * @param role role information
	 */
	@Override
	public void checkRoleAllowed(SysRole role) {
		if (StringUtils.isNotNull(role.getRoleId()) && role.isAdmin()) {
			throw new BusinessException("Super administrator role is not allowed to operate");
		}
	}

	/**
	 * Query the number of roles used by role ID
	 *
	 * @param roleId role ID
	 * @return result
	 */
	@Override
	public int countUserRoleByRoleId(Long roleId) {
		return userRoleMapper.countUserRoleByRoleId(roleId);
	}

	/**
	 * Role status modification
	 *
	 * @param role role information
	 * @return result
	 */
	@Override
	public int changeStatus(SysRole role) {
		return roleMapper.updateRole(role);
	}

	/**
	 * Cancel authorized user role
	 *
	 * @param userRole user and role association information
	 * @return result
	 */
	@Override
	public int deleteAuthUser(SysUserRole userRole) {
		return userRoleMapper.deleteUserRoleInfo(userRole);
	}

	/**
	 * Cancel authorized user roles in batch
	 *
	 * @param roleId  role ID
	 * @param userIds ID of user data to be deleted
	 * @return result
	 */
	@Override
	public int deleteAuthUsers(Long roleId, String userIds) {
		return userRoleMapper.deleteUserRoleInfos(roleId, Convert.toLongArray(userIds));
	}

	/**
	 * Batch select authorized user roles
	 *
	 * @param roleId  role ID
	 * @param userIds ID of user data to be deleted
	 * @return result
	 */
	@Override
	public int insertAuthUsers(Long roleId, String userIds) {
		Long[] users = Convert.toLongArray(userIds);
// Add user and role management
		List<SysUserRole> list = new ArrayList<SysUserRole>();
		for (Long userId : users) {
			SysUserRole ur = new SysUserRole();
			ur.setUserId(userId);
			ur.setRoleId(roleId);
			list.add(ur);
		}
		return userRoleMapper.batchUserRole(list);
	}
}
