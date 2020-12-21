package com.smanga.business.controller;

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

import com.smanga.business.domain.BusinessUser;
import com.smanga.business.domain.Manga;
import com.smanga.business.domain.MangaChapter;
import com.smanga.business.domain.RecommendManga;
import com.smanga.business.domain.UserManga;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.business.service.IMangaService;
import com.smanga.business.service.IRecommendMangaService;
import com.smanga.business.service.IUserMangaService;
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
	private IUserMangaService userMangaService;

	@Autowired
	private IMangaService mangaService;

	@Autowired
	private IRecommendMangaService recommendMangaService;

	@GetMapping("/{mangaId}")
	public String getMangaInfo(@PathVariable("mangaId") Long mangaId, ModelMap mmap) {
		Manga manga = mangaService.selectMangaById(mangaId);
		mmap.put("manga", manga);
		mmap.put("user", getUserInfo());
		mmap.put("popularChapter", mangaChapterService.selectMostPopularChapter(new MangaChapter()));
		// Get rating info
		mmap.put("ratingInfo", userMangaService.getRatingInfo(mangaId));

		// Save user history
		BusinessUser user = getUserInfo();
		if (user != null) {
			UserManga userMangaParam = new UserManga();
			userMangaParam.setUserId(user.getUserId());
			userMangaParam.setMangaId(mangaId);
			List<UserManga> userMangas = userMangaService.selectUserMangaList(userMangaParam);
			if (CollectionUtils.isEmpty(userMangas)) {
				userMangaParam.setCreateBy(user.getUserName());
				userMangaService.insertUserManga(userMangaParam);
			}

			// Unlist the manga from recommend list for this user
			RecommendManga recommendMangaParam = new RecommendManga();
			recommendMangaParam.setUserId(user.getUserId());
			recommendMangaParam.setMangaId(mangaId);
			recommendMangaParam.setIsRecommend(1);
			List<RecommendManga> recommendMangas = recommendMangaService.selectRecommendMangaList(recommendMangaParam);
			if (CollectionUtils.isNotEmpty(recommendMangas)) {
				recommendMangaParam = recommendMangas.get(0);
				recommendMangaParam.setIsRecommend(0);
				recommendMangaService.updateRecommendManga(recommendMangaParam);
			}
		}

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

	@PostMapping("/{mangaId}/rating")
	@ResponseBody
	public AjaxResult rating(@PathVariable("mangaId") Long mangaId, Integer star) {
		BusinessUser user = getUserInfo();
		if (user == null) {
			return error("You need login to rating!");
		}
		Manga manga = mangaService.selectMangaById(mangaId);
		AjaxResult ajaxResult = AjaxResult.success();
		UserManga userMangaParam = new UserManga();
		userMangaParam.setMangaId(mangaId);
		userMangaParam.setUserId(user.getUserId());
		List<UserManga> userMangas = userMangaService.selectUserMangaList(userMangaParam);
		if (CollectionUtils.isNotEmpty(userMangas)) {
			UserManga userManga = userMangas.get(0);
			userManga.setUserName(user.getUserName());
			userManga.setMangaName(manga.getMangaName());
			userManga.setRating(star.longValue());
			userMangaService.updateUserManga(userManga);
		} else {
			UserManga userManga = new UserManga();
			userManga.setUserId(user.getUserId());
			userManga.setMangaId(mangaId);
			userManga.setUserName(user.getUserName());
			userManga.setMangaName(manga.getMangaName());
			userManga.setRating(star.longValue());
			userManga.setCreateBy(user.getUserName());
			userMangaService.insertUserManga(userManga);
		}

		// Get rating info
		ajaxResult.put("ratingInfo", userMangaService.getRatingInfo(mangaId));
		return ajaxResult;
	}

	@GetMapping("/recommend")
	@ResponseBody
	public AjaxResult getRecommendManga() {
		BusinessUser user = getUserInfo();
		if (user == null) {
			return error();
		}
		Manga manga = new Manga();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", user.getUserId());
		manga.setParams(params);
		List<Manga> mangas = mangaService.selectRecommendMangaList(manga);
		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("mangas", mangas);
		return ajaxResult;
	}
}
