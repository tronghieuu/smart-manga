package com.smanga.system.service.impl;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.domain.Ztree;
import com.smanga.common.core.domain.entity.SysMenu;
import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.utils.StringUtils;
import com.smanga.system.mapper.SysMenuMapper;
import com.smanga.system.mapper.SysRoleMenuMapper;
import com.smanga.system.service.ISysMenuService;

/**
 * Menu business layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysMenuServiceImpl implements ISysMenuService {
	public static final String PREMISSION_STRING = "perms[\"{0}\"]";

	@Autowired
	private SysMenuMapper menuMapper;

	@Autowired
	private SysRoleMenuMapper roleMenuMapper;

	/**
	 * According to user query menu
	 *
	 * @param user user information
	 * @return menu list
	 */
	@Override
	public List<SysMenu> selectMenusByUser(SysUser user) {
		List<SysMenu> menus = new LinkedList<SysMenu>();
		// The administrator displays all menu information
		if (user.isAdmin()) {
			menus = menuMapper.selectMenuNormalAll();
		} else {
			menus = menuMapper.selectMenusByUserId(user.getUserId());
		}
		return getChildPerms(menus, 0);
	}

	/**
	 * Query menu collection
	 *
	 * @return all menu information
	 */
	@Override
	public List<SysMenu> selectMenuList(SysMenu menu, Long userId) {
		List<SysMenu> menuList = null;
		if (SysUser.isAdmin(userId)) {
			menuList = menuMapper.selectMenuList(menu);
		} else {
			menu.getParams().put("userId", userId);
			menuList = menuMapper.selectMenuListByUserId(menu);
		}
		return menuList;
	}

	/**
	 * Query menu collection
	 *
	 * @return all menu information
	 */
	@Override
	public List<SysMenu> selectMenuAll(Long userId) {
		List<SysMenu> menuList = null;
		if (SysUser.isAdmin(userId)) {
			menuList = menuMapper.selectMenuAll();
		} else {
			menuList = menuMapper.selectMenuAllByUserId(userId);
		}
		return menuList;
	}

	/**
	 * Query permissions based on user ID
	 *
	 * @param userId user ID
	 * @return permission list
	 */
	@Override
	public Set<String> selectPermsByUserId(Long userId) {
		List<String> perms = menuMapper.selectPermsByUserId(userId);
		Set<String> permsSet = new HashSet<>();
		for (String perm : perms) {
			if (StringUtils.isNotEmpty(perm)) {
				permsSet.addAll(Arrays.asList(perm.trim().split(",")));
			}
		}
		return permsSet;
	}

	/**
	 * Query menu based on role ID
	 *
	 * @param role role object
	 * @return menu list
	 */
	@Override
	public List<Ztree> roleMenuTreeData(SysRole role, Long userId) {
		Long roleId = role.getRoleId();
		List<Ztree> ztrees = new ArrayList<Ztree>();
		List<SysMenu> menuList = selectMenuAll(userId);
		if (StringUtils.isNotNull(roleId)) {
			List<String> roleMenuList = menuMapper.selectMenuTree(roleId);
			ztrees = initZtree(menuList, roleMenuList, true);
		} else {
			ztrees = initZtree(menuList, null, true);
		}
		return ztrees;
	}

	/**
	 * Query all menus
	 *
	 * @return menu list
	 */
	@Override
	public List<Ztree> menuTreeData(Long userId) {
		List<SysMenu> menuList = selectMenuAll(userId);
		List<Ztree> ztrees = initZtree(menuList);
		return ztrees;
	}

	/**
	 * Query all permissions of the system
	 *
	 * @return permission list
	 */
	@Override
	public LinkedHashMap<String, String> selectPermsAll(Long userId) {
		LinkedHashMap<String, String> section = new LinkedHashMap<>();
		List<SysMenu> permissions = selectMenuAll(userId);
		if (StringUtils.isNotEmpty(permissions)) {
			for (SysMenu menu : permissions) {
				section.put(menu.getUrl(), MessageFormat.format(PREMISSION_STRING, menu.getPerms()));
			}
		}
		return section;
	}

	/**
	 * Object to menu tree
	 *
	 * @param menuList menu list
	 * @return tree structure list
	 */
	public List<Ztree> initZtree(List<SysMenu> menuList) {
		return initZtree(menuList, null, false);
	}

	/**
	 * Object to menu tree
	 *
	 * @param menuList     menu list
	 * @param roleMenuList role already exists in the menu list
	 * @param permsFlag    does it need to display the permission flag
	 * @return tree structure list
	 */
	public List<Ztree> initZtree(List<SysMenu> menuList, List<String> roleMenuList, boolean permsFlag) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(roleMenuList);
		for (SysMenu menu : menuList) {
			Ztree ztree = new Ztree();
			ztree.setId(menu.getMenuId());
			ztree.setpId(menu.getParentId());
			ztree.setName(transMenuName(menu, permsFlag));
			ztree.setTitle(menu.getMenuName());
			if (isCheck) {
				ztree.setChecked(roleMenuList.contains(menu.getMenuId() + menu.getPerms()));
			}
			ztrees.add(ztree);
		}
		return ztrees;
	}

	public String transMenuName(SysMenu menu, boolean permsFlag) {
		StringBuffer sb = new StringBuffer();
		sb.append(menu.getMenuName());
		if (permsFlag) {
			sb.append("<font color=\"#888\">&nbsp;&nbsp;&nbsp;" + menu.getPerms() + "</font>");
		}
		return sb.toString();
	}

	/**
	 * Delete menu management information
	 *
	 * @param menuId menu ID
	 * @return result
	 */
	@Override
	public int deleteMenuById(Long menuId) {
		return menuMapper.deleteMenuById(menuId);
	}

	/**
	 * Query information based on menu ID
	 *
	 * @param menuId menu ID
	 * @return menu information
	 */
	@Override
	public SysMenu selectMenuById(Long menuId) {
		return menuMapper.selectMenuById(menuId);
	}

	/**
	 * Query the number of submenus
	 *
	 * @param parentId parent menu ID
	 * @return result
	 */
	@Override
	public int selectCountMenuByParentId(Long parentId) {
		return menuMapper.selectCountMenuByParentId(parentId);
	}

	/**
	 * Query the number of menus used
	 *
	 * @param menuId menu ID
	 * @return result
	 */
	@Override
	public int selectCountRoleMenuByMenuId(Long menuId) {
		return roleMenuMapper.selectCountRoleMenuByMenuId(menuId);
	}

	/**
	 * Added save menu information
	 *
	 * @param menu menu information
	 * @return result
	 */
	@Override
	public int insertMenu(SysMenu menu) {
		return menuMapper.insertMenu(menu);
	}

	/**
	 * Modify and save menu information
	 *
	 * @param menu menu information
	 * @return result
	 */
	@Override
	public int updateMenu(SysMenu menu) {
		return menuMapper.updateMenu(menu);
	}

	/**
	 * Verify that the menu name is unique
	 *
	 * @param menu menu information
	 * @return result
	 */
	@Override
	public String checkMenuNameUnique(SysMenu menu) {
		Long menuId = StringUtils.isNull(menu.getMenuId()) ? -1L : menu.getMenuId();
		SysMenu info = menuMapper.checkMenuNameUnique(menu.getMenuName(), menu.getParentId());
		if (StringUtils.isNotNull(info) && info.getMenuId().longValue() != menuId.longValue()) {
			return UserConstants.MENU_NAME_NOT_UNIQUE;
		}
		return UserConstants.MENU_NAME_UNIQUE;
	}

	/**
	 * Get all child nodes according to the ID of the parent node
	 *
	 * @param list     classification table
	 * @param parentId The parent node ID passed in
	 * @return String
	 */
	public List<SysMenu> getChildPerms(List<SysMenu> list, int parentId) {
		List<SysMenu> returnList = new ArrayList<SysMenu>();
		for (Iterator<SysMenu> iterator = list.iterator(); iterator.hasNext();) {
			SysMenu t = (SysMenu) iterator.next();
			// 1. According to a parent node ID passed in, traverse all child nodes of the parent node
			if (t.getParentId() == parentId) {
				recursionFn(list, t);
				returnList.add(t);
			}
		}
		return returnList;
	}

	/**
	 * Recursive list
	 *
	 * @param list
	 * @param t
	 */
	private void recursionFn(List<SysMenu> list, SysMenu t) {
		// Get the list of child nodes
		List<SysMenu> childList = getChildList(list, t);
		t.setChildren(childList);
		for (SysMenu tChild : childList) {
			if (hasChild(list, tChild)) {
				recursionFn(list, tChild);
			}
		}
	}

	/**
	 * Get the list of child nodes
	 */
	private List<SysMenu> getChildList(List<SysMenu> list, SysMenu t) {
		List<SysMenu> tlist = new ArrayList<SysMenu>();
		Iterator<SysMenu> it = list.iterator();
		while (it.hasNext()) {
			SysMenu n = (SysMenu) it.next();
			if (n.getParentId().longValue() == t.getMenuId().longValue()) {
				tlist.add(n);
			}
		}
		return tlist;
	}

	/**
	 * Determine whether there are child nodes
	 */
	private boolean hasChild(List<SysMenu> list, SysMenu t) {
		return getChildList(list, t).size() > 0 ? true : false;
	}
}
