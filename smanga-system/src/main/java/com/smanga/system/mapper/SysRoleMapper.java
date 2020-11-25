package com.smanga.system.mapper;

import java.util.List;

import com.smanga.common.core.domain.entity.SysRole;

/**
 * Role table Data layer
 * 
 * @author Trong Hieu
 */
public interface SysRoleMapper
{
    /**
     * Query role data by condition
     * 
     * @param role Role information
     * @return Role data collection information
     */
    public List<SysRole> selectRoleList(SysRole role);

    /**
     * Query role based on user ID
     * 
     * @param userId User ID
     * @return Role list
     */
    public List<SysRole> selectRolesByUserId(Long userId);

    /**
     * Query role by role ID
     * 
     * @param roleId Role ID
     * @return Role object information
     */
    public SysRole selectRoleById(Long roleId);

    /**
     * Delete role by role ID
     * 
     * @param roleId Role ID
     * @return result
     */
    public int deleteRoleById(Long roleId);

    /**
     * Batch role user information
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteRoleByIds(Long[] ids);

    /**
     * Modify role information
     * 
     * @param role Role information
     * @return result
     */
    public int updateRole(SysRole role);

    /**
     * New role information
     * 
     * @param role Role information
     * @return result
     */
    public int insertRole(SysRole role);

    /**
     * Verify that the role name is unique
     * 
     * @param roleName Role Name
     * @return Role information
     */
    public SysRole checkRoleNameUnique(String roleName);
    
    /**
     * Verify that the role permissions are unique
     * 
     * @param roleKey Role Permissions
     * @return Role information
     */
    public SysRole checkRoleKeyUnique(String roleKey);
}
