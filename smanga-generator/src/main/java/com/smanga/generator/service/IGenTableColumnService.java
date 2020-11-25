package com.smanga.generator.service;

import java.util.List;

import com.smanga.generator.domain.GenTableColumn;

/**
 * Business field Service layer
 *
 * @author Trong Hieu
 */
public interface IGenTableColumnService
{
    /**
     * Query the list of business fields
     *
     * @param genTableColumn business field information
     * @return business field collection
     */
    public List<GenTableColumn> selectGenTableColumnListByTableId(GenTableColumn genTableColumn);

    /**
     * Added business fields
     *
     * @param genTableColumn business field information
     * @return result
     */
    public int insertGenTableColumn(GenTableColumn genTableColumn);

    /**
     * Modify business fields
     *
     * @param genTableColumn business field information
     * @return result
     */
    public int updateGenTableColumn(GenTableColumn genTableColumn);

    /**
     * Delete business field information
     *
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteGenTableColumnByIds(String ids);
}
