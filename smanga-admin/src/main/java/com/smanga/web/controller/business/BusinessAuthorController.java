package com.smanga.web.controller.business;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.smanga.common.annotation.Log;
import com.smanga.common.enums.BusinessType;
import com.smanga.business.domain.Author;
import com.smanga.business.service.IAuthorService;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.common.core.page.TableDataInfo;

/**
 * AuthorController
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Controller
@RequestMapping("/business/author")
public class BusinessAuthorController extends BaseController
{
    private String prefix = "business/author";

    @Autowired
    private IAuthorService authorService;

    @RequiresPermissions("business:author:view")
    @GetMapping()
    public String author()
    {
        return prefix + "/author";
    }

    /**
     * Query the list of Author
     */
    @RequiresPermissions("business:author:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Author author)
    {
        startPage();
        List<Author> list = authorService.selectAuthorList(author);
        return getDataTable(list);
    }

    /**
     * Export Author list
     */
    @RequiresPermissions("business:author:export")
    @Log(title = "Author", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Author author)
    {
        List<Author> list = authorService.selectAuthorList(author);
        ExcelUtil<Author> util = new ExcelUtil<Author>(Author.class);
        return util.exportExcel(list, "author");
    }

    /**
     * Add Author
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * Add save Author
     */
    @RequiresPermissions("business:author:add")
    @Log(title = "Author", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Author author)
    {
        return toAjax(authorService.insertAuthor(author));
    }

    /**
     * Modify Author
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Author author = authorService.selectAuthorById(id);
        mmap.put("author", author);
        return prefix + "/edit";
    }

    /**
     * Modify and save Author
     */
    @RequiresPermissions("business:author:edit")
    @Log(title = "Author", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Author author)
    {
        return toAjax(authorService.updateAuthor(author));
    }

    /**
     * Delete Author
     */
    @RequiresPermissions("business:author:remove")
    @Log(title = "Author", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(authorService.deleteAuthorByIds(ids));
    }
}
