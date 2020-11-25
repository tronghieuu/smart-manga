package com.smanga.quartz.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.quartz.SchedulerException;
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
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.exception.job.TaskException;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.quartz.domain.SysJob;
import com.smanga.quartz.service.ISysJobService;
import com.smanga.quartz.util.CronUtils;

/**
 * Scheduling task information operation processing
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/monitor/job")
public class SysJobController extends BaseController
{
    private String prefix = "monitor/job";

    @Autowired
    private ISysJobService jobService;

    @RequiresPermissions("monitor:job:view")
    @GetMapping()
    public String job()
    {
        return prefix + "/job";
    }

    @RequiresPermissions("monitor:job:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysJob job)
    {
        startPage();
        List<SysJob> list = jobService.selectJobList(job);
        return getDataTable(list);
    }

    @Log(title = "Timed task", businessType = BusinessType.EXPORT)
    @RequiresPermissions("monitor:job:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysJob job)
    {
        List<SysJob> list = jobService.selectJobList(job);
        ExcelUtil<SysJob> util = new ExcelUtil<SysJob>(SysJob.class);
        return util.exportExcel(list, "Timed task");
    }

    @Log(title = "Timed task", businessType = BusinessType.DELETE)
    @RequiresPermissions("monitor:job:remove")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) throws SchedulerException
    {
        jobService.deleteJobByIds(ids);
        return success();
    }

    @RequiresPermissions("monitor:job:detail")
    @GetMapping("/detail/{jobId}")
    public String detail(@PathVariable("jobId") Long jobId, ModelMap mmap)
    {
        mmap.put("name", "job");
        mmap.put("job", jobService.selectJobById(jobId));
        return prefix + "/detail";
    }

    /**
     * Task scheduling status modification
     */
    @Log(title = "Timed task", businessType = BusinessType.UPDATE)
    @RequiresPermissions("monitor:job:changeStatus")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(SysJob job) throws SchedulerException
    {
        SysJob newJob = jobService.selectJobById(job.getJobId());
        newJob.setStatus(job.getStatus());
        return toAjax(jobService.changeStatus(newJob));
    }

    /**
     * Task scheduling is executed once immediately
     */
    @Log(title = "Timed task", businessType = BusinessType.UPDATE)
    @RequiresPermissions("monitor:job:changeStatus")
    @PostMapping("/run")
    @ResponseBody
    public AjaxResult run(SysJob job) throws SchedulerException
    {
        jobService.run(job);
        return success();
    }

    /**
     * New schedule
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * Add save schedule
     */
    @Log(title = "Timed task", businessType = BusinessType.INSERT)
    @RequiresPermissions("monitor:job:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@Validated SysJob job) throws SchedulerException, TaskException
    {
        if (!CronUtils.isValid(job.getCronExpression()))
        {
            return AjaxResult.error("cron expression is incorrect");
        }
        return toAjax(jobService.insertJob(job));
    }

    /**
     * Modify schedule
     */
    @GetMapping("/edit/{jobId}")
    public String edit(@PathVariable("jobId") Long jobId, ModelMap mmap)
    {
        mmap.put("job", jobService.selectJobById(jobId));
        return prefix + "/edit";
    }

    /**
     * Modify save schedule
     */
    @Log(title = "Timed task", businessType = BusinessType.UPDATE)
    @RequiresPermissions("monitor:job:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@Validated SysJob job) throws SchedulerException, TaskException
    {
        if (!CronUtils.isValid(job.getCronExpression()))
        {
            return AjaxResult.error("cron expression is incorrect");
        }
        return toAjax(jobService.updateJob(job));
    }

    /**
     * Verify that the cron expression is valid
     */
    @PostMapping("/checkCronExpressionIsValid")
    @ResponseBody
    public boolean checkCronExpressionIsValid(SysJob job)
    {
        return jobService.checkCronExpressionIsValid(job.getCronExpression());
    }
}
