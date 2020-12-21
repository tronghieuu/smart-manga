package com.smanga.business.service;

import java.util.List;
import com.smanga.business.domain.ViewCounter;

/**
 * List of ip prevent count view multiple timeService interface
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
public interface IViewCounterService 
{
    /**
     * Query List of ip prevent count view multiple time
     * 
     * @param id List of ip prevent count view multiple timeID
     * @return List of ip prevent count view multiple time
     */
    public ViewCounter selectViewCounterById(Long id);

    /**
     * Query the list of List of ip prevent count view multiple time
     * 
     * @param viewCounter List of ip prevent count view multiple time
     * @return List of ip prevent count view multiple time collection
     */
    public List<ViewCounter> selectViewCounterList(ViewCounter viewCounter);

    /**
     * Add List of ip prevent count view multiple time
     * 
     * @param viewCounter List of ip prevent count view multiple time
     * @return result
     */
    public int insertViewCounter(ViewCounter viewCounter);

    /**
     * Modify List of ip prevent count view multiple time
     * 
     * @param viewCounter List of ip prevent count view multiple time
     * @return result
     */
    public int updateViewCounter(ViewCounter viewCounter);

    /**
     * Batch delete List of ip prevent count view multiple time
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteViewCounterByIds(String ids);

    /**
     * Delete List of ip prevent count view multiple time information
     * 
     * @param id List of ip prevent count view multiple timeID
     * @return result
     */
    public int deleteViewCounterById(Long id);
}
