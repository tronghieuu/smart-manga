package com.smanga.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.core.domain.entity.SysDictData;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DictUtils;
import com.smanga.system.mapper.SysDictDataMapper;
import com.smanga.system.service.ISysDictDataService;

/**
 * Dictionary Business layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysDictDataServiceImpl implements ISysDictDataService {
	@Autowired
	private SysDictDataMapper dictDataMapper;

	/**
	 * Paging query dictionary data according to conditions
	 *
	 * @param dictData dictionary data information
	 * @return dictionary data collection information
	 */
	@Override
	public List<SysDictData> selectDictDataList(SysDictData dictData) {
		return dictDataMapper.selectDictDataList(dictData);
	}

	/**
	 * Query dictionary data information according to dictionary type and dictionary
	 * key value
	 *
	 * @param dictType  dictionary type
	 * @param dictValue dictionary key value
	 * @return dictionary tag
	 */
	@Override
	public String selectDictLabel(String dictType, String dictValue) {
		return dictDataMapper.selectDictLabel(dictType, dictValue);
	}

	/**
	 * Query information based on dictionary data ID
	 *
	 * @param dictCode dictionary data ID
	 * @return dictionary data
	 */
	@Override
	public SysDictData selectDictDataById(Long dictCode) {
		return dictDataMapper.selectDictDataById(dictCode);
	}

	/**
	 * Batch delete dictionary data
	 *
	 * @param ids the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteDictDataByIds(String ids) {
		int row = dictDataMapper.deleteDictDataByIds(Convert.toStrArray(ids));
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}

	/**
	 * Added save dictionary data information
	 *
	 * @param dictData dictionary data information
	 * @return result
	 */
	@Override
	public int insertDictData(SysDictData dictData) {
		int row = dictDataMapper.insertDictData(dictData);
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}

	/**
	 * Modify and save dictionary data information
	 *
	 * @param dictData dictionary data information
	 * @return result
	 */
	@Override
	public int updateDictData(SysDictData dictData) {
		int row = dictDataMapper.updateDictData(dictData);
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}
}
