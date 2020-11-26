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
import com.smanga.business.domain.MangaChapter;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.common.core.page.TableDataInfo;

/**
 * Manga ChapterController
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Controller
@RequestMapping("/business/chapter")
public class BusinessMangaChapterController extends BaseController
{
    private String prefix = "business/chapter";

    @Autowired
    private IMangaChapterService mangaChapterService;

    @RequiresPermissions("business:chapter:view")
    @GetMapping()
    public String chapter()
    {
        return prefix + "/chapter";
    }

    /**
     * Query the list of Manga Chapter
     */
    @RequiresPermissions("business:chapter:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MangaChapter mangaChapter)
    {
        startPage();
        List<MangaChapter> list = mangaChapterService.selectMangaChapterList(mangaChapter);
        return getDataTable(list);
    }

    /**
     * Export Manga Chapter list
     */
    @RequiresPermissions("business:chapter:export")
    @Log(title = "Manga Chapter", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MangaChapter mangaChapter)
    {
        List<MangaChapter> list = mangaChapterService.selectMangaChapterList(mangaChapter);
        ExcelUtil<MangaChapter> util = new ExcelUtil<MangaChapter>(MangaChapter.class);
        return util.exportExcel(list, "chapter");
    }

    /**
     * Add Manga Chapter
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * Add save Manga Chapter
     */
    @RequiresPermissions("business:chapter:add")
    @Log(title = "Manga Chapter", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MangaChapter mangaChapter)
    {
        return toAjax(mangaChapterService.insertMangaChapter(mangaChapter));
    }

    /**
     * Modify Manga Chapter
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MangaChapter mangaChapter = mangaChapterService.selectMangaChapterById(id);
        mmap.put("mangaChapter", mangaChapter);
        return prefix + "/edit";
    }

    /**
     * Modify and save Manga Chapter
     */
    @RequiresPermissions("business:chapter:edit")
    @Log(title = "Manga Chapter", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MangaChapter mangaChapter)
    {
        return toAjax(mangaChapterService.updateMangaChapter(mangaChapter));
    }

    /**
     * Delete Manga Chapter
     */
    @RequiresPermissions("business:chapter:remove")
    @Log(title = "Manga Chapter", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mangaChapterService.deleteMangaChapterByIds(ids));
    }
}
