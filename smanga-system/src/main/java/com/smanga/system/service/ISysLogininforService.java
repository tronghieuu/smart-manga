package com.smanga.system.service;

import java.util.List;

import com.smanga.system.domain.SysLogininfor;

/**
 * System access log information service layer
 *
 * @author Trong Hieu
 */
public interface ISysLogininforService
{
    /**
     * Added system login log
     *
     * @param logininfor access log object
     */
    public void insertLogininfor(SysLogininfor logininfor);

    /**
     * Query system login log collection
     *
     * @param logininfor access log object
     * @return login record collection
     */
    public List<SysLogininfor> selectLogininforList(SysLogininfor logininfor);

    /**
     * Batch delete system login logs
     *
     * @param ids the data to be deleted
     * @return
     */
    public int deleteLogininforByIds(String ids);

    /**
     * Clear system login log
     */
    public void cleanLogininfor();
}
