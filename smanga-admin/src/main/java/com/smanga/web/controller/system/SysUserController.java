package com.smanga.web.controller.system;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smanga.common.annotation.Log;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.framework.shiro.service.SysPasswordService;
import com.smanga.system.service.ISysPostService;
import com.smanga.system.service.ISysRoleService;
import com.smanga.system.service.ISysUserService;

/**
 * User Info
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/system/user")
public class SysUserController extends BaseController {
	private String prefix = "system/user";

	@Autowired
	private ISysUserService userService;

	@Autowired
	private ISysRoleService roleService;

	@Autowired
	private ISysPostService postService;

	@Autowired
	private SysPasswordService passwordService;

	@RequiresPermissions("system:user:view")
	@GetMapping()
	public String user() {
		return prefix + "/user";
	}

	@RequiresPermissions("system:user:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(SysUser user) {
		startPage();
		List<SysUser> list = userService.selectUserList(user);
		return getDataTable(list);
	}

	@Log(title = "User Management", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:user:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysUser user) {
		List<SysUser> list = userService.selectUserList(user);
		ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
		return util.exportExcel(list, "User Data");
	}

	@Log(title = "User Management", businessType = BusinessType.IMPORT)
	@RequiresPermissions("system:user:import")
	@PostMapping("/importData")
	@ResponseBody
	public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
		ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
		List<SysUser> userList = util.importExcel(file.getInputStream());
		String operName = ShiroUtils.getSysUser().getLoginName();
		String message = userService.importUser(userList, updateSupport, operName);
		return AjaxResult.success(message);
	}

	@RequiresPermissions("system:user:view")
	@GetMapping("/importTemplate")
	@ResponseBody
	public AjaxResult importTemplate() {
		ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
		return util.importTemplateExcel("User Data");
	}

	/**
	 * New users
	 */
	@GetMapping("/add")
	public String add(ModelMap mmap) {
		mmap.put("roles", roleService.selectRoleAll().stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
		mmap.put("posts", postService.selectPostAll());
		return prefix + "/add";
	}

	/**
	 * Add save user
	 */
	@RequiresPermissions("system:user:add")
	@Log(title = "User Management", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(@Validated SysUser user) {
		if (UserConstants.USER_NAME_NOT_UNIQUE.equals(userService.checkLoginNameUnique(user.getLoginName()))) {
			return error("New user '" + user.getLoginName() + "' failed, login account already exists");
		} else if (StringUtils.isNotEmpty(user.getPhonenumber())
				&& UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
			return error("Add user '" + user.getLoginName() + "' failed, mobile phone number already exists");
		} else if (StringUtils.isNotEmpty(user.getEmail())
				&& UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
			return error("New user '" + user.getLoginName() + "' failed, the email account already exists");
		}
		user.setSalt(ShiroUtils.randomSalt());
		user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
		user.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(userService.insertUser(user));
	}

	/**
	 * Modify user
	 */
	@GetMapping("/edit/{userId}")
	public String edit(@PathVariable("userId") Long userId, ModelMap mmap) {
		List<SysRole> roles = roleService.selectRolesByUserId(userId);
		mmap.put("user", userService.selectUserById(userId));
		mmap.put("roles", SysUser.isAdmin(userId) ? roles
				: roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
		mmap.put("posts", postService.selectPostsByUserId(userId));
		return prefix + "/edit";
	}

	/**
	 * Modify save user
	 */
	@RequiresPermissions("system:user:edit")
	@Log(title = "User Management", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(@Validated SysUser user) {
		// userService.checkUserAllowed(user);
		if (StringUtils.isNotEmpty(user.getPhonenumber())
				&& UserConstants.USER_PHONE_NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
			return error("Modify user '" + user.getLoginName() + "' failed, mobile phone number already exists");
		} else if (StringUtils.isNotEmpty(user.getEmail())
				&& UserConstants.USER_EMAIL_NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
			return error("Modify user '" + user.getLoginName() + "' failed, the email account already exists");
		}
		user.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(userService.updateUser(user));
	}

	@RequiresPermissions("system:user:resetPwd")
	@GetMapping("/resetPwd/{userId}")
	public String resetPwd(@PathVariable("userId") Long userId, ModelMap mmap) {
		mmap.put("user", userService.selectUserById(userId));
		return prefix + "/resetPwd";
	}

	@RequiresPermissions("system:user:resetPwd")
	@Log(title = "Reset password", businessType = BusinessType.UPDATE)
	@PostMapping("/resetPwd")
	@ResponseBody
	public AjaxResult resetPwdSave(SysUser user) {
		// userService.checkUserAllowed(user);
		user.setSalt(ShiroUtils.randomSalt());
		user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
		if (userService.resetUserPwd(user) > 0) {
			if (ShiroUtils.getUserId().longValue() == user.getUserId().longValue()) {
				ShiroUtils.setSysUser(userService.selectUserById(user.getUserId()));
			}
			return success();
		}
		return error();
	}

	/**
	 * Enter the authorization role page
	 */
	@GetMapping("/authRole/{userId}")
	public String authRole(@PathVariable("userId") Long userId, ModelMap mmap) {
		SysUser user = userService.selectUserById(userId);
		// Get the list of roles the user belongs to
		List<SysRole> roles = roleService.selectRolesByUserId(userId);
		mmap.put("user", user);
		mmap.put("roles", SysUser.isAdmin(userId) ? roles
				: roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
		return prefix + "/authRole";
	}

	/**
	 * User authorization role
	 */
	@RequiresPermissions("system:user:add")
	@Log(title = "User Management", businessType = BusinessType.GRANT)
	@PostMapping("/authRole/insertAuthRole")
	@ResponseBody
	public AjaxResult insertAuthRole(Long userId, Long[] roleIds) {
		userService.insertUserAuth(userId, roleIds);
		return success();
	}

	@RequiresPermissions("system:user:remove")
	@Log(title = "User Management", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		try {
			return toAjax(userService.deleteUserByIds(ids));
		} catch (Exception e) {
			return error(e.getMessage());
		}
	}

	/**
	 * Verify user name
	 */
	@PostMapping("/checkLoginNameUnique")
	@ResponseBody
	public String checkLoginNameUnique(SysUser user) {
		return userService.checkLoginNameUnique(user.getLoginName());
	}

	/**
	 * Check mobile phone number
	 */
	@PostMapping("/checkPhoneUnique")
	@ResponseBody
	public String checkPhoneUnique(SysUser user) {
		return userService.checkPhoneUnique(user);
	}

	/**
	 * Verify email address
	 */
	@PostMapping("/checkEmailUnique")
	@ResponseBody
	public String checkEmailUnique(SysUser user) {
		return userService.checkEmailUnique(user);
	}

	/**
	 * User status modification
	 */
	@Log(title = "User Management", businessType = BusinessType.UPDATE)
	@RequiresPermissions("system:user:edit")
	@PostMapping("/changeStatus")
	@ResponseBody
	public AjaxResult changeStatus(SysUser user) {
		userService.checkUserAllowed(user);
		return toAjax(userService.changeStatus(user));
	}
}