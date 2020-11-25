package com.smanga.system.mapper;

import java.util.List;

import com.smanga.system.domain.SysLogininfor;

/**
 * System access log situation information Data layer
 *
 * @author Trong Hieu
 */
public interface SysLogininforMapper
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
     * @return result
     */
    public int deleteLogininforByIds(String[] ids);

    /**
     * Clear system login log
     *
     * @return result
     */
    public int cleanLogininfor();
}
