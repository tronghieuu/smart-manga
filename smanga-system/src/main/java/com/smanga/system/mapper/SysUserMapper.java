package com.smanga.system.mapper;

import java.util.List;

import com.smanga.common.core.domain.entity.SysUser;

/**
 * User table data layer
 * 
 * @author Trong Hieu
 */
public interface SysUserMapper
{
    /**
     * Paging query user list based on conditions
     * 
     * @param sysUser User Info
     * @return User information collection information
     */
    public List<SysUser> selectUserList(SysUser sysUser);

    /**
     * Query the list of unconfigured user roles based on conditions
     * 
     * @param user User Info
     * @return User information collection information
     */
    public List<SysUser> selectAllocatedList(SysUser user);

    /**
     * Query the list of unassigned user roles based on conditions
     * 
     * @param user User Info
     * @return User information collection information
     */
    public List<SysUser> selectUnallocatedList(SysUser user);

    /**
     * Query users by username
     * 
     * @param userName username
     * @return User object information
     */
    public SysUser selectUserByLoginName(String userName);

    /**
     * Query users by mobile phone number
     * 
     * @param phoneNumber mobile phone number
     * @return User object information
     */
    public SysUser selectUserByPhoneNumber(String phoneNumber);

    /**
     * Query users by email
     * 
     * @param email mailbox
     * @return User object information
     */
    public SysUser selectUserByEmail(String email);

    /**
     * Query users by user ID
     * 
     * @param userId User ID
     * @return User object information
     */
    public SysUser selectUserById(Long userId);

    /**
     * Delete user by user ID
     * 
     * @param userId User ID
     * @return result
     */
    public int deleteUserById(Long userId);

    /**
     * Delete user information in bulk
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteUserByIds(Long[] ids);

    /**
     * Modify user information
     * 
     * @param user User Info
     * @return result
     */
    public int updateUser(SysUser user);

    /**
     * Add user information
     * 
     * @param user User Info
     * @return result
     */
    public int insertUser(SysUser user);

    /**
     * Verify that the user name is unique
     * 
     * @param loginName Login name
     * @return result
     */
    public int checkLoginNameUnique(String loginName);

    /**
     * Verify that the mobile phone number is unique
     *
     * @param phonenumber mobile phone number
     * @return result
     */
    public SysUser checkPhoneUnique(String phonenumber);

    /**
     * Verify that the email is unique
     *
     * @param email User mailbox
     * @return result
     */
    public SysUser checkEmailUnique(String email);
}
