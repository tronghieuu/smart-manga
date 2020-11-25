package com.smanga.generator.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.core.text.Convert;
import com.smanga.generator.domain.GenTableColumn;
import com.smanga.generator.mapper.GenTableColumnMapper;
import com.smanga.generator.service.IGenTableColumnService;

/**
 * Business field Service layer implementation
 * 
 * @author Trong Hieu
 */
@Service
public class GenTableColumnServiceImpl implements IGenTableColumnService {
	@Autowired
	private GenTableColumnMapper genTableColumnMapper;

	/**
	 * Query the list of business fields
	 * 
	 * @param genTableColumn Business field information
	 * @return Business field collection
	 */
	@Override
	public List<GenTableColumn> selectGenTableColumnListByTableId(GenTableColumn genTableColumn) {
		return genTableColumnMapper.selectGenTableColumnListByTableId(genTableColumn);
	}

	/**
	 * New business field
	 * 
	 * @param genTableColumn Business field information
	 * @return result
	 */
	@Override
	public int insertGenTableColumn(GenTableColumn genTableColumn) {
		return genTableColumnMapper.insertGenTableColumn(genTableColumn);
	}

	/**
	 * Modify business fields
	 * 
	 * @param genTableColumn Business field information
	 * @return result
	 */
	@Override
	public int updateGenTableColumn(GenTableColumn genTableColumn) {
		return genTableColumnMapper.updateGenTableColumn(genTableColumn);
	}

	/**
	 * Delete business field object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteGenTableColumnByIds(String ids) {
		return genTableColumnMapper.deleteGenTableColumnByIds(Convert.toLongArray(ids));
	}
}