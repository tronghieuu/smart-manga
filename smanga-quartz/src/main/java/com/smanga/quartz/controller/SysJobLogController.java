package com.smanga.quartz.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.common.annotation.Log;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.quartz.domain.SysJob;
import com.smanga.quartz.domain.SysJobLog;
import com.smanga.quartz.service.ISysJobLogService;
import com.smanga.quartz.service.ISysJobService;

/**
 * Scheduling log operation processing
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/monitor/jobLog")
public class SysJobLogController extends BaseController {
	private String prefix = "monitor/job";

	@Autowired
	private ISysJobService jobService;

	@Autowired
	private ISysJobLogService jobLogService;

	@RequiresPermissions("monitor:job:view")
	@GetMapping()
	public String jobLog(@RequestParam(value = "jobId", required = false) Long jobId, ModelMap mmap) {
		if (StringUtils.isNotNull(jobId)) {
			SysJob job = jobService.selectJobById(jobId);
			mmap.put("job", job);
		}
		return prefix + "/jobLog";
	}

	@RequiresPermissions("monitor:job:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(SysJobLog jobLog) {
		startPage();
		List<SysJobLog> list = jobLogService.selectJobLogList(jobLog);
		return getDataTable(list);
	}

	@Log(title = "Scheduling log", businessType = BusinessType.EXPORT)
	@RequiresPermissions("monitor:job:export")
	@PostMapping("/export")
	@ResponseBody
	public AjaxResult export(SysJobLog jobLog) {
		List<SysJobLog> list = jobLogService.selectJobLogList(jobLog);
		ExcelUtil<SysJobLog> util = new ExcelUtil<SysJobLog>(SysJobLog.class);
		return util.exportExcel(list, "Scheduling log");
	}

	@Log(title = "Scheduling log", businessType = BusinessType.DELETE)
	@RequiresPermissions("monitor:job:remove")
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(jobLogService.deleteJobLogByIds(ids));
	}

	@RequiresPermissions("monitor:job:detail")
	@GetMapping("/detail/{jobLogId}")
	public String detail(@PathVariable("jobLogId") Long jobLogId, ModelMap mmap) {
		mmap.put("name", "jobLog");
		mmap.put("jobLog", jobLogService.selectJobLogById(jobLogId));
		return prefix + "/detail";
	}

	@Log(title = "Scheduling log", businessType = BusinessType.CLEAN)
	@RequiresPermissions("monitor:job:remove")
	@PostMapping("/clean")
	@ResponseBody
	public AjaxResult clean() {
		jobLogService.cleanJobLog();
		return success();
	}
}
