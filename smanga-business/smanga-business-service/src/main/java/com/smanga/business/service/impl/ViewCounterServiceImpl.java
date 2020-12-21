package com.smanga.business.service.impl;

import java.util.List;
import com.smanga.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smanga.business.mapper.ViewCounterMapper;
import com.smanga.business.domain.ViewCounter;
import com.smanga.business.service.IViewCounterService;
import com.smanga.common.core.text.Convert;

/**
 * List of ip prevent count view multiple timeService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
@Service
public class ViewCounterServiceImpl implements IViewCounterService 
{
    @Autowired
    private ViewCounterMapper viewCounterMapper;

    /**
     * Query List of ip prevent count view multiple time
     * 
     * @param id List of ip prevent count view multiple timeID
     * @return List of ip prevent count view multiple time
     */
    @Override
    public ViewCounter selectViewCounterById(Long id)
    {
        return viewCounterMapper.selectViewCounterById(id);
    }

    /**
     * Query the list of List of ip prevent count view multiple time
     * 
     * @param viewCounter List of ip prevent count view multiple time
     * @return List of ip prevent count view multiple time
     */
    @Override
    public List<ViewCounter> selectViewCounterList(ViewCounter viewCounter)
    {
        return viewCounterMapper.selectViewCounterList(viewCounter);
    }

    /**
     * Add List of ip prevent count view multiple time
     * 
     * @param viewCounter List of ip prevent count view multiple time
     * @return result
     */
    @Override
    public int insertViewCounter(ViewCounter viewCounter)
    {
        viewCounter.setCreateTime(DateUtils.getNowDate());
        return viewCounterMapper.insertViewCounter(viewCounter);
    }

    /**
     * Modify List of ip prevent count view multiple time
     * 
     * @param viewCounter List of ip prevent count view multiple time
     * @return result
     */
    @Override
    public int updateViewCounter(ViewCounter viewCounter)
    {
        return viewCounterMapper.updateViewCounter(viewCounter);
    }

    /**
     * Delete List of ip prevent count view multiple time object
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    @Override
    public int deleteViewCounterByIds(String ids)
    {
        return viewCounterMapper.deleteViewCounterByIds(Convert.toStrArray(ids));
    }

    /**
     * Delete List of ip prevent count view multiple time information
     * 
     * @param id List of ip prevent count view multiple timeID
     * @return result
     */
    @Override
    public int deleteViewCounterById(Long id)
    {
        return viewCounterMapper.deleteViewCounterById(id);
    }
}
