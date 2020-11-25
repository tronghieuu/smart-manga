package com.smanga.framework.web.service;

import java.util.Set;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.stereotype.Service;

import com.smanga.common.constant.Constants;
import com.smanga.common.utils.CacheUtils;

/**
 * Cache operation processing
 * 
 * @author Trong Hieu
 */
@Service
public class CacheService {
	/**
	 * Get all cache names
	 * 
	 * @return Cache list
	 */
	public String[] getCacheNames() {
		String[] cacheNames = CacheUtils.getCacheNames();
		return ArrayUtils.removeElement(cacheNames, Constants.SYS_AUTH_CACHE);
	}

	/**
	 * Get all key names based on cache name
	 * 
	 * @param cacheName Cache name
	 * @return Key name list
	 */
	public Set<String> getCacheKeys(String cacheName) {
		return CacheUtils.getCache(cacheName).keys();
	}

	/**
	 * Get content value based on cache name and key name
	 * 
	 * @param cacheName Cache name
	 * @param cacheKey  Key name
	 * @return Key value
	 */
	public Object getCacheValue(String cacheName, String cacheKey) {
		return CacheUtils.get(cacheName, cacheKey);
	}

	/**
	 * Delete cache information by name
	 * 
	 * @param cacheName Cache name
	 */
	public void clearCacheName(String cacheName) {
		CacheUtils.removeAll(cacheName);
	}

	/**
	 * Delete cache information based on name and key name
	 * 
	 * @param cacheName Cache name
	 * @param cacheKey  Key name
	 */
	public void clearCacheKey(String cacheName, String cacheKey) {
		CacheUtils.remove(cacheName, cacheKey);
	}

	/**
	 * Clear all cache
	 */
	public void clearAll() {
		String[] cacheNames = getCacheNames();
		for (String cacheName : cacheNames) {
			CacheUtils.removeAll(cacheName);
		}
	}
}
