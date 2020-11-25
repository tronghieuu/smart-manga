package com.smanga.system.mapper;

import java.util.List;

import com.smanga.system.domain.SysConfig;

/**
 * Parameter configuration data layer
 * 
 * @author Trong Hieu
 */
public interface SysConfigMapper
{
    /**
     * Query parameter configuration information
     *
     * @param config parameter configuration information
     * @return parameter configuration information
     */
    public SysConfig selectConfig(SysConfig config);

    /**
     * Query parameter configuration list
     *
     * @param config parameter configuration information
     * @return parameter configuration collection
     */
    public List<SysConfig> selectConfigList(SysConfig config);

    /**
     * Query parameter configuration information according to the key name
     *
     * @param configKey parameter key name
     * @return parameter configuration information
     */
    public SysConfig checkConfigKeyUnique(String configKey);

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
     * Batch delete parameter configuration
     *
     * @param configIds ID of the data to be deleted
     * @return result
     */
    public int deleteConfigByIds(String[] configIds);
}