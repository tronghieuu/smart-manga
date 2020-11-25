package com.smanga.system.mapper;

import java.util.List;

import com.smanga.common.core.domain.entity.SysDictType;

/**
 * Dictionary table data layer
 * 
 * @author Trong Hieu
 */
public interface SysDictTypeMapper
{
    /**
     * Search dictionary type by condition
     * 
     * @param dictType Dictionary type information
     * @return Dictionary type collection information
     */
    public List<SysDictType> selectDictTypeList(SysDictType dictType);

    /**
     * According to all dictionary types
     * 
     * @return Dictionary type collection information
     */
    public List<SysDictType> selectDictTypeAll();

    /**
     * Query information based on dictionary type ID
     * 
     * @param dictId Dictionary type ID
     * @return Dictionary type
     */
    public SysDictType selectDictTypeById(Long dictId);

    /**
     * Query information based on dictionary type
     * 
     * @param dictType Dictionary type
     * @return Dictionary type
     */
    public SysDictType selectDictTypeByType(String dictType);

    /**
     * Delete dictionary information by dictionary ID
     * 
     * @param dictId Dictionary ID
     * @return result
     */
    public int deleteDictTypeById(Long dictId);

    /**
     * Batch delete dictionary types
     * 
     * @param ids Data to be deleted
     * @return result
     */
    public int deleteDictTypeByIds(Long[] ids);

    /**
     * New dictionary type information
     * 
     * @param dictType Dictionary type information
     * @return result
     */
    public int insertDictType(SysDictType dictType);

    /**
     * Modify dictionary type information
     * 
     * @param dictType Dictionary type information
     * @return result
     */
    public int updateDictType(SysDictType dictType);

    /**
     * Check whether the dictionary type is unique
     * 
     * @param dictType Dictionary type
     * @return result
     */
    public SysDictType checkDictTypeUnique(String dictType);
}
