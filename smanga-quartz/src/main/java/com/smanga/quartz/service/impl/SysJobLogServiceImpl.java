package com.smanga.quartz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.core.text.Convert;
import com.smanga.quartz.domain.SysJobLog;
import com.smanga.quartz.mapper.SysJobLogMapper;
import com.smanga.quartz.service.ISysJobLogService;

/**
 * Scheduled task scheduling log information Service layer
 * 
 * @author Trong Hieu
 */
@Service
public class SysJobLogServiceImpl implements ISysJobLogService {
	@Autowired
	private SysJobLogMapper jobLogMapper;

	/**
	 * Obtain the scheduled task of the quartz scheduler log
	 * 
	 * @param jobLog Scheduling log information
	 * @return Schedule task log collection
	 */
	@Override
	public List<SysJobLog> selectJobLogList(SysJobLog jobLog) {
		return jobLogMapper.selectJobLogList(jobLog);
	}

	/**
	 * Query scheduling information by scheduling task log ID
	 * 
	 * @param jobLogId Scheduled task log ID
	 * @return Schedule task log object information
	 */
	@Override
	public SysJobLog selectJobLogById(Long jobLogId) {
		return jobLogMapper.selectJobLogById(jobLogId);
	}

	/**
	 * New task log
	 * 
	 * @param jobLog Scheduling log information
	 */
	@Override
	public void addJobLog(SysJobLog jobLog) {
		jobLogMapper.insertJobLog(jobLog);
	}

	/**
	 * Batch delete scheduling log information
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteJobLogByIds(String ids) {
		return jobLogMapper.deleteJobLogByIds(Convert.toStrArray(ids));
	}

	/**
	 * Delete task log
	 * 
	 * @param jobId Delete task log
	 */
	@Override
	public int deleteJobLogById(Long jobId) {
		return jobLogMapper.deleteJobLogById(jobId);
	}

	/**
	 * Clear task log
	 */
	@Override
	public void cleanJobLog() {
		jobLogMapper.cleanJobLog();
	}
}
