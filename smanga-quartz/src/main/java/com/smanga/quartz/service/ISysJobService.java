package com.smanga.quartz.service;

import java.util.List;

import org.quartz.SchedulerException;

import com.smanga.common.exception.job.TaskException;
import com.smanga.quartz.domain.SysJob;

/**
 * Scheduled task scheduling information information service layer
 * 
 * @author Trong Hieu
 */
public interface ISysJobService {
	/**
	 * Get the scheduled tasks of the quartz scheduler
	 * 
	 * @param job Scheduling information
	 * @return Schedule task collection
	 */
	public List<SysJob> selectJobList(SysJob job);

	/**
	 * Query scheduling information by scheduling task ID
	 * 
	 * @param jobId Scheduling task ID
	 * @return Schedule task object information
	 */
	public SysJob selectJobById(Long jobId);

	/**
	 * Pause task
	 * 
	 * @param job Scheduling information
	 * @return result
	 */
	public int pauseJob(SysJob job) throws SchedulerException;

	/**
	 * Recovery task
	 * 
	 * @param job Scheduling information
	 * @return result
	 */
	public int resumeJob(SysJob job) throws SchedulerException;

	/**
	 * After deleting the task, the corresponding trigger will also be deleted
	 * 
	 * @param job Scheduling information
	 * @return result
	 */
	public int deleteJob(SysJob job) throws SchedulerException;

	/**
	 * Batch delete scheduling information
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	public void deleteJobByIds(String ids) throws SchedulerException;

	/**
	 * Task scheduling status modification
	 * 
	 * @param job Scheduling information
	 * @return result
	 */
	public int changeStatus(SysJob job) throws SchedulerException;

	/**
	 * Run task immediately
	 * 
	 * @param job Scheduling information
	 * @return result
	 */
	public void run(SysJob job) throws SchedulerException;

	/**
	 * New task
	 * 
	 * @param job Scheduling information
	 * @return result
	 */
	public int insertJob(SysJob job) throws SchedulerException, TaskException;

	/**
	 * Update task
	 * 
	 * @param job Scheduling information
	 * @return result
	 */
	public int updateJob(SysJob job) throws SchedulerException, TaskException;

	/**
	 * Verify that the cron expression is valid
	 * 
	 * @param cronExpression expression
	 * @return result
	 */
	public boolean checkCronExpressionIsValid(String cronExpression);
}