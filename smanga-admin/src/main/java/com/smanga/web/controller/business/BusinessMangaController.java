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

import com.smanga.business.domain.ImageFile;
import com.smanga.business.domain.Manga;
import com.smanga.business.service.IImageFileService;
import com.smanga.business.service.IMangaService;
import com.smanga.common.annotation.Log;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.framework.shiro.util.ShiroUtils;

/**
 * MangaController
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Controller
@RequestMapping("/business/manga")
public class BusinessMangaController extends BaseController {
	private String prefix = "business/manga";

	@Autowired
	private IMangaService mangaService;

	@Autowired
	private IImageFileService imageFileService;

	@GetMapping()
	public String manga() {
		return prefix + "/manga";
	}

	/**
	 * Query the list of Manga
	 */
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Manga manga) {
		startPage();
		List<Manga> list = mangaService.selectMangaList(manga);
		return getDataTable(list);
	}

	/**
	 * Export Manga list
	 */
	@Log(title = "Manga", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(Manga manga) {
		List<Manga> list = mangaService.selectMangaList(manga);
		ExcelUtil<Manga> util = new ExcelUtil<Manga>(Manga.class);
		return util.exportExcel(list, "manga");
	}

	/**
	 * Add Manga
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * Add save Manga
	 */
	@Log(title = "Manga", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Manga manga) {
		// Id cover image upload
		Long coverImageId = manga.getCoverImageId();
		if (coverImageId != null) {
			// Update used status
			ImageFile imageFileUpdate = new ImageFile();
			imageFileUpdate.setId(coverImageId);
			imageFileUpdate.setUsedStatus(SmangaConstants.FILE_USED);
			imageFileUpdate.setUpdateBy(ShiroUtils.getLoginName());
			imageFileService.updateImageFile(imageFileUpdate);
		}

		// Id slide image upload
		Long slideImageId = manga.getSlideImageId();
		if (coverImageId != null) {
			// Update used status
			ImageFile imageFileUpdate = new ImageFile();
			imageFileUpdate.setId(slideImageId);
			imageFileUpdate.setUsedStatus(SmangaConstants.FILE_USED);
			imageFileUpdate.setUpdateBy(ShiroUtils.getLoginName());
			imageFileService.updateImageFile(imageFileUpdate);
		}
		manga.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(mangaService.insertManga(manga));
	}

	/**
	 * Modify Manga
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, ModelMap mmap) {
		Manga manga = mangaService.selectMangaById(id);
		mmap.put("manga", manga);
		return prefix + "/edit";
	}

	/**
	 * Modify and save Manga
	 */
	@Log(title = "Manga", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Manga manga) {
		Manga mangaRef = mangaService.selectMangaById(manga.getId());
		if (manga.getCoverImageId() != null && mangaRef.getCoverImageId() != null
				&& manga.getCoverImageId() != mangaRef.getCoverImageId()) {
			imageFileService.deleteImageFileById(mangaRef.getCoverImageId());
		}

		if (manga.getSlideImageId() != null && mangaRef.getSlideImageId() != null
				&& manga.getSlideImageId() != mangaRef.getSlideImageId()) {
			imageFileService.deleteImageFileById(mangaRef.getSlideImageId());
		}

		// Id cover image upload
		Long coverImageId = manga.getCoverImageId();
		if (coverImageId != null) {
			// Update used status
			ImageFile imageFileUpdate = new ImageFile();
			imageFileUpdate.setId(coverImageId);
			imageFileUpdate.setUsedStatus(SmangaConstants.FILE_USED);
			imageFileUpdate.setUpdateBy(ShiroUtils.getLoginName());
			imageFileService.updateImageFile(imageFileUpdate);
		}

		// Id slide image upload
		Long slideImageId = manga.getSlideImageId();
		if (coverImageId != null) {
			// Update used status
			ImageFile imageFileUpdate = new ImageFile();
			imageFileUpdate.setId(slideImageId);
			imageFileUpdate.setUsedStatus(SmangaConstants.FILE_USED);
			imageFileUpdate.setUpdateBy(ShiroUtils.getLoginName());
			imageFileService.updateImageFile(imageFileUpdate);
		}
		manga.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(mangaService.updateManga(manga));
	}

	/**
	 * Delete Manga
	 */
	@Log(title = "Manga", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(mangaService.deleteMangaByIds(ids));
	}

	@GetMapping("/chapters/{id}")
	public String chapter(@PathVariable("id") Long id, ModelMap mmap) {
		mmap.put("mangaId", id);
		return "business/chapter/chapter";
	}
}
