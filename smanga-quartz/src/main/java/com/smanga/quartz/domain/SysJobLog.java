package com.smanga.quartz.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Scheduled task scheduling log table sys_job_log
 * 
 * @author Trong Hieu
 */
public class SysJobLog extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** ID */
	@Excel(name = "Log sequence number")
	private Long jobLogId;

	/** mission name */
	@Excel(name = "mission name")
	private String jobName;

	/** Task group name */
	@Excel(name = "Task group name")
	private String jobGroup;

	/** Call target string */
	@Excel(name = "Call target string")
	private String invokeTarget;

	/** Log information */
	@Excel(name = "Log information")
	private String jobMessage;

	/** Execution status (0 normal and 1 failed) */
	@Excel(name = "Execution status", readConverterExp = "0=normal, 1=failed")
	private String status;

	/** Exception information */
	@Excel(name = "Exception information")
	private String exceptionInfo;

	/** Starting time */
	private Date startTime;

	/** End Time */
	private Date endTime;

	public Long getJobLogId() {
		return jobLogId;
	}

	public void setJobLogId(Long jobLogId) {
		this.jobLogId = jobLogId;
	}

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

	public String getInvokeTarget() {
		return invokeTarget;
	}

	public void setInvokeTarget(String invokeTarget) {
		this.invokeTarget = invokeTarget;
	}

	public String getJobMessage() {
		return jobMessage;
	}

	public void setJobMessage(String jobMessage) {
		this.jobMessage = jobMessage;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getExceptionInfo() {
		return exceptionInfo;
	}

	public void setExceptionInfo(String exceptionInfo) {
		this.exceptionInfo = exceptionInfo;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("jobLogId", getJobLogId())
				.append("jobName", getJobName()).append("jobGroup", getJobGroup()).append("jobMessage", getJobMessage())
				.append("status", getStatus()).append("exceptionInfo", getExceptionInfo())
				.append("startTime", getStartTime()).append("endTime", getEndTime()).toString();
	}
}
