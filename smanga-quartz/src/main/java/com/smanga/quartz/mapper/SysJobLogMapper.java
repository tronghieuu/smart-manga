package com.smanga.quartz.mapper;

import java.util.List;

import com.smanga.quartz.domain.SysJobLog;

/**
 * Scheduling task log information Data layer
 *
 * @author Trong Hieu
 */
public interface SysJobLogMapper
{
    /**
     * Obtain the scheduled task of the quartz scheduler log
     *
     * @param jobLog scheduling log information
     * @return scheduling task log collection
     */
    public List<SysJobLog> selectJobLogList(SysJobLog jobLog);

    /**
     * Query all scheduled task logs
     *
     * @return Schedule task log list
     */
    public List<SysJobLog> selectJobLogAll();

    /**
     * Query scheduling information by scheduling task log ID
     *
     * @param jobLogId scheduling task log ID
     * @return Schedule task log object information
     */
    public SysJobLog selectJobLogById(Long jobLogId);

    /**
     * Added task log
     *
     * @param jobLog scheduling log information
     * @return result
     */
    public int insertJobLog(SysJobLog jobLog);

    /**
     * Batch delete scheduling log information
     *
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteJobLogByIds(String[] ids);

    /**
     * Delete task log
     *
     * @param jobId scheduling log ID
     * @return result
     */
    public int deleteJobLogById(Long jobId);

    /**
     * Clear task log
     */
    public void cleanJobLog();
}
