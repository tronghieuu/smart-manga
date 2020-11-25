package com.smanga.quartz.util;

import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smanga.common.constant.Constants;
import com.smanga.common.constant.ScheduleConstants;
import com.smanga.common.utils.ExceptionUtil;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.bean.BeanUtils;
import com.smanga.common.utils.spring.SpringUtils;
import com.smanga.quartz.domain.SysJob;
import com.smanga.quartz.domain.SysJobLog;
import com.smanga.quartz.service.ISysJobLogService;

/**
 * Execute no parameter method
 *
 * @author Trong Hieu
 */
public abstract class AbstractQuartzJob implements Job {
	private static final Logger log = LoggerFactory.getLogger(AbstractQuartzJob.class);

	/**
	 * Thread local variables
	 */
	private static ThreadLocal<Date> threadLocal = new ThreadLocal<>();

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		SysJob sysJob = new SysJob();
		BeanUtils.copyBeanProp(sysJob, context.getMergedJobDataMap().get(ScheduleConstants.TASK_PROPERTIES));
		try {
			before(context, sysJob);
			if (sysJob != null) {
				doExecute(context, sysJob);
			}
			after(context, sysJob, null);
		} catch (Exception e) {
			log.error("Task execution abnormal  - ：", e);
			after(context, sysJob, e);
		}
	}

	/**
	 * Before execution
	 *
	 * @param context Work execution context object
	 * @param sysJob  System scheduled task
	 */
	protected void before(JobExecutionContext context, SysJob sysJob) {
		threadLocal.set(new Date());
	}

	/**
	 * After execution
	 *
	 * @param context        Work execution context object
	 * @param sysScheduleJob System scheduled task
	 */
	protected void after(JobExecutionContext context, SysJob sysJob, Exception e) {
		Date startTime = threadLocal.get();
		threadLocal.remove();

		final SysJobLog sysJobLog = new SysJobLog();
		sysJobLog.setJobName(sysJob.getJobName());
		sysJobLog.setJobGroup(sysJob.getJobGroup());
		sysJobLog.setInvokeTarget(sysJob.getInvokeTarget());
		sysJobLog.setStartTime(startTime);
		sysJobLog.setEndTime(new Date());
		long runMs = sysJobLog.getEndTime().getTime() - sysJobLog.getStartTime().getTime();
		sysJobLog.setJobMessage(sysJobLog.getJobName() + " Total time: " + runMs + " millisecond");
		if (e != null) {
			sysJobLog.setStatus(Constants.FAIL);
			String errorMsg = StringUtils.substring(ExceptionUtil.getExceptionMessage(e), 0, 2000);
			sysJobLog.setExceptionInfo(errorMsg);
		} else {
			sysJobLog.setStatus(Constants.SUCCESS);
		}

		// Write to the database
		SpringUtils.getBean(ISysJobLogService.class).addJobLog(sysJobLog);
	}

	/**
	 * Execution method, overloaded by subclasses
	 *
	 * @param context Work execution context object
	 * @param sysJob  System scheduled task
	 * @throws Exception Exception during execution
	 */
	protected abstract void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception;
}
