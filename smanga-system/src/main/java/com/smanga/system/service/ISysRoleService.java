package com.smanga.system.service;

import java.util.List;
import java.util.Set;

import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.system.domain.SysUserRole;

/**
 * Role business layer
 *
 * @author Trong Hieu
 */
public interface ISysRoleService
{
    /**
     * Paging query role data based on conditions
     *
     * @param role role information
     * @return role data collection information
     */
    public List<SysRole> selectRoleList(SysRole role);

    /**
     * Query role based on user ID
     *
     * @param userId user ID
     * @return permission list
     */
    public Set<String> selectRoleKeys(Long userId);

    /**
     * Query role based on user ID
     *
     * @param userId user ID
     * @return role list
     */
    public List<SysRole> selectRolesByUserId(Long userId);

    /**
     * Query all roles
     *
     * @return role list
     */
    public List<SysRole> selectRoleAll();

    /**
     * Query role by role ID
     *
     * @param roleId role ID
     * @return role object information
     */
    public SysRole selectRoleById(Long roleId);

    /**
     * Delete role by role ID
     *
     * @param roleId role ID
     * @return result
     */
    public boolean deleteRoleById(Long roleId);

    /**
     * Batch delete role user information
     *
     * @param ids ID of the data to be deleted
     * @return result
     * @throws Exception
     */
    public int deleteRoleByIds(String ids) throws Exception;

    /**
     * Added saving role information
     *
     * @param role role information
     * @return result
     */
    public int insertRole(SysRole role);

    /**
     * Modify and save role information
     *
     * @param role role information
     * @return result
     */
    public int updateRole(SysRole role);

    /**
     * Modify data permission information
     *
     * @param role role information
     * @return result
     */
    public int authDataScope(SysRole role);

    /**
     * Verify that the role name is unique
     *
     * @param role role information
     * @return result
     */
    public String checkRoleNameUnique(SysRole role);

    /**
     * Verify that the role permissions are unique
     *
     * @param role role information
     * @return result
     */
    public String checkRoleKeyUnique(SysRole role);

    /**
     * Verify whether the role allows operation
     *
     * @param role role information
     */
    public void checkRoleAllowed(SysRole role);

    /**
     * Query the number of roles used by role ID
     *
     * @param roleId role ID
     * @return result
     */
    public int countUserRoleByRoleId(Long roleId);

    /**
     * Role status modification
     *
     * @param role role information
     * @return result
     */
    public int changeStatus(SysRole role);

    /**
     * Cancel authorized user role
     *
     * @param userRole user and role association information
     * @return result
     */
    public int deleteAuthUser(SysUserRole userRole);

    /**
     * Cancel authorized user roles in batch
     *
     * @param roleId role ID
     * @param userIds ID of user data to be deleted
     * @return result
     */
    public int deleteAuthUsers(Long roleId, String userIds);

    /**
     * Batch select authorized user roles
     *
     * @param roleId role ID
     * @param userIds ID of the user data to be deleted
     * @return result
     */
    public int insertAuthUsers(Long roleId, String userIds);
}
