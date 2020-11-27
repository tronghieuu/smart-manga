package com.smanga.web.controller.business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.smanga.business.domain.ImageFile;
import com.smanga.business.domain.MangaCategory;
import com.smanga.business.service.IImageFileService;
import com.smanga.business.service.IMangaCategoryService;
import com.smanga.common.annotation.Log;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.core.text.Convert;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.StringUtils;
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
	private IImageFileService imageFileService;

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
		// Id image upload
		Long coverImageId = mangaCategory.getCoverImageId();
		if (coverImageId != null) {
			// Update used status
			ImageFile imageFileUpdate = new ImageFile();
			imageFileUpdate.setId(coverImageId);
			imageFileUpdate.setUsedStatus(SmangaConstants.FILE_USED);
			imageFileService.updateImageFile(imageFileUpdate);
		}

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
		MangaCategory mangaCategoryRef = mangaCategoryService.selectMangaCategoryById(mangaCategory.getId());
		if (mangaCategory.getCoverImageId() != null && mangaCategoryRef.getCoverImageId() != null
				&& mangaCategory.getCoverImageId() != mangaCategoryRef.getCoverImageId()) {
			imageFileService.deleteImageFileById(mangaCategoryRef.getCoverImageId());
		}

		Long coverImageId = mangaCategory.getCoverImageId();
		if (coverImageId != null) {
			// Update used status
			ImageFile imageFileUpdate = new ImageFile();
			imageFileUpdate.setId(coverImageId);
			imageFileUpdate.setUsedStatus(SmangaConstants.FILE_USED);
			imageFileService.updateImageFile(imageFileUpdate);
		}

		return toAjax(mangaCategoryService.updateMangaCategory(mangaCategory));
	}

	/**
	 * Delete Manga Category
	 */
	@Log(title = "Manga Category", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		// Get list manga category
		MangaCategory mangaCategoryParam = new MangaCategory();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ids", Convert.toStrArray(ids));
		mangaCategoryParam.setParams(params);
		List<MangaCategory> mangaCategories = mangaCategoryService.selectMangaCategoryList(mangaCategoryParam);
		if (CollectionUtils.isNotEmpty(mangaCategories)) {
			String imageIds = "";
			for (MangaCategory mangaCategory : mangaCategories) {
				if (mangaCategory.getCoverImageId() != null) {
					imageIds += mangaCategory.getCoverImageId() + ",";
				}
			}
			if (StringUtils.isNotEmpty(imageIds)) {
				imageFileService.deleteImageFileByIds(imageIds.substring(0, imageIds.length() - 1));
			}
		}
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

	/**
	 * Search Category with keyword
	 */
	@PostMapping("/list/keyword")
	@ResponseBody
	public List<JSONObject> getCategoryListWithKeyword(String keyword, String categoryIds) {
		MangaCategory mangaCategoryParam = new MangaCategory();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 10);
		params.put("notInIdsArray", Convert.toStrArray(categoryIds));
		params.put("keyword", keyword);
		mangaCategoryParam.setParams(params);
		List<MangaCategory> mangaCategories = mangaCategoryService.selectMangaCategoryList(mangaCategoryParam);

		List<JSONObject> result = new ArrayList<>();
		if (CollectionUtils.isNotEmpty(mangaCategories)) {
			for (MangaCategory mangaCategory : mangaCategories) {
				JSONObject json = new JSONObject();
				json.put("id", mangaCategory.getId());
				json.put("text", mangaCategory.getCategoryName());
				result.add(json);
			}
		}
		return result;
	}
}
