package com.smanga.web.controller.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.business.domain.BusinessUser;
import com.smanga.business.service.IBusinessUserService;
import com.smanga.common.annotation.Log;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.framework.shiro.service.SysPasswordService;
import com.smanga.framework.shiro.util.ShiroUtils;

/**
 * Business User Information FormController
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Controller
@RequestMapping("/business/user")
public class BusinessUserController extends BaseController {
	private String prefix = "business/user";

	@Autowired
	private IBusinessUserService businessUserService;

	@Autowired
	private SysPasswordService passwordService;

	@GetMapping()
	public String user() {
		return prefix + "/user";
	}

	/**
	 * Query the list of Business User Information Form
	 */
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BusinessUser businessUser) {
		startPage();
		businessUser.setDelFlag(SmangaConstants.BUSINESS_USER_NOT_DEL);
		List<BusinessUser> list = businessUserService.selectBusinessUserList(businessUser);
		return getDataTable(list);
	}

	/**
	 * Export Business User Information Form list
	 */
	@Log(title = "Business User Information Form", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(BusinessUser businessUser) {
		List<BusinessUser> list = businessUserService.selectBusinessUserList(businessUser);
		ExcelUtil<BusinessUser> util = new ExcelUtil<BusinessUser>(BusinessUser.class);
		return util.exportExcel(list, "user");
	}

	/**
	 * Add Business User Information Form
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * Add save Business User Information Form
	 */
	@Log(title = "Business User Information Form", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BusinessUser businessUser) {
		businessUser.setSalt(ShiroUtils.randomSalt());
		businessUser.setPassword(passwordService.encryptPassword(businessUser.getLoginName(),
				businessUser.getPassword(), businessUser.getSalt()));
		businessUser.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(businessUserService.insertBusinessUser(businessUser));
	}

	/**
	 * Modify Business User Information Form
	 */
	@GetMapping("/edit/{userId}")
	public String edit(@PathVariable("userId") Long userId, ModelMap mmap) {
		BusinessUser businessUser = businessUserService.selectBusinessUserById(userId);
		mmap.put("user", businessUser);
		return prefix + "/edit";
	}

	/**
	 * Modify and save Business User Information Form
	 */
	@Log(title = "Business User Information Form", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BusinessUser businessUser) {
		return toAjax(businessUserService.updateBusinessUser(businessUser));
	}

	/**
	 * Delete Business User Information Form
	 */
	@Log(title = "Business User Information Form", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(businessUserService.deleteBusinessUserByIds(ids));
	}

	/**
	 * Verify login account name
	 */
	@PostMapping("/name/unique")
	@ResponseBody
	public String checkLoginNameUnique(BusinessUser user) {
		return businessUserService.checkLoginNameUnique(user);
	}

	/**
	 * Check mobile phone number
	 */
	@PostMapping("/phone/unique")
	@ResponseBody
	public String checkPhoneUnique(BusinessUser user) {
		return businessUserService.checkPhoneUnique(user);
	}

	/**
	 * Verify email address
	 */
	@PostMapping("/email/unique")
	@ResponseBody
	public String checkEmailUnique(BusinessUser user) {
		return businessUserService.checkEmailUnique(user);
	}
}
