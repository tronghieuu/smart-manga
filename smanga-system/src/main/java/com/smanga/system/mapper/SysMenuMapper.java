package com.smanga.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.smanga.common.core.domain.entity.SysMenu;

/**
 * Menu table Data layer
 * 
 * @author Trong Hieu
 */
public interface SysMenuMapper
{
    /**
     * Query all menus of the system (including buttons)
     * 
     * @return Menu list
     */
    public List<SysMenu> selectMenuAll();

    /**
     * Query menu based on user ID
     * 
     * @param userId User ID
     * @return Menu list
     */
    public List<SysMenu> selectMenuAllByUserId(Long userId);

    /**
     * Query the normal display menu of the system (without buttons)
     * 
     * @return Menu list
     */
    public List<SysMenu> selectMenuNormalAll();

    /**
     * Query menu based on user ID
     * 
     * @param userId User ID
     * @return Menu list
     */
    public List<SysMenu> selectMenusByUserId(Long userId);

    /**
     * Query permissions based on user ID
     * 
     * @param userId User ID
     * @return Permission list
     */
    public List<String> selectPermsByUserId(Long userId);

    /**
     * Query menu based on role ID
     * 
     * @param roleId Role ID
     * @return Menu list
     */
    public List<String> selectMenuTree(Long roleId);

    /**
     * Query system menu list
     * 
     * @param menu Menu information
     * @return Menu list
     */
    public List<SysMenu> selectMenuList(SysMenu menu);

    /**
     * Query system menu list
     * 
     * @param menu Menu information
     * @return Menu list
     */
    public List<SysMenu> selectMenuListByUserId(SysMenu menu);

    /**
     * Delete menu management information
     * 
     * @param menuId Menu ID
     * @return result
     */
    public int deleteMenuById(Long menuId);

    /**
     * Query information based on menu ID
     * 
     * @param menuId Menu ID
     * @return Menu information
     */
    public SysMenu selectMenuById(Long menuId);

    /**
     * Query the number of menus
     * 
     * @param parentId Menu parent ID
     * @return result
     */
    public int selectCountMenuByParentId(Long parentId);

    /**
     * New menu information
     * 
     * @param menu Menu information
     * @return result
     */
    public int insertMenu(SysMenu menu);

    /**
     * Modify menu information
     * 
     * @param menu Menu information
     * @return result
     */
    public int updateMenu(SysMenu menu);

    /**
     * Verify that the menu name is unique
     * 
     * @param menuName Menu name
     * @param parentId Parent menu ID
     * @return result
     */
    public SysMenu checkMenuNameUnique(@Param("menuName") String menuName, @Param("parentId") Long parentId);
}
