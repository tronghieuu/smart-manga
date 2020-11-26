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

import com.smanga.business.domain.MangaCategory;
import com.smanga.business.service.IMangaCategoryService;
import com.smanga.common.annotation.Log;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.poi.ExcelUtil;

/**
 * Manga CategoryController
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Controller
@RequestMapping("/business/category")
public class BusinessMangaCategoryController extends BaseController {
	private String prefix = "business/category";

	@Autowired
	private IMangaCategoryService mangaCategoryService;

	@GetMapping()
	public String category() {
		return prefix + "/category";
	}

	/**
	 * Query the list of Manga Category
	 */
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(MangaCategory mangaCategory) {
		startPage();
		List<MangaCategory> list = mangaCategoryService.selectMangaCategoryList(mangaCategory);
		return getDataTable(list);
	}

	/**
	 * Export Manga Category list
	 */
	@Log(title = "Manga Category", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(MangaCategory mangaCategory) {
		List<MangaCategory> list = mangaCategoryService.selectMangaCategoryList(mangaCategory);
		ExcelUtil<MangaCategory> util = new ExcelUtil<MangaCategory>(MangaCategory.class);
		return util.exportExcel(list, "category");
	}

	/**
	 * Add Manga Category
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * Add save Manga Category
	 */
	@Log(title = "Manga Category", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(MangaCategory mangaCategory) {
		return toAjax(mangaCategoryService.insertMangaCategory(mangaCategory));
	}

	/**
	 * Modify Manga Category
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, ModelMap mmap) {
		MangaCategory mangaCategory = mangaCategoryService.selectMangaCategoryById(id);
		mmap.put("mangaCategory", mangaCategory);
		return prefix + "/edit";
	}

	/**
	 * Modify and save Manga Category
	 */
	@Log(title = "Manga Category", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(MangaCategory mangaCategory) {
		return toAjax(mangaCategoryService.updateMangaCategory(mangaCategory));
	}

	/**
	 * Delete Manga Category
	 */
	@Log(title = "Manga Category", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(mangaCategoryService.deleteMangaCategoryByIds(ids));
	}

	/**
	 * Check name unique
	 * 
	 * @param mangaCategory
	 * @return
	 */
	@PostMapping("/name/unique")
	@ResponseBody
	public String checkNameUnique(MangaCategory mangaCategory) {
		return mangaCategoryService.checkCategoryNameUnique(mangaCategory);
	}
}
