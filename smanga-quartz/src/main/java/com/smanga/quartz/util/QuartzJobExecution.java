package com.smanga.quartz.util;

import org.quartz.JobExecutionContext;

import com.smanga.quartz.domain.SysJob;

/**
 * Timing task processing (allowing concurrent execution)
 * 
 * @author Trong Hieu
 *
 */
public class QuartzJobExecution extends AbstractQuartzJob
{
    @Override
    protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception
    {
        JobInvokeUtil.invokeMethod(sysJob);
    }
}
