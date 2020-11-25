package com.smanga.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smanga.common.annotation.DataScope;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.security.Md5Utils;
import com.smanga.system.domain.SysPost;
import com.smanga.system.domain.SysUserPost;
import com.smanga.system.domain.SysUserRole;
import com.smanga.system.mapper.SysPostMapper;
import com.smanga.system.mapper.SysRoleMapper;
import com.smanga.system.mapper.SysUserMapper;
import com.smanga.system.mapper.SysUserPostMapper;
import com.smanga.system.mapper.SysUserRoleMapper;
import com.smanga.system.service.ISysConfigService;
import com.smanga.system.service.ISysUserService;

/**
 * User business layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysUserServiceImpl implements ISysUserService {
	private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

	@Autowired
	private SysUserMapper userMapper;

	@Autowired
	private SysRoleMapper roleMapper;

	@Autowired
	private SysPostMapper postMapper;

	@Autowired
	private SysUserPostMapper userPostMapper;

	@Autowired
	private SysUserRoleMapper userRoleMapper;

	@Autowired
	private ISysConfigService configService;

	/**
	 * Paging query user list based on conditions
	 * 
	 * @param user User Info
	 * @return User information collection information
	 */
	@Override
	@DataScope(deptAlias = "d", userAlias = "u")
	public List<SysUser> selectUserList(SysUser user) {
		return userMapper.selectUserList(user);
	}

	/**
	 * Query the list of assigned user roles based on conditions
	 * 
	 * @param user User Info
	 * @return User information collection information
	 */
	@Override
	@DataScope(deptAlias = "d", userAlias = "u")
	public List<SysUser> selectAllocatedList(SysUser user) {
		return userMapper.selectAllocatedList(user);
	}

	/**
	 * Query the list of unassigned user roles based on conditions
	 * 
	 * @param user User Info
	 * @return User information collection information
	 */
	@Override
	@DataScope(deptAlias = "d", userAlias = "u")
	public List<SysUser> selectUnallocatedList(SysUser user) {
		return userMapper.selectUnallocatedList(user);
	}

	/**
	 * Query users by username
	 *
	 * @param userName username
	 * @return user object information
	 */
	@Override
	public SysUser selectUserByLoginName(String userName) {
		return userMapper.selectUserByLoginName(userName);
	}

	/**
	 * Query users by mobile phone number
	 *
	 * @param phoneNumber mobile phone number
	 * @return user object information
	 */
	@Override
	public SysUser selectUserByPhoneNumber(String phoneNumber) {
		return userMapper.selectUserByPhoneNumber(phoneNumber);
	}

	/**
	 * Query users by email
	 *
	 * @param email
	 * @return user object information
	 */
	@Override
	public SysUser selectUserByEmail(String email) {
		return userMapper.selectUserByEmail(email);
	}

	/**
	 * Query users by user ID
	 *
	 * @param userId user ID
	 * @return user object information
	 */
	@Override
	public SysUser selectUserById(Long userId) {
		return userMapper.selectUserById(userId);
	}

	/**
	 * Query user and role association by user ID
	 *
	 * @param userId user ID
	 * @return user and role association list
	 */
	@Override
	public List<SysUserRole> selectUserRoleByUserId(Long userId) {
		return userRoleMapper.selectUserRoleByUserId(userId);
	}

	/**
	 * Delete user by user ID
	 *
	 * @param userId user ID
	 * @return result
	 */
	@Override
	public int deleteUserById(Long userId) {
		// Delete user and role association
		userRoleMapper.deleteUserRoleByUserId(userId);
		// Delete user and position table
		userPostMapper.deleteUserPostByUserId(userId);
		return userMapper.deleteUserById(userId);
	}

	/**
	 * Delete user information in batch
	 *
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteUserByIds(String ids) throws BusinessException {
		Long[] userIds = Convert.toLongArray(ids);
//		for (Long userId : userIds) {
//			checkUserAllowed(new SysUser(userId));
//		}
		return userMapper.deleteUserByIds(userIds);
	}

	/**
	 * Added save user information
	 *
	 * @param user user information
	 * @return result
	 */
	@Override
	@Transactional
	public int insertUser(SysUser user) {
		// Add user information
		int rows = userMapper.insertUser(user);
		// Add user post association
		insertUserPost(user);
		// Add user and role management
		insertUserRole(user.getUserId(), user.getRoleIds());
		return rows;
	}

	/**
	 * Registered user information
	 *
	 * @param user user information
	 * @return result
	 */
	@Override
	public boolean registerUser(SysUser user) {
		user.setUserType(UserConstants.REGISTER_USER_TYPE);
		return userMapper.insertUser(user) > 0;
	}

	/**
	 * Modify and save user information
	 *
	 * @param user user information
	 * @return result
	 */
	@Override
	@Transactional
	public int updateUser(SysUser user) {
		Long userId = user.getUserId();
		// Delete user and role association
		userRoleMapper.deleteUserRoleByUserId(userId);
		// Add user and role management
		insertUserRole(user.getUserId(), user.getRoleIds());
		// Delete user and post association
		userPostMapper.deleteUserPostByUserId(userId);
		// Add user and position management
		insertUserPost(user);
		return userMapper.updateUser(user);
	}

	/**
	 * Modify user personal details
	 *
	 * @param user user information
	 * @return result
	 */
	@Override
	public int updateUserInfo(SysUser user) {
		return userMapper.updateUser(user);
	}

	/**
	 * User authorization role
	 *
	 * @param userId  user ID
	 * @param roleIds role group
	 */
	@Override
	public void insertUserAuth(Long userId, Long[] roleIds) {
		userRoleMapper.deleteUserRoleByUserId(userId);
		insertUserRole(userId, roleIds);
	}

	/**
	 * Modify user password
	 *
	 * @param user user information
	 * @return result
	 */
	@Override
	public int resetUserPwd(SysUser user) {
		return updateUserInfo(user);
	}

	/**
	 * Added user role information
	 *
	 * @param user user object
	 */
	public void insertUserRole(Long userId, Long[] roleIds) {
		if (StringUtils.isNotNull(roleIds)) {
			// Add user and role management
			List<SysUserRole> list = new ArrayList<SysUserRole>();
			for (Long roleId : roleIds) {
				SysUserRole ur = new SysUserRole();
				ur.setUserId(userId);
				ur.setRoleId(roleId);
				list.add(ur);
			}
			if (list.size() > 0) {
				userRoleMapper.batchUserRole(list);
			}
		}
	}

	/**
	 * New user post information
	 *
	 * @param user user object
	 */
	public void insertUserPost(SysUser user) {
		Long[] posts = user.getPostIds();
		if (StringUtils.isNotNull(posts)) {
			// Add user and position management
			List<SysUserPost> list = new ArrayList<SysUserPost>();
			for (Long postId : posts) {
				SysUserPost up = new SysUserPost();
				up.setUserId(user.getUserId());
				up.setPostId(postId);
				list.add(up);
			}
			if (list.size() > 0) {
				userPostMapper.batchUserPost(list);
			}
		}
	}

	/**
	 * Verify that the login name is unique
	 *
	 * @param loginName username
	 * @return
	 */
	@Override
	public String checkLoginNameUnique(String loginName) {
		int count = userMapper.checkLoginNameUnique(loginName);
		if (count > 0) {
			return UserConstants.USER_NAME_NOT_UNIQUE;
		}
		return UserConstants.USER_NAME_UNIQUE;
	}

	/**
	 * Verify that the mobile phone number is unique
	 *
	 * @param user user information
	 * @return
	 */
	@Override
	public String checkPhoneUnique(SysUser user) {
		Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
		SysUser info = userMapper.checkPhoneUnique(user.getPhonenumber());
		if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
			return UserConstants.USER_PHONE_NOT_UNIQUE;
		}
		return UserConstants.USER_PHONE_UNIQUE;
	}

	/**
	 * Verify that the email is unique
	 *
	 * @param user user information
	 * @return
	 */
	@Override
	public String checkEmailUnique(SysUser user) {
		Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
		SysUser info = userMapper.checkEmailUnique(user.getEmail());
		if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
			return UserConstants.USER_EMAIL_NOT_UNIQUE;
		}
		return UserConstants.USER_EMAIL_UNIQUE;
	}

	/**
	 * Verify whether the user allows the operation
	 *
	 * @param user user information
	 */
	@Override
	public void checkUserAllowed(SysUser user) {
		if (!(StringUtils.isNotNull(user.getUserId()) && user.isAdmin())) {
			throw new BusinessException("Operating super administrator users is not allowed");
		}
	}

	/**
	 * Query the role group the user belongs to
	 *
	 * @param userId user ID
	 * @return result
	 */
	@Override
	public String selectUserRoleGroup(Long userId) {
		List<SysRole> list = roleMapper.selectRolesByUserId(userId);
		StringBuffer idsStr = new StringBuffer();
		for (SysRole role : list) {
			idsStr.append(role.getRoleName()).append(",");
		}
		if (StringUtils.isNotEmpty(idsStr.toString())) {
			return idsStr.substring(0, idsStr.length() - 1);
		}
		return idsStr.toString();
	}

	/**
	 * Query the post group that the user belongs to
	 *
	 * @param userId user ID
	 * @return result
	 */
	@Override
	public String selectUserPostGroup(Long userId) {
		List<SysPost> list = postMapper.selectPostsByUserId(userId);
		StringBuffer idsStr = new StringBuffer();
		for (SysPost post : list) {
			idsStr.append(post.getPostName()).append(",");
		}
		if (StringUtils.isNotEmpty(idsStr.toString())) {
			return idsStr.substring(0, idsStr.length() - 1);
		}
		return idsStr.toString();
	}

	/**
	 * Import user data
	 *
	 * @param userList        user data list
	 * @param isUpdateSupport Whether to update support, if it already exists,
	 *                        update the data
	 * @param operName        operation user
	 * @return result
	 */
	@Override
	public String importUser(List<SysUser> userList, Boolean isUpdateSupport, String operName) {
		if (StringUtils.isNull(userList) || userList.size() == 0) {
			throw new BusinessException("Imported user data cannot be empty!");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();
		String password = configService.selectConfigByKey("sys.user.initPassword");
		for (SysUser user : userList) {
			try {
				// Verify if this user exists
				SysUser u = userMapper.selectUserByLoginName(user.getLoginName());
				if (StringUtils.isNull(u)) {
					user.setPassword(Md5Utils.hash(user.getLoginName() + password));
					user.setCreateBy(operName);
					this.insertUser(user);
					successNum++;
					successMsg.append(
							"<br/>" + successNum + ", account number " + user.getLoginName() + "import successful");
				} else if (isUpdateSupport) {
					user.setUpdateBy(operName);
					this.updateUser(user);
					successNum++;
					successMsg.append(
							"<br/>" + successNum + ", account number " + user.getLoginName() + "updated successfully");
				} else {
					failureNum++;
					failureMsg.append(
							"<br/>" + failureNum + ", account number " + user.getLoginName() + " already exists");
				}
			} catch (Exception e) {
				failureNum++;
				String msg = "<br/>" + failureNum + ", account " + user.getLoginName() + " Import failed:";
				failureMsg.append(msg + e.getMessage());
				log.error(msg, e);
			}
		}
		if (failureNum > 0) {
			failureMsg.insert(0, "Sorry, the import failed! A total of " + failureNum
					+ " data format is incorrect, the error is as follows:");
			throw new BusinessException(failureMsg.toString());
		} else {
			successMsg.insert(0, "Congratulations, all the data has been imported successfully! There are " + successNum
					+ " items, the data is as follows:");
		}
		return successMsg.toString();
	}

	/**
	 * User status modification
	 *
	 * @param user user information
	 * @return result
	 */
	@Override
	public int changeStatus(SysUser user) {
		return userMapper.updateUser(user);
	}
}
