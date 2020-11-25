package com.smanga.system.service;

import java.util.List;

import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.system.domain.SysUserRole;

/**
 * User business layer
 *
 * @author Trong Hieu
 */
public interface ISysUserService
{
    /**
     * Paging query user list according to conditions
     *
     * @param user user information
     * @return user information collection information
     */
    public List<SysUser> selectUserList(SysUser user);

    /**
     * Query the list of assigned user roles based on conditions
     *
     * @param user user information
     * @return user information collection information
     */
    public List<SysUser> selectAllocatedList(SysUser user);

    /**
     * Query the list of unassigned user roles based on conditions
     *
     * @param user user information
     * @return user information collection information
     */
    public List<SysUser> selectUnallocatedList(SysUser user);

    /**
     * Query users by username
     *
     * @param userName username
     * @return user object information
     */
    public SysUser selectUserByLoginName(String userName);

    /**
     * Query users by mobile phone number
     *
     * @param phoneNumber mobile phone number
     * @return user object information
     */
    public SysUser selectUserByPhoneNumber(String phoneNumber);

    /**
     * Query users by email
     *
     * @param email
     * @return user object information
     */
    public SysUser selectUserByEmail(String email);

    /**
     * Query users by user ID
     *
     * @param userId user ID
     * @return user object information
     */
    public SysUser selectUserById(Long userId);

    /**
     * Query user and role association by user ID
     *
     * @param userId user ID
     * @return user and role association list
     */
    public List<SysUserRole> selectUserRoleByUserId(Long userId);

    /**
     * Delete user by user ID
     *
     * @param userId user ID
     * @return result
     */
    public int deleteUserById(Long userId);

    /**
     * Delete user information in batch
     *
     * @param ids ID of the data to be deleted
     * @return result
     * @throws Exception
     */
    public int deleteUserByIds(String ids) throws Exception;

    /**
     * Save user information
     *
     * @param user user information
     * @return result
     */
    public int insertUser(SysUser user);

    /**
     * Registered user information
     *
     * @param user user information
     * @return result
     */
    public boolean registerUser(SysUser user);

    /**
     * Save user information
     *
     * @param user user information
     * @return result
     */
    public int updateUser(SysUser user);

    /**
     * Modify user details
     *
     * @param user user information
     * @return result
     */
    public int updateUserInfo(SysUser user);

    /**
     * User authorization role
     *
     * @param userId user ID
     * @param roleIds role group
     */
    public void insertUserAuth(Long userId, Long[] roleIds);

    /**
     * Modify user password information
     *
     * @param user user information
     * @return result
     */
    public int resetUserPwd(SysUser user);

    /**
     * Verify that the user name is unique
     *
     * @param loginName login name
     * @return result
     */
    public String checkLoginNameUnique(String loginName);

    /**
     * Verify that the mobile phone number is unique
     *
     * @param user User Info
     * @return result
     */
    public String checkPhoneUnique(SysUser user);

    /**
     * Verify that the email is unique
     *
     * @param user user information
     * @return result
     */
    public String checkEmailUnique(SysUser user);

    /**
     * Verify whether the user allows the operation
     *
     * @param user user information
     */
    public void checkUserAllowed(SysUser user);

    /**
     * Query the role group the user belongs to according to the user ID
     *
     * @param userId user ID
     * @return result
     */
    public String selectUserRoleGroup(Long userId);

    /**
     * Query the user's position group according to the user ID
     *
     * @param userId user ID
     * @return result
     */
    public String selectUserPostGroup(Long userId);

    /**
     * Import user data
     *
     * @param userList user data list
     * @param isUpdateSupport Whether to update support, if it already exists, update the data
     * @param operName operation user
     * @return result
     */
    public String importUser(List<SysUser> userList, Boolean isUpdateSupport, String operName);

    /**
     * User status modification
     *
     * @param user user information
     * @return result
     */
    public int changeStatus(SysUser user);
}
