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
import com.smanga.business.domain.Artist;
import com.smanga.business.service.IArtistService;
import com.smanga.common.annotation.Log;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.core.text.Convert;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.framework.shiro.util.ShiroUtils;

/**
 * artistController
 * 
 * @author Trong Hieu
 * @date 2020-11-29
 */
@Controller
@RequestMapping("/business/artist")
public class BusinessArtistController extends BaseController {
	private String prefix = "business/artist";

	@Autowired
	private IArtistService artistService;

	@GetMapping()
	public String artist() {
		return prefix + "/artist";
	}

	/**
	 * Query the list of artist
	 */
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Artist artist) {
		startPage();
		List<Artist> list = artistService.selectArtistList(artist);
		return getDataTable(list);
	}

	/**
	 * Export artist list
	 */
	@Log(title = "artist", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(Artist artist) {
		List<Artist> list = artistService.selectArtistList(artist);
		ExcelUtil<Artist> util = new ExcelUtil<Artist>(Artist.class);
		return util.exportExcel(list, "artist");
	}

	/**
	 * Add artist
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * Add save artist
	 */
	@Log(title = "artist", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Artist artist) {
		artist.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(artistService.insertArtist(artist));
	}

	/**
	 * Modify artist
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, ModelMap mmap) {
		Artist artist = artistService.selectArtistById(id);
		mmap.put("artist", artist);
		return prefix + "/edit";
	}

	/**
	 * Modify and save artist
	 */
	@Log(title = "artist", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Artist artist) {
		return toAjax(artistService.updateArtist(artist));
	}

	/**
	 * Delete artist
	 */
	@Log(title = "artist", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(artistService.deleteArtistByIds(ids));
	}

	/**
	 * Search artist with keyword
	 */
	@PostMapping("/list/keyword")
	@ResponseBody
	public List<JSONObject> getArtistListWithKeyword(String keyword, String artistIds) {
		Artist artistParam = new Artist();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 10);
		params.put("notInIdsArray", Convert.toStrArray(artistIds));
		params.put("keyword", keyword);
		artistParam.setParams(params);
		List<Artist> artists = artistService.selectArtistList(artistParam);

		List<JSONObject> result = new ArrayList<>();
		if (CollectionUtils.isNotEmpty(artists)) {
			for (Artist artist : artists) {
				JSONObject json = new JSONObject();
				json.put("id", artist.getId());
				json.put("text", artist.getArtistName());
				result.add(json);
			}
		}
		return result;
	}
}
