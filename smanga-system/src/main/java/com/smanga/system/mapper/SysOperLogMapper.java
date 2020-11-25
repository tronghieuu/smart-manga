package com.smanga.system.mapper;

import java.util.List;

import com.smanga.system.domain.SysOperLog;

/**
 * Operation log Data layer
 *
 * @author Trong Hieu
 */
public interface SysOperLogMapper
{
    /**
     * Added operation log
     *
     * @param operLog operation log object
     */
    public void insertOperlog(SysOperLog operLog);

    /**
     * Query system operation log collection
     *
     * @param operLog operation log object
     * @return Operation log collection
     */
    public List<SysOperLog> selectOperLogList(SysOperLog operLog);
    
    /**
     * Batch delete system operation logs
     *
     * @param ids the data to be deleted
     * @return result
     */
    public int deleteOperLogByIds(String[] ids);
    
    /**
     * Query operation log details
     *
     * @param operId operation ID
     * @return Operation log object
     */
    public SysOperLog selectOperLogById(Long operId);
    
    /**
     * Clear operation log
     */
    public void cleanOperLog();
}
