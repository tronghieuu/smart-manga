package com.smanga.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.common.annotation.Log;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.domain.Ztree;
import com.smanga.common.core.domain.entity.SysDictType;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.system.service.ISysDictTypeService;

/**
 * Data dictionary information
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/system/dict")
public class SysDictTypeController extends BaseController
{
    private String prefix = "system/dict/type";

    @Autowired
    private ISysDictTypeService dictTypeService;

    @RequiresPermissions("system:dict:view")
    @GetMapping()
    public String dictType()
    {
        return prefix + "/type";
    }

    @PostMapping("/list")
    @RequiresPermissions("system:dict:list")
    @ResponseBody
    public TableDataInfo list(SysDictType dictType)
    {
        startPage();
        List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
        return getDataTable(list);
    }

    @Log(title = "Dictionary type", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:dict:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysDictType dictType)
    {

        List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
        ExcelUtil<SysDictType> util = new ExcelUtil<SysDictType>(SysDictType.class);
        return util.exportExcel(list, "Dictionary Type");
    }

    /**
     * New dictionary type
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * Added save dictionary type
     */
    @Log(title = "Dictionary Type", businessType = BusinessType.INSERT)
    @RequiresPermissions("system:dict:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated SysDictType dict)
    {
        if (UserConstants.DICT_TYPE_NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict)))
        {
            return error("New dictionary '" + dict.getDictName() + "' failed, dictionary type already exists");
        }
        dict.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(dictTypeService.insertDictType(dict));
    }

    /**
     * Modify dictionary type
     */
    @GetMapping("/edit/{dictId}")
    public String edit(@PathVariable("dictId") Long dictId, ModelMap mmap)
    {
        mmap.put("dict", dictTypeService.selectDictTypeById(dictId));
        return prefix + "/edit";
    }

    /**
     * Modify the saved dictionary type
     */
    @Log(title = "Dictionary Type", businessType = BusinessType.UPDATE)
    @RequiresPermissions("system:dict:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated SysDictType dict)
    {
        if (UserConstants.DICT_TYPE_NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict)))
        {
            return error("Modify dictionary '" + dict.getDictName() + "' failed, dictionary type already exists");
        }
        dict.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(dictTypeService.updateDictType(dict));
    }

    @Log(title = "Dictionary type", businessType = BusinessType.DELETE)
    @RequiresPermissions("system:dict:remove")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(dictTypeService.deleteDictTypeByIds(ids));
    }

    /**
     * Empty the cache
     */
    @RequiresPermissions("system:dict:remove")
    @Log(title = "Dictionary Type", businessType = BusinessType.CLEAN)
    @GetMapping("/clearCache")
    @ResponseBody
    public AjaxResult clearCache()
    {
        dictTypeService.clearCache();
        return success();
    }

    /**
     * Query dictionary details
     */
    @RequiresPermissions("system:dict:list")
    @GetMapping("/detail/{dictId}")
    public String detail(@PathVariable("dictId") Long dictId, ModelMap mmap)
    {
        mmap.put("dict", dictTypeService.selectDictTypeById(dictId));
        mmap.put("dictList", dictTypeService.selectDictTypeAll());
        return "system/dict/data/data";
    }

    /**
     * Check dictionary type
     */
    @PostMapping("/checkDictTypeUnique")
    @ResponseBody
    public String checkDictTypeUnique(SysDictType dictType)
    {
        return dictTypeService.checkDictTypeUnique(dictType);
    }

    /**
     * Select the dictionary tree
     */
    @GetMapping("/selectDictTree/{columnId}/{dictType}")
    public String selectDeptTree(@PathVariable("columnId") Long columnId, @PathVariable("dictType") String dictType,
            ModelMap mmap)
    {
        mmap.put("columnId", columnId);
        mmap.put("dict", dictTypeService.selectDictTypeByType(dictType));
        return prefix + "/tree";
    }

    /**
     * Load the dictionary list tree
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = dictTypeService.selectDictTree(new SysDictType());
        return ztrees;
    }
}
