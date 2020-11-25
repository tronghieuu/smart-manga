package com.smanga.generator.mapper;

import java.util.List;

import com.smanga.generator.domain.GenTableColumn;

/**
 * Business field data layer
 *
 * @author Trong Hieu
 */
public interface GenTableColumnMapper
{
    /**
     * Query column information based on table name
     *
     * @param tableName table name
     * @return column information
     */
    public List<GenTableColumn> selectDbTableColumnsByName(String tableName);

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
     * Delete business fields
     *
     * @param genTableColumns column data
     * @return result
     */
    public int deleteGenTableColumns(List<GenTableColumn> genTableColumns);

    /**
     * Delete business fields in bulk
     *
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteGenTableColumnByIds(Long[] ids);
}
