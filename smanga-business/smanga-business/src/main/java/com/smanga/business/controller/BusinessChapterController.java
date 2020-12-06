package com.smanga.business.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.business.domain.MangaChapter;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.business.service.IMangaService;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.domain.AjaxResult;

/**
 * @author Trong Hieu
 *
 */
@Controller
@RequestMapping("/public/chapter")
public class BusinessChapterController extends BusinessBaseController {

	private String prefix = "public/chapter";

	@Autowired
	private IMangaService mangaService;

	@Autowired
	private IMangaChapterService chapterService;

	@GetMapping("/manga/{mangaId}/list")
	@ResponseBody
	public AjaxResult getChapterList(@PathVariable("mangaId") Long mangaId) {
		MangaChapter mangaChapterParam = new MangaChapter();
		mangaChapterParam.setMangaId(mangaId);
		mangaChapterParam.setStatus(SmangaConstants.STATUS_ENABLED);
		List<MangaChapter> chapters = chapterService.selectChapterListForManga(mangaChapterParam);
		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("chapters", chapters);
		return ajaxResult;
	}

	@GetMapping("/{chapterId}")
	public String getChapterContent(@PathVariable("chapterId") Long chapterId, ModelMap mmap) {
		MangaChapter mangaChapter = chapterService.selectMangaChapterById(chapterId);
		mmap.put("chapter", mangaChapter);
		mmap.put("manga", mangaService.selectMangaById(mangaChapter.getMangaId()));
		return prefix + "/index";
	}
}
