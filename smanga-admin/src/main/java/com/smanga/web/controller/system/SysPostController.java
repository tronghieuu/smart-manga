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
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.system.domain.SysPost;
import com.smanga.system.service.ISysPostService;

/**
 * Post information processing
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/system/post")
public class SysPostController extends BaseController
{
    private String prefix = "system/post";

    @Autowired
    private ISysPostService postService;

    @RequiresPermissions("system:post:view")
    @GetMapping()
    public String operlog()
    {
        return prefix + "/post";
    }

    @RequiresPermissions("system:post:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysPost post)
    {
        startPage();
        List<SysPost> list = postService.selectPostList(post);
        return getDataTable(list);
    }

    @Log(title = "Job Management", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:post:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysPost post)
    {
        List<SysPost> list = postService.selectPostList(post);
        ExcelUtil<SysPost> util = new ExcelUtil<SysPost>(SysPost.class);
        return util.exportExcel(list, "Post data");
    }

    @RequiresPermissions("system:post:remove")
    @Log(title = "Job Management", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        try
        {
            return toAjax(postService.deletePostByIds(ids));
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    /**
     * New posts
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * Add saving post
     */
    @RequiresPermissions("system:post:add")
    @Log(title = "Job Management", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated SysPost post)
    {
        if (UserConstants.POST_NAME_NOT_UNIQUE.equals(postService.checkPostNameUnique(post)))
        {
            return error("New post '" + post.getPostName() + "' failed, the post name already exists");
        }
        else if (UserConstants.POST_CODE_NOT_UNIQUE.equals(postService.checkPostCodeUnique(post)))
        {
            return error("New post '" + post.getPostName() + "' failed, post code already exists");
        }
        post.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(postService.insertPost(post));
    }

    /**
     * Modify position
     */
    @GetMapping("/edit/{postId}")
    public String edit(@PathVariable("postId") Long postId, ModelMap mmap)
    {
        mmap.put("post", postService.selectPostById(postId));
        return prefix + "/edit";
    }

    /**
     * Modify save post
     */
    @RequiresPermissions("system:post:edit")
    @Log(title = "Job Management", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated SysPost post)
    {
        if (UserConstants.POST_NAME_NOT_UNIQUE.equals(postService.checkPostNameUnique(post)))
        {
            return error("Modify post '" + post.getPostName() + "' ailed, post name already exists");
        }
        else if (UserConstants.POST_CODE_NOT_UNIQUE.equals(postService.checkPostCodeUnique(post)))
        {
            return error("Modify post '" + post.getPostName() + "' failed, post code already exists");
        }
        post.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(postService.updatePost(post));
    }

    /**
     * Check post name
     */
    @PostMapping("/checkPostNameUnique")
    @ResponseBody
    public String checkPostNameUnique(SysPost post)
    {
        return postService.checkPostNameUnique(post);
    }

    /**
     * Check post code
     */
    @PostMapping("/checkPostCodeUnique")
    @ResponseBody
    public String checkPostCodeUnique(SysPost post)
    {
        return postService.checkPostCodeUnique(post);
    }
}
