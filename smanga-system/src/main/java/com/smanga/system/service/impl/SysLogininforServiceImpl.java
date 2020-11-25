package com.smanga.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.core.text.Convert;
import com.smanga.system.domain.SysLogininfor;
import com.smanga.system.mapper.SysLogininforMapper;
import com.smanga.system.service.ISysLogininforService;

/**
 * System access log situation information Service layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysLogininforServiceImpl implements ISysLogininforService {

	@Autowired
	private SysLogininforMapper logininforMapper;

	/**
	 * Added system login log
	 *
	 * @param logininfor access log object
	 */
	@Override
	public void insertLogininfor(SysLogininfor logininfor) {
		logininforMapper.insertLogininfor(logininfor);
	}

	/**
	 * Query system login log collection
	 *
	 * @param logininfor access log object
	 * @return login record collection
	 */
	@Override
	public List<SysLogininfor> selectLogininforList(SysLogininfor logininfor) {
		return logininforMapper.selectLogininforList(logininfor);
	}

	/**
	 * Batch delete system login logs
	 *
	 * @param ids the data to be deleted
	 * @return
	 */
	@Override
	public int deleteLogininforByIds(String ids) {
		return logininforMapper.deleteLogininforByIds(Convert.toStrArray(ids));
	}

	/**
	 * Clear system login log
	 */
	@Override
	public void cleanLogininfor() {
		logininforMapper.cleanLogininfor();
	}
}
