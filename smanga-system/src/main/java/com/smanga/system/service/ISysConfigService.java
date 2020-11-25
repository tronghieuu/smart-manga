package com.smanga.system.service;

import java.util.List;

import com.smanga.system.domain.SysConfig;

/**
 * Parameter configuration service layer
 *
 * @author Trong Hieu
 */
public interface ISysConfigService
{
    /**
     * Query parameter configuration information
     *
     * @param configId parameter configuration ID
     * @return parameter configuration information
     */
    public SysConfig selectConfigById(Long configId);

    /**
     * Query parameter configuration information according to the key name
     *
     * @param configKey parameter key name
     * @return parameter key value
     */
    public String selectConfigByKey(String configKey);

    /**
     * Query parameter configuration list
     *
     * @param config parameter configuration information
     * @return parameter configuration collection
     */
    public List<SysConfig> selectConfigList(SysConfig config);

    /**
     * New parameter configuration
     *
     * @param config parameter configuration information
     * @return result
     */
    public int insertConfig(SysConfig config);

    /**
     * Modify parameter configuration
     *
     * @param config parameter configuration information
     * @return result
     */
    public int updateConfig(SysConfig config);

    /**
     * Batch delete parameter configuration information
     *
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteConfigByIds(String ids);

    /**
     * Clear cache data
     */
    public void clearCache();

    /**
     * Verify that the parameter key name is unique
     *
     * @param config parameter information
     * @return result
     */
    public String checkConfigKeyUnique(SysConfig config);
}
