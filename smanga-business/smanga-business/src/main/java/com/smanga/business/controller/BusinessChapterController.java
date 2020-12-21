package com.smanga.business.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.business.domain.Manga;
import com.smanga.business.domain.MangaChapter;
import com.smanga.business.domain.ViewCounter;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.business.service.IMangaService;
import com.smanga.business.service.IViewCounterService;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.utils.ShiroUtils;

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

	@Autowired
	private IViewCounterService viewCounterService;

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
		Manga manga = mangaService.selectMangaById(mangaChapter.getMangaId());
		mmap.put("chapter", mangaChapter);
		mmap.put("manga", manga);
		mmap.put("user", getUserInfo());

		String ip = ShiroUtils.getIp();
		ViewCounter viewCounterParam = new ViewCounter();
		viewCounterParam.setIp(ip);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("expiredTime", new Date());
		viewCounterParam.setParams(params);
		viewCounterParam.setChapterId(chapterId);
		List<ViewCounter> viewCounters = viewCounterService.selectViewCounterList(viewCounterParam);
		if (CollectionUtils.isEmpty(viewCounters)) {
			Date dt = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, 1);
			dt = c.getTime();
			viewCounterParam.setExpiredTime(dt);
			viewCounterService.insertViewCounter(viewCounterParam);

			// Update view for chapter and manga
			mangaChapter.setViewCounter(mangaChapter.getViewCounter() + 1);
			chapterService.updateMangaChapter(mangaChapter);
			manga.setViewCounter(manga.getViewCounter() + 1);
			mangaService.updateManga(manga);
		}

		return prefix + "/index";
	}

	@GetMapping("/manga/{mangaId}/first")
	public String getFirst(@PathVariable("mangaId") Long mangaId, ModelMap mmap) {
		MangaChapter mangaChapter = chapterService.getFirstChapter(mangaId);
		Manga manga = mangaService.selectMangaById(mangaId);
		mmap.put("chapter", mangaChapter);
		mmap.put("manga", manga);
		String ip = ShiroUtils.getIp();
		ViewCounter viewCounterParam = new ViewCounter();
		viewCounterParam.setIp(ip);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("expiredTime", new Date());
		viewCounterParam.setParams(params);
		viewCounterParam.setChapterId(mangaChapter.getId());
		List<ViewCounter> viewCounters = viewCounterService.selectViewCounterList(viewCounterParam);
		if (CollectionUtils.isEmpty(viewCounters)) {
			Date dt = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, 1);
			dt = c.getTime();
			viewCounterParam.setExpiredTime(dt);
			viewCounterService.insertViewCounter(viewCounterParam);

			// Update view for chapter and manga
			mangaChapter.setViewCounter(mangaChapter.getViewCounter() + 1);
			chapterService.updateMangaChapter(mangaChapter);
			manga.setViewCounter(manga.getViewCounter() + 1);
			mangaService.updateManga(manga);
		}
		return prefix + "/index";
	}

	@GetMapping("/manga/{mangaId}/last")
	public String getLast(@PathVariable("mangaId") Long mangaId, ModelMap mmap) {
		MangaChapter mangaChapter = chapterService.getFirstChapter(mangaId);
		Manga manga = mangaService.selectMangaById(mangaId);
		mmap.put("chapter", mangaChapter);
		mmap.put("manga", manga);
		String ip = ShiroUtils.getIp();
		ViewCounter viewCounterParam = new ViewCounter();
		viewCounterParam.setIp(ip);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("expiredTime", new Date());
		viewCounterParam.setParams(params);
		viewCounterParam.setChapterId(mangaChapter.getId());
		List<ViewCounter> viewCounters = viewCounterService.selectViewCounterList(viewCounterParam);
		if (CollectionUtils.isEmpty(viewCounters)) {
			Date dt = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, 1);
			dt = c.getTime();
			viewCounterParam.setExpiredTime(dt);
			viewCounterService.insertViewCounter(viewCounterParam);

			// Update view for chapter and manga
			mangaChapter.setViewCounter(mangaChapter.getViewCounter() + 1);
			chapterService.updateMangaChapter(mangaChapter);
			manga.setViewCounter(manga.getViewCounter() + 1);
			mangaService.updateManga(manga);
		}
		return prefix + "/index";
	}

	@GetMapping("/{chapterId}/manga/{mangaId}/previous")
	public String getPrevious(@PathVariable("chapterId") Long chapterId, @PathVariable("mangaId") Long mangaId,
			ModelMap mmap) {
		MangaChapter mangaChapterRef = chapterService.selectMangaChapterById(chapterId);
		MangaChapter mangaChapter = chapterService.getPreviousChapter(mangaId, mangaChapterRef.getChapterIndex());
		Manga manga = mangaService.selectMangaById(mangaId);
		mmap.put("chapter", mangaChapter);
		mmap.put("manga", manga);
		String ip = ShiroUtils.getIp();
		ViewCounter viewCounterParam = new ViewCounter();
		viewCounterParam.setIp(ip);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("expiredTime", new Date());
		viewCounterParam.setParams(params);
		viewCounterParam.setChapterId(mangaChapter.getId());
		List<ViewCounter> viewCounters = viewCounterService.selectViewCounterList(viewCounterParam);
		if (CollectionUtils.isEmpty(viewCounters)) {
			Date dt = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, 1);
			dt = c.getTime();
			viewCounterParam.setExpiredTime(dt);
			viewCounterService.insertViewCounter(viewCounterParam);

			// Update view for chapter and manga
			mangaChapter.setViewCounter(mangaChapter.getViewCounter() + 1);
			chapterService.updateMangaChapter(mangaChapter);
			manga.setViewCounter(manga.getViewCounter() + 1);
			mangaService.updateManga(manga);
		}
		return prefix + "/index";
	}

	@GetMapping("/{chapterId}/manga/{mangaId}/next")
	public String getNext(@PathVariable("chapterId") Long chapterId, @PathVariable("mangaId") Long mangaId,
			ModelMap mmap) {
		MangaChapter mangaChapterRef = chapterService.selectMangaChapterById(chapterId);
		MangaChapter mangaChapter = chapterService.getNextChapter(mangaId, mangaChapterRef.getChapterIndex());
		Manga manga = mangaService.selectMangaById(mangaId);
		mmap.put("chapter", mangaChapter);
		mmap.put("manga", manga);
		String ip = ShiroUtils.getIp();
		ViewCounter viewCounterParam = new ViewCounter();
		viewCounterParam.setIp(ip);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("expiredTime", new Date());
		viewCounterParam.setParams(params);
		viewCounterParam.setChapterId(mangaChapter.getId());
		List<ViewCounter> viewCounters = viewCounterService.selectViewCounterList(viewCounterParam);
		if (CollectionUtils.isEmpty(viewCounters)) {
			Date dt = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			c.add(Calendar.DATE, 1);
			dt = c.getTime();
			viewCounterParam.setExpiredTime(dt);
			viewCounterService.insertViewCounter(viewCounterParam);

			// Update view for chapter and manga
			mangaChapter.setViewCounter(mangaChapter.getViewCounter() + 1);
			chapterService.updateMangaChapter(mangaChapter);
			manga.setViewCounter(manga.getViewCounter() + 1);
			mangaService.updateManga(manga);
		}
		return prefix + "/index";
	}
}
