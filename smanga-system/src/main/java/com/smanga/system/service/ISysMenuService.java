package com.smanga.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.smanga.common.core.domain.Ztree;
import com.smanga.common.core.domain.entity.SysMenu;
import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.common.core.domain.entity.SysUser;

/**
 * Menu business layer
 *
 * @author Trong Hieu
 */
public interface ISysMenuService
{
    /**
     * Query menu based on user ID
     *
     * @param user user information
     * @return menu list
     */
    public List<SysMenu> selectMenusByUser(SysUser user);

    /**
     * Query system menu list
     *
     * @param menu menu information
     * @param userId user ID
     * @return menu list
     */
    public List<SysMenu> selectMenuList(SysMenu menu, Long userId);

    /**
     * Query menu collection
     *
     * @param userId user ID
     * @return all menu information
     */
    public List<SysMenu> selectMenuAll(Long userId);

    /**
     * Query permissions based on user ID
     *
     * @param userId user ID
     * @return permission list
     */
    public Set<String> selectPermsByUserId(Long userId);

    /**
     * Query menu based on role ID
     *
     * @param role role object
     * @param userId user ID
     * @return menu list
     */
    public List<Ztree> roleMenuTreeData(SysRole role, Long userId);

    /**
     * Query all menu information
     *
     * @param userId user ID
     * @return menu list
     */
    public List<Ztree> menuTreeData(Long userId);

    /**
     * Query all permissions of the system
     *
     * @param userId user ID
     * @return permission list
     */
    public Map<String, String> selectPermsAll(Long userId);

    /**
     * Delete menu management information
     *
     * @param menuId menu ID
     * @return result
     */
    public int deleteMenuById(Long menuId);

    /**
     * Query information based on menu ID
     *
     * @param menuId menu ID
     * @return menu information
     */
    public SysMenu selectMenuById(Long menuId);

    /**
     * Query the number of menus
     *
     * @param parentId menu parent ID
     * @return result
     */
    public int selectCountMenuByParentId(Long parentId);

    /**
     * Query the number of menus used
     *
     * @param menuId menu ID
     * @return result
     */
    public int selectCountRoleMenuByMenuId(Long menuId);

    /**
     * Added save menu information
     *
     * @param menu menu information
     * @return result
     */
    public int insertMenu(SysMenu menu);

    /**
     * Modify and save menu information
     *
     * @param menu menu information
     * @return result
     */
    public int updateMenu(SysMenu menu);

    /**
     * Verify that the menu name is unique
     *
     * @param menu menu information
     * @return result
     */
    public String checkMenuNameUnique(SysMenu menu);
}
