package com.smanga.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.smanga.system.domain.SysUserRole;

/**
 * User and role association table Data layer
 *
 * @author Trong Hieu
 */
public interface SysUserRoleMapper
{
    /**
     * Query user and role association by user ID
     *
     * @param userId user ID
     * @return user and role association list
     */
    public List<SysUserRole> selectUserRoleByUserId(Long userId);

    /**
     * Delete user and role association by user ID
     *
     * @param userId user ID
     * @return result
     */
    public int deleteUserRoleByUserId(Long userId);

    /**
     * Batch delete user and role associations
     *
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteUserRole(Long[] ids);

    /**
     * Query the number of roles used by role ID
     *
     * @param roleId role ID
     * @return result
     */
    public int countUserRoleByRoleId(Long roleId);

    /**
     * Add user role information in batches
     *
     * @param userRoleList user role list
     * @return result
     */
    public int batchUserRole(List<SysUserRole> userRoleList);

    /**
     * Delete user and role association information
     *
     * @param userRole user and role association information
     * @return result
     */
    public int deleteUserRoleInfo(SysUserRole userRole);

    /**
     * Cancel authorized user roles in batch
     *
     * @param roleId role ID
     * @param userIds ID of the user data to be deleted
     * @return result
     */
    public int deleteUserRoleInfos(@Param("roleId") Long roleId, @Param("userIds") Long[] userIds);
}
