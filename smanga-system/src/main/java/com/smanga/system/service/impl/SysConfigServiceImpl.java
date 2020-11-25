package com.smanga.system.service.impl;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.constant.Constants;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.CacheUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.system.domain.SysConfig;
import com.smanga.system.mapper.SysConfigMapper;
import com.smanga.system.service.ISysConfigService;

/**
 * Parameter configuration service layer implementation
 *
 * @author Trong Hieu
 */
@Service
public class SysConfigServiceImpl implements ISysConfigService {
	@Autowired
	private SysConfigMapper configMapper;

	/**
	 * When the project starts, initialize the parameters to the cache
	 */
	@PostConstruct
	public void init() {
		List<SysConfig> configsList = configMapper.selectConfigList(new SysConfig());
		for (SysConfig config : configsList) {
			CacheUtils.put(getCacheName(), getCacheKey(config.getConfigKey()), config.getConfigValue());
		}
	}

	/**
	 * Query parameter configuration information
	 *
	 * @param configId parameter configuration ID
	 * @return parameter configuration information
	 */
	@Override
	public SysConfig selectConfigById(Long configId) {
		SysConfig config = new SysConfig();
		config.setConfigId(configId);
		return configMapper.selectConfig(config);
	}

	/**
	 * Query parameter configuration information according to the key name
	 *
	 * @param configKey parameter key
	 * @return parameter key value
	 */
	@Override
	public String selectConfigByKey(String configKey) {
		String configValue = Convert.toStr(CacheUtils.get(getCacheName(), getCacheKey(configKey)));
		if (StringUtils.isNotEmpty(configValue)) {
			return configValue;
		}
		SysConfig config = new SysConfig();
		config.setConfigKey(configKey);
		SysConfig retConfig = configMapper.selectConfig(config);
		if (StringUtils.isNotNull(retConfig)) {
			CacheUtils.put(getCacheName(), getCacheKey(configKey), retConfig.getConfigValue());
			return retConfig.getConfigValue();
		}
		return StringUtils.EMPTY;
	}

	/**
	 * Query parameter configuration list
	 *
	 * @param config parameter configuration information
	 * @return parameter configuration collection
	 */
	@Override
	public List<SysConfig> selectConfigList(SysConfig config) {
		return configMapper.selectConfigList(config);
	}

	/**
	 * New parameter configuration
	 *
	 * @param config parameter configuration information
	 * @return result
	 */
	@Override
	public int insertConfig(SysConfig config) {
		int row = configMapper.insertConfig(config);
		if (row > 0) {
			CacheUtils.put(getCacheName(), getCacheKey(config.getConfigKey()), config.getConfigValue());
		}
		return row;
	}

	/**
	 * Modify parameter configuration
	 *
	 * @param config parameter configuration information
	 * @return result
	 */
	@Override
	public int updateConfig(SysConfig config) {
		int row = configMapper.updateConfig(config);
		if (row > 0) {
			CacheUtils.put(getCacheName(), getCacheKey(config.getConfigKey()), config.getConfigValue());
		}
		return row;
	}

	/**
	 * Batch delete parameter configuration objects
	 *
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteConfigByIds(String ids) {
		Long[] configIds = Convert.toLongArray(ids);
		for (Long configId : configIds) {
			SysConfig config = selectConfigById(configId);
			if (StringUtils.equals(UserConstants.YES, config.getConfigType())) {
				throw new BusinessException(
						String.format("Built-in parameter [%1$s] cannot be deleted", config.getConfigKey()));
			}
		}
		int count = configMapper.deleteConfigByIds(Convert.toStrArray(ids));
		if (count > 0) {

			CacheUtils.removeAll(getCacheName());
		}
		return count;
	}

	/**
	 * Clear cache data
	 */
	@Override
	public void clearCache() {
		CacheUtils.removeAll(getCacheName());
	}

	/**
	 * Verify that the parameter key name is unique
	 *
	 * @param config parameter configuration information
	 * @return result
	 */
	@Override
	public String checkConfigKeyUnique(SysConfig config) {
		Long configId = StringUtils.isNull(config.getConfigId()) ? -1L : config.getConfigId();
		SysConfig info = configMapper.checkConfigKeyUnique(config.getConfigKey());
		if (StringUtils.isNotNull(info) && info.getConfigId().longValue() != configId.longValue()) {
			return UserConstants.CONFIG_KEY_NOT_UNIQUE;
		}
		return UserConstants.CONFIG_KEY_UNIQUE;
	}

	/**
	 * Get the cache name
	 *
	 * @return cache name
	 */
	private String getCacheName() {
		return Constants.SYS_CONFIG_CACHE;
	}

	/**
	 * Set the cache key
	 *
	 * @param configKey parameter key
	 * @return cache key key
	 */
	private String getCacheKey(String configKey) {
		return Constants.SYS_CONFIG_KEY + configKey;
	}
}
