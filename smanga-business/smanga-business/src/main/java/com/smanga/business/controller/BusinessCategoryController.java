package com.smanga.business.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.business.domain.MangaCategory;
import com.smanga.business.service.IMangaCategoryService;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.domain.AjaxResult;

/**
 * @author Trong Hieu
 *
 */
@Controller
@RequestMapping("/public/category")
public class BusinessCategoryController extends BusinessBaseController {

	@Autowired
	private IMangaCategoryService categoryService;

	@GetMapping("/list")
	@ResponseBody
	public AjaxResult getListCategory() {
		MangaCategory mangaCategoryParam = new MangaCategory();
		mangaCategoryParam.setDelFlag(SmangaConstants.DEL_FLAG_NOT_DELETED);
		mangaCategoryParam.setStatus(SmangaConstants.STATUS_ENABLED);
		List<MangaCategory> categories = categoryService.selectMangaCategoryList(mangaCategoryParam);
		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("categories", categories);
		return ajaxResult;
	}
}
