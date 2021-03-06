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
import com.smanga.business.domain.Author;
import com.smanga.business.service.IAuthorService;
import com.smanga.common.annotation.Log;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.core.text.Convert;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.framework.shiro.util.ShiroUtils;

/**
 * AuthorController
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Controller
@RequestMapping("/business/author")
public class BusinessAuthorController extends BaseController {
	private String prefix = "business/author";

	@Autowired
	private IAuthorService authorService;

	@GetMapping()
	public String author() {
		return prefix + "/author";
	}

	/**
	 * Query the list of Author
	 */
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Author author) {
		startPage();
		List<Author> list = authorService.selectAuthorList(author);
		return getDataTable(list);
	}

	/**
	 * Export Author list
	 */
	@Log(title = "Author", businessType = BusinessType.EXPORT)
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(Author author) {
		List<Author> list = authorService.selectAuthorList(author);
		ExcelUtil<Author> util = new ExcelUtil<Author>(Author.class);
		return util.exportExcel(list, "author");
	}

	/**
	 * Add Author
	 */
	@GetMapping("/add")
	public String add() {
		return prefix + "/add";
	}

	/**
	 * Add save Author
	 */
	@Log(title = "Author", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Author author) {
		author.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(authorService.insertAuthor(author));
	}

	/**
	 * Modify Author
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, ModelMap mmap) {
		Author author = authorService.selectAuthorById(id);
		mmap.put("author", author);
		return prefix + "/edit";
	}

	/**
	 * Modify and save Author
	 */
	@Log(title = "Author", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Author author) {
		return toAjax(authorService.updateAuthor(author));
	}

	/**
	 * Delete Author
	 */
	@Log(title = "Author", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(authorService.deleteAuthorByIds(ids));
	}

	/**
	 * Search author with keyword
	 */
	@PostMapping("/list/keyword")
	@ResponseBody
	public List<JSONObject> getAuthorListWithKeyword(String keyword, String authorIds) {
		Author authorParam = new Author();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 10);
		params.put("notInIdsArray", Convert.toStrArray(authorIds));
		params.put("keyword", keyword);
		authorParam.setParams(params);
		List<Author> authors = authorService.selectAuthorList(authorParam);

		List<JSONObject> result = new ArrayList<>();
		if (CollectionUtils.isNotEmpty(authors)) {
			for (Author author : authors) {
				JSONObject json = new JSONObject();
				json.put("id", author.getId());
				json.put("text", author.getAuthorName());
				result.add(json);
			}
		}
		return result;
	}
}
