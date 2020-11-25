package com.smanga.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.core.text.Convert;
import com.smanga.system.domain.SysOperLog;
import com.smanga.system.mapper.SysOperLogMapper;
import com.smanga.system.service.ISysOperLogService;

/**
 * Operation log Service layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysOperLogServiceImpl implements ISysOperLogService {
	@Autowired
	private SysOperLogMapper operLogMapper;

	/**
	 * Added operation log
	 *
	 * @param operLog operation log object
	 */
	@Override
	public void insertOperlog(SysOperLog operLog) {
		operLogMapper.insertOperlog(operLog);
	}

	/**
	 * Query system operation log collection
	 *
	 * @param operLog operation log object
	 * @return Operation log collection
	 */
	@Override
	public List<SysOperLog> selectOperLogList(SysOperLog operLog) {
		return operLogMapper.selectOperLogList(operLog);
	}

	/**
	 * Batch delete system operation logs
	 *
	 * @param ids the data to be deleted
	 * @return
	 */
	@Override
	public int deleteOperLogByIds(String ids) {
		return operLogMapper.deleteOperLogByIds(Convert.toStrArray(ids));
	}

	/**
	 * Query operation log details
	 *
	 * @param operId operation ID
	 * @return Operation log object
	 */
	@Override
	public SysOperLog selectOperLogById(Long operId) {
		return operLogMapper.selectOperLogById(operId);
	}

	/**
	 * Clear operation log
	 */
	@Override
	public void cleanOperLog() {
		operLogMapper.cleanOperLog();
	}
}
