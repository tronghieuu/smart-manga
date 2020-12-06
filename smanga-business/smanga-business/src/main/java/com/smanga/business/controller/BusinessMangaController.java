package com.smanga.business.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.business.domain.Manga;
import com.smanga.business.domain.MangaChapter;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.business.service.IMangaService;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;

/**
 * @author Trong Hieu
 *
 */
@Controller
@RequestMapping("/public/manga")
public class BusinessMangaController extends BusinessBaseController {

	private String prefix = "public/manga";

	@Autowired
	private IMangaChapterService mangaChapterService;

	@Autowired
	private IMangaService mangaService;

	@GetMapping("/{mangaId}")
	public String getMangaInfo(@PathVariable("mangaId") Long mangaId, ModelMap mmap) {
		Manga manga = mangaService.selectMangaById(mangaId);
		mmap.put("manga", manga);
		return prefix + "/index";
	}

	@GetMapping("/latest")
	@ResponseBody
	public AjaxResult getLatestMangaList(int pageNum, int pageSize) {
		startPage(pageNum, pageSize);
		List<MangaChapter> mangaChapters = mangaChapterService.selectMangaChapterLatestList(new MangaChapter());
		TableDataInfo data = getDataTable(mangaChapters);
		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("mangaLatestList", data);
		return ajaxResult;
	}
}
