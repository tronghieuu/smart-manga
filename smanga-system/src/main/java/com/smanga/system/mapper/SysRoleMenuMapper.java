package com.smanga.system.mapper;

import java.util.List;

import com.smanga.system.domain.SysRoleMenu;

/**
 * Role and menu association table Data layer
 *
 * @author Trong Hieu
 */
public interface SysRoleMenuMapper
{
    /**
     * Delete role and menu association by role ID
     *
     * @param roleId role ID
     * @return result
     */
    public int deleteRoleMenuByRoleId(Long roleId);
    
    /**
     * Batch delete role menu associated information
     *
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteRoleMenu(Long[] ids);
    
    /**
     * Query the number of menus used
     *
     * @param menuId menu ID
     * @return result
     */
    public int selectCountRoleMenuByMenuId(Long menuId);
    
    /**
     * Add role menu information in batches
     *
     * @param roleMenuList role menu list
     * @return result
     */
    public int batchRoleMenu(List<SysRoleMenu> roleMenuList);
}
