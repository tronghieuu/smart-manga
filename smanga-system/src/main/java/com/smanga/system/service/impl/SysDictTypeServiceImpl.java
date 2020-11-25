package com.smanga.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.domain.Ztree;
import com.smanga.common.core.domain.entity.SysDictData;
import com.smanga.common.core.domain.entity.SysDictType;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.DictUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.system.mapper.SysDictDataMapper;
import com.smanga.system.mapper.SysDictTypeMapper;
import com.smanga.system.service.ISysDictTypeService;

/**
 * Dictionary Business layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysDictTypeServiceImpl implements ISysDictTypeService {
	@Autowired
	private SysDictTypeMapper dictTypeMapper;

	@Autowired
	private SysDictDataMapper dictDataMapper;

	/**
	 * When the project starts, initialize the dictionary to the cache
	 */
	@PostConstruct
	public void init() {
		List<SysDictType> dictTypeList = dictTypeMapper.selectDictTypeAll();
		for (SysDictType dictType : dictTypeList) {
			List<SysDictData> dictDatas = dictDataMapper.selectDictDataByType(dictType.getDictType());
			DictUtils.setDictCache(dictType.getDictType(), dictDatas);
		}
	}

	/**
	 * Paging query dictionary type according to conditions
	 *
	 * @param dictType dictionary type information
	 * @return dictionary type collection information
	 */
	@Override
	public List<SysDictType> selectDictTypeList(SysDictType dictType) {
		return dictTypeMapper.selectDictTypeList(dictType);
	}

	/**
	 * According to all dictionary types
	 *
	 * @return dictionary type collection information
	 */
	@Override
	public List<SysDictType> selectDictTypeAll() {
		return dictTypeMapper.selectDictTypeAll();
	}

	/**
	 * Query dictionary data according to dictionary type
	 *
	 * @param dictType dictionary type
	 * @return dictionary data collection information
	 */
	@Override
	public List<SysDictData> selectDictDataByType(String dictType) {
		List<SysDictData> dictDatas = DictUtils.getDictCache(dictType);
		if (StringUtils.isNotEmpty(dictDatas)) {
			return dictDatas;
		}
		dictDatas = dictDataMapper.selectDictDataByType(dictType);
		if (StringUtils.isNotEmpty(dictDatas)) {
			DictUtils.setDictCache(dictType, dictDatas);
			return dictDatas;
		}
		return null;
	}

	/**
	 * Query information based on dictionary type ID
	 *
	 * @param dictId dictionary type ID
	 * @return dictionary type
	 */
	@Override
	public SysDictType selectDictTypeById(Long dictId) {
		return dictTypeMapper.selectDictTypeById(dictId);
	}

	/**
	 * Query information according to dictionary type
	 *
	 * @param dictType dictionary type
	 * @return dictionary type
	 */
	@Override
	public SysDictType selectDictTypeByType(String dictType) {
		return dictTypeMapper.selectDictTypeByType(dictType);
	}

	/**
	 * Batch delete dictionary types
	 *
	 * @param ids the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteDictTypeByIds(String ids) {
		Long[] dictIds = Convert.toLongArray(ids);
		for (Long dictId : dictIds) {
			SysDictType dictType = selectDictTypeById(dictId);
			if (dictDataMapper.countDictDataByType(dictType.getDictType()) > 0) {
				throw new BusinessException(
						String.format("%1$s has been allocated and cannot be deleted", dictType.getDictName()));
			}
		}
		int count = dictTypeMapper.deleteDictTypeByIds(dictIds);
		if (count > 0) {
			DictUtils.clearDictCache();
		}
		return count;
	}

	/**
	 * Clear cache data
	 */
	@Override
	public void clearCache() {
		DictUtils.clearDictCache();
	}

	/**
	 * Added saving dictionary type information
	 *
	 * @param dictType dictionary type information
	 * @return result
	 */
	@Override
	public int insertDictType(SysDictType dictType) {
		int row = dictTypeMapper.insertDictType(dictType);
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}

	/**
	 * Modify and save dictionary type information
	 *
	 * @param dictType dictionary type information
	 * @return result
	 */
	@Override
	@Transactional
	public int updateDictType(SysDictType dictType) {
		SysDictType oldDict = dictTypeMapper.selectDictTypeById(dictType.getDictId());
		dictDataMapper.updateDictDataType(oldDict.getDictType(), dictType.getDictType());
		int row = dictTypeMapper.updateDictType(dictType);
		if (row > 0) {
			DictUtils.clearDictCache();
		}
		return row;
	}

	/**
	 * Check whether the dictionary type is unique
	 *
	 * @param dict dictionary type
	 * @return result
	 */
	@Override
	public String checkDictTypeUnique(SysDictType dict) {
		Long dictId = StringUtils.isNull(dict.getDictId()) ? -1L : dict.getDictId();
		SysDictType dictType = dictTypeMapper.checkDictTypeUnique(dict.getDictType());
		if (StringUtils.isNotNull(dictType) && dictType.getDictId().longValue() != dictId.longValue()) {
			return UserConstants.DICT_TYPE_NOT_UNIQUE;
		}
		return UserConstants.DICT_TYPE_UNIQUE;
	}

	/**
	 * Query dictionary type tree
	 *
	 * @param dictType dictionary type
	 * @return all dictionary types
	 */
	@Override
	public List<Ztree> selectDictTree(SysDictType dictType) {
		List<Ztree> ztrees = new ArrayList<Ztree>();
		List<SysDictType> dictList = dictTypeMapper.selectDictTypeList(dictType);
		for (SysDictType dict : dictList) {
			if (UserConstants.DICT_NORMAL.equals(dict.getStatus())) {
				Ztree ztree = new Ztree();
				ztree.setId(dict.getDictId());
				ztree.setName(transDictName(dict));
				ztree.setTitle(dict.getDictType());
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}

	public String transDictName(SysDictType dictType) {
		StringBuffer sb = new StringBuffer();
		sb.append("(" + dictType.getDictName() + ")");
		sb.append("&nbsp;&nbsp;&nbsp;" + dictType.getDictType());
		return sb.toString();
	}
}
