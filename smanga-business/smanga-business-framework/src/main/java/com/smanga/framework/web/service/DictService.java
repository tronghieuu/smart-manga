package com.smanga.framework.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.core.domain.entity.SysDictData;
import com.smanga.system.service.ISysDictDataService;
import com.smanga.system.service.ISysDictTypeService;

/**
 * Smanga pioneered html calling thymeleaf to implement dictionary reading
 * 
 * @author Trong Hieu
 */
@Service("dict")
public class DictService {
	@Autowired
	private ISysDictTypeService dictTypeService;

	@Autowired
	private ISysDictDataService dictDataService;

	/**
	 * Query dictionary data information according to dictionary type
	 * 
	 * @param dictType Dictionary type
	 * @return Parameter key value
	 */
	public List<SysDictData> getType(String dictType) {
		return dictTypeService.selectDictDataByType(dictType);
	}

	/**
	 * Query dictionary data information according to dictionary type and dictionary key value
	 * 
	 * @param dictType  Dictionary type
	 * @param dictValue Dictionary key
	 * @return Dictionary tag
	 */
	public String getLabel(String dictType, String dictValue) {
		return dictDataService.selectDictLabel(dictType, dictValue);
	}
}
