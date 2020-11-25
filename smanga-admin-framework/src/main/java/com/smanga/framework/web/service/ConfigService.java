package com.smanga.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.system.service.ISysConfigService;

/**
 * Smanga pioneered html calling thymeleaf to realize parameter management
 * 
 * @author Trong Hieu
 */
@Service("config")
public class ConfigService {
	@Autowired
	private ISysConfigService configService;

	/**
	 * Query parameter configuration information based on key name
	 * 
	 * @param configKey Parameter key name
	 * @return Parameter key value
	 */
	public String getKey(String configKey) {
		return configService.selectConfigByKey(configKey);
	}
}
