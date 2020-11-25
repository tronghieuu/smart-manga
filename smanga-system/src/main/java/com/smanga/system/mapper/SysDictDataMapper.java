package com.smanga.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.smanga.common.core.domain.entity.SysDictData;

/**
 * Dictionary table data layer
 * 
 * @author Trong Hieu
 */
public interface SysDictDataMapper
{
    /**
     * Query dictionary data page by condition
     * 
     * @param dictData Dictionary data information
     * @return Dictionary data collection information
     */
    public List<SysDictData> selectDictDataList(SysDictData dictData);

    /**
     * Query dictionary data according to dictionary type
     * 
     * @param dictType Dictionary type
     * @return Dictionary data collection information
     */
    public List<SysDictData> selectDictDataByType(String dictType);

    /**
     * Query dictionary data information according to dictionary type and dictionary key value
     * 
     * @param dictType Dictionary type
     * @param dictValue Dictionary key
     * @return Dictionary tag
     */
    public String selectDictLabel(@Param("dictType") String dictType, @Param("dictValue") String dictValue);

    /**
     * Query information based on dictionary data ID
     * 
     * @param dictCode Dictionary data ID
     * @return Dictionary data
     */
    public SysDictData selectDictDataById(Long dictCode);

    /**
     * Query dictionary data
     * 
     * @param dictType Dictionary type
     * @return Dictionary data
     */
    public int countDictDataByType(String dictType);

    /**
     * Delete dictionary data information by dictionary ID
     * 
     * @param dictCode Dictionary data ID
     * @return result
     */
    public int deleteDictDataById(Long dictCode);

    /**
     * Delete dictionary data in bulk
     * 
     * @param ids Data to be deleted
     * @return result
     */
    public int deleteDictDataByIds(String[] ids);

    /**
     * New dictionary data information
     * 
     * @param dictData Dictionary data information
     * @return result
     */
    public int insertDictData(SysDictData dictData);

    /**
     * Modify dictionary data information
     * 
     * @param dictData Dictionary data information
     * @return result
     */
    public int updateDictData(SysDictData dictData);

    /**
     * Synchronously modify dictionary type
     * 
     * @param oldDictType Old dictionary type
     * @param newDictType New and old dictionary types
     * @return result
     */
    public int updateDictDataType(@Param("oldDictType") String oldDictType, @Param("newDictType") String newDictType);
}
