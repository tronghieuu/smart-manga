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
import com.smanga.business.domain.Manga;
import com.smanga.business.service.IMangaService;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.common.core.page.TableDataInfo;

/**
 * MangaController
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Controller
@RequestMapping("/business/manga")
public class BusinessMangaController extends BaseController
{
    private String prefix = "business/manga";

    @Autowired
    private IMangaService mangaService;

    @RequiresPermissions("business:manga:view")
    @GetMapping()
    public String manga()
    {
        return prefix + "/manga";
    }

    /**
     * Query the list of Manga
     */
    @RequiresPermissions("business:manga:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Manga manga)
    {
        startPage();
        List<Manga> list = mangaService.selectMangaList(manga);
        return getDataTable(list);
    }

    /**
     * Export Manga list
     */
    @RequiresPermissions("business:manga:export")
    @Log(title = "Manga", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Manga manga)
    {
        List<Manga> list = mangaService.selectMangaList(manga);
        ExcelUtil<Manga> util = new ExcelUtil<Manga>(Manga.class);
        return util.exportExcel(list, "manga");
    }

    /**
     * Add Manga
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * Add save Manga
     */
    @RequiresPermissions("business:manga:add")
    @Log(title = "Manga", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Manga manga)
    {
        return toAjax(mangaService.insertManga(manga));
    }

    /**
     * Modify Manga
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Manga manga = mangaService.selectMangaById(id);
        mmap.put("manga", manga);
        return prefix + "/edit";
    }

    /**
     * Modify and save Manga
     */
    @RequiresPermissions("business:manga:edit")
    @Log(title = "Manga", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Manga manga)
    {
        return toAjax(mangaService.updateManga(manga));
    }

    /**
     * Delete Manga
     */
    @RequiresPermissions("business:manga:remove")
    @Log(title = "Manga", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mangaService.deleteMangaByIds(ids));
    }
}