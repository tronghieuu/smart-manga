package com.smanga.quartz.domain;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.annotation.Excel.ColumnType;
import com.smanga.common.constant.ScheduleConstants;
import com.smanga.common.core.domain.BaseEntity;
import com.smanga.common.utils.StringUtils;
import com.smanga.quartz.util.CronUtils;

/**
 * Scheduled task schedule sys_job
 * 
 * @author Trong Hieu
 */
public class SysJob extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/** Task ID */
	@Excel(name = "Task number", cellType = ColumnType.NUMERIC)
	private Long jobId;

	/** mission name */
	@Excel(name = "mission name")
	private String jobName;

	/** Task group name */
	@Excel(name = "Task group name")
	private String jobGroup;

	/** Call target string */
	@Excel(name = "Call target string")
	private String invokeTarget;

	/** cron execution expression */
	@Excel(name = "Execute expression ")
	private String cronExpression;

	/** cron planning strategy */
	@Excel(name = "Planning strategy ", readConverterExp = "0=default, 1=trigger execution immediately, 2=trigger once execution, 3=execute without trigger")
	private String misfirePolicy = ScheduleConstants.MISFIRE_DEFAULT;

	/** Whether to execute concurrently (0 allowed 1 prohibited) */
	@Excel(name = "Concurrent execution", readConverterExp = "0=allow, 1=forbid")
	private String concurrent;

	/** Task status (0 normal 1 suspended) */
	@Excel(name = "Task status", readConverterExp = "0=normal, 1=suspend")
	private String status;

	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	@NotBlank(message = "The task name cannot be empty")
	@Size(min = 0, max = 64, message = "The task name cannot exceed 64 characters")
	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	@NotBlank(message = "The call target string cannot be empty")
	@Size(min = 0, max = 1000, message = "The length of the calling target string cannot exceed 500 characters")
	public String getInvokeTarget() {
		return invokeTarget;
	}

	public void setInvokeTarget(String invokeTarget) {
		this.invokeTarget = invokeTarget;
	}

	@NotBlank(message = "Cron execution expression cannot be empty")
	@Size(min = 0, max = 255, message = "Cron execution expression cannot exceed 255 characters")
	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public Date getNextValidTime() {
		if (StringUtils.isNotEmpty(cronExpression)) {
			return CronUtils.getNextExecution(cronExpression);
		}
		return null;
	}

	public String getMisfirePolicy() {
		return misfirePolicy;
	}

	public void setMisfirePolicy(String misfirePolicy) {
		this.misfirePolicy = misfirePolicy;
	}

	public String getConcurrent() {
		return concurrent;
	}

	public void setConcurrent(String concurrent) {
		this.concurrent = concurrent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("jobId", getJobId())
				.append("jobName", getJobName()).append("jobGroup", getJobGroup())
				.append("cronExpression", getCronExpression()).append("nextValidTime", getNextValidTime())
				.append("misfirePolicy", getMisfirePolicy()).append("concurrent", getConcurrent())
				.append("status", getStatus()).append("createBy", getCreateBy()).append("createTime", getCreateTime())
				.append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).append("remark", getRemark())
				.toString();
	}
}