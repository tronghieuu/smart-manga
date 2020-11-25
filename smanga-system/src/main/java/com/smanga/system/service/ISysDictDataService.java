package com.smanga.system.service;

import java.util.List;

import com.smanga.common.core.domain.entity.SysDictData;

/**
 * Dictionary Business layer
 *
 * @author Trong Hieu
 */
public interface ISysDictDataService
{
    /**
     * Paging query dictionary data according to conditions
     *
     * @param dictData dictionary data information
     * @return dictionary data collection information
     */
    public List<SysDictData> selectDictDataList(SysDictData dictData);

    /**
     * Query dictionary data information according to dictionary type and dictionary key value
     *
     * @param dictType dictionary type
     * @param dictValue dictionary key value
     * @return dictionary tag
     */
    public String selectDictLabel(String dictType, String dictValue);

    /**
     * Query information based on dictionary data ID
     *
     * @param dictCode dictionary data ID
     * @return dictionary data
     */
    public SysDictData selectDictDataById(Long dictCode);

    /**
     * Batch delete dictionary data
     *
     * @param ids the data to be deleted
     * @return result
     */
    public int deleteDictDataByIds(String ids);

    /**
     * Added save dictionary data information
     *
     * @param dictData dictionary data information
     * @return result
     */
    public int insertDictData(SysDictData dictData);

    /**
     * Modify and save dictionary data information
     *
     * @param dictData dictionary data information
     * @return result
     */
    public int updateDictData(SysDictData dictData);
}
