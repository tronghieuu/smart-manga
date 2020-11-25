package com.smanga.generator.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.smanga.common.constant.Constants;
import com.smanga.common.constant.GenConstants;
import com.smanga.common.core.text.CharsetKit;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.file.FileUtils;
import com.smanga.generator.domain.GenTable;
import com.smanga.generator.domain.GenTableColumn;
import com.smanga.generator.mapper.GenTableColumnMapper;
import com.smanga.generator.mapper.GenTableMapper;
import com.smanga.generator.service.IGenTableService;
import com.smanga.generator.util.GenUtils;
import com.smanga.generator.util.VelocityInitializer;
import com.smanga.generator.util.VelocityUtils;

/**
 * Business service layer implementation
 * 
 * @author Trong Hieu
 */
@Service
public class GenTableServiceImpl implements IGenTableService {
	private static final Logger log = LoggerFactory.getLogger(GenTableServiceImpl.class);

	@Autowired
	private GenTableMapper genTableMapper;

	@Autowired
	private GenTableColumnMapper genTableColumnMapper;

	/**
	 * Query business information
	 * 
	 * @param id Business ID
	 * @return Business information
	 */
	@Override
	public GenTable selectGenTableById(Long id) {
		GenTable genTable = genTableMapper.selectGenTableById(id);
		setTableFromOptions(genTable);
		return genTable;
	}

	/**
	 * Query business list
	 * 
	 * @param genTable Business information
	 * @return Business collection
	 */
	@Override
	public List<GenTable> selectGenTableList(GenTable genTable) {
		return genTableMapper.selectGenTableList(genTable);
	}

	/**
	 * Query database list
	 * 
	 * @param genTable Business information
	 * @return Database table collection
	 */
	@Override
	public List<GenTable> selectDbTableList(GenTable genTable) {
		return genTableMapper.selectDbTableList(genTable);
	}

	/**
	 * Query database list
	 * 
	 * @param tableNames Table name group
	 * @return Database table collection
	 */
	@Override
	public List<GenTable> selectDbTableListByNames(String[] tableNames) {
		return genTableMapper.selectDbTableListByNames(tableNames);
	}

	/**
	 * Query all table information
	 * 
	 * @return Table information collection
	 */
	@Override
	public List<GenTable> selectGenTableAll() {
		return genTableMapper.selectGenTableAll();
	}

	/**
	 * Modify business
	 * 
	 * @param genTable Business information
	 * @return result
	 */
	@Override
	@Transactional
	public void updateGenTable(GenTable genTable) {
		String options = JSON.toJSONString(genTable.getParams());
		genTable.setOptions(options);
		int row = genTableMapper.updateGenTable(genTable);
		if (row > 0) {
			for (GenTableColumn cenTableColumn : genTable.getColumns()) {
				genTableColumnMapper.updateGenTableColumn(cenTableColumn);
			}
		}
	}

	/**
	 * Delete business object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	@Transactional
	public void deleteGenTableByIds(String ids) {
		genTableMapper.deleteGenTableByIds(Convert.toLongArray(ids));
		genTableColumnMapper.deleteGenTableColumnByIds(Convert.toLongArray(ids));
	}

	/**
	 * Import table structure
	 * 
	 * @param tableList Import table list
	 * @param operName  operator
	 */
	@Override
	@Transactional
	public void importGenTable(List<GenTable> tableList, String operName) {
		try {
			for (GenTable table : tableList) {
				String tableName = table.getTableName();
				GenUtils.initTable(table, operName);
				int row = genTableMapper.insertGenTable(table);
				if (row > 0) {
					// Save column information
					List<GenTableColumn> genTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
					for (GenTableColumn column : genTableColumns) {
						GenUtils.initColumnField(column, table);
						genTableColumnMapper.insertGenTableColumn(column);
					}
				}
			}
		} catch (Exception e) {
			throw new BusinessException("Import failed: " + e.getMessage());
		}
	}

	/**
	 * Preview code
	 * 
	 * @param tableId Table number
	 * @return Preview data list
	 */
	@Override
	public Map<String, String> previewCode(Long tableId) {
		Map<String, String> dataMap = new LinkedHashMap<>();
		// Query form information
		GenTable table = genTableMapper.selectGenTableById(tableId);
		// Set master and sub table information
		setSubTable(table);
		// Set the primary key column information
		setPkColumn(table);
		VelocityInitializer.initVelocity();

		VelocityContext context = VelocityUtils.prepareContext(table);

		// Get a list of templates
		List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
		for (String template : templates) {
			// Render template
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, Constants.UTF8);
			tpl.merge(context, sw);
			dataMap.put(template, sw.toString());
		}
		return dataMap;
	}

	/**
	 * Generate code (download method)
	 * 
	 * @param tableName Table name
	 * @return data
	 */
	@Override
	public byte[] downloadCode(String tableName) {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(outputStream);
		generatorCode(tableName, zip);
		IOUtils.closeQuietly(zip);
		return outputStream.toByteArray();
	}

	/**
	 * Generate code (custom path)
	 * 
	 * @param tableName Table name
	 */
	@Override
	public void generatorCode(String tableName) {
		// Query form information
		GenTable table = genTableMapper.selectGenTableByName(tableName);
		// Set master and sub table information
		setSubTable(table);
		// Set the primary key column information
		setPkColumn(table);

		VelocityInitializer.initVelocity();

		VelocityContext context = VelocityUtils.prepareContext(table);

		// Get a list of templates
		List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
		for (String template : templates) {
			if (!StringUtils.contains(template, "sql.vm")) {
				// Render template
				StringWriter sw = new StringWriter();
				Template tpl = Velocity.getTemplate(template, Constants.UTF8);
				tpl.merge(context, sw);
				try {
					String path = getGenPath(table, template);
					FileUtils.writeStringToFile(new File(path), sw.toString(), CharsetKit.UTF_8);
				} catch (IOException e) {
					throw new BusinessException("Failed to render template, table name: " + table.getTableName());
				}
			}
		}
	}

	/**
	 * Synchronize the database
	 * 
	 * @param tableName Table name
	 */
	@Override
	@Transactional
	public void synchDb(String tableName) {
		GenTable table = genTableMapper.selectGenTableByName(tableName);
		List<GenTableColumn> tableColumns = table.getColumns();
		List<String> tableColumnNames = tableColumns.stream().map(GenTableColumn::getColumnName)
				.collect(Collectors.toList());

		List<GenTableColumn> dbTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
		if (StringUtils.isEmpty(dbTableColumns)) {
			throw new BusinessException("Failed to synchronize data, the original table structure does not exist");
		}
		List<String> dbTableColumnNames = dbTableColumns.stream().map(GenTableColumn::getColumnName)
				.collect(Collectors.toList());

		dbTableColumns.forEach(column -> {
			if (!tableColumnNames.contains(column.getColumnName())) {
				GenUtils.initColumnField(column, table);
				genTableColumnMapper.insertGenTableColumn(column);
			}
		});

		List<GenTableColumn> delColumns = tableColumns.stream()
				.filter(column -> !dbTableColumnNames.contains(column.getColumnName())).collect(Collectors.toList());
		if (StringUtils.isNotEmpty(delColumns)) {
			genTableColumnMapper.deleteGenTableColumns(delColumns);
		}
	}

	/**
	 * Batch code generation
	 * 
	 * @param tableNames Table array
	 * @return data
	 */
	@Override
	public byte[] downloadCode(String[] tableNames) {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(outputStream);
		for (String tableName : tableNames) {
			generatorCode(tableName, zip);
		}
		IOUtils.closeQuietly(zip);
		return outputStream.toByteArray();
	}

	/**
	 * Query table information and generate code
	 */
	private void generatorCode(String tableName, ZipOutputStream zip) {
		// Query form information
		GenTable table = genTableMapper.selectGenTableByName(tableName);
		// Set master and sub table information
		setSubTable(table);
		// Set the primary key column information
		setPkColumn(table);

		VelocityInitializer.initVelocity();

		VelocityContext context = VelocityUtils.prepareContext(table);

		// Get a list of templates
		List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
		for (String template : templates) {
			// Render template
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, Constants.UTF8);
			tpl.merge(context, sw);
			try {
				// Add to zip
				zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
				IOUtils.write(sw.toString(), zip, Constants.UTF8);
				IOUtils.closeQuietly(sw);
				zip.flush();
				zip.closeEntry();
			} catch (IOException e) {
				log.error("Failed to render template, table name: " + table.getTableName(), e);
			}
		}
	}

	/**
	 * Modify and save parameter verification
	 * 
	 * @param genTable Business information
	 */
	@Override
	public void validateEdit(GenTable genTable) {
		if (GenConstants.TPL_TREE.equals(genTable.getTplCategory())) {
			String options = JSON.toJSONString(genTable.getParams());
			JSONObject paramsObj = JSONObject.parseObject(options);
			if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_CODE))) {
				throw new BusinessException("Tree code field cannot be empty");
			} else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_PARENT_CODE))) {
				throw new BusinessException("Tree parent encoding field cannot be empty");
			} else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_NAME))) {
				throw new BusinessException("The tree name field cannot be empty");
			}
		} else if (GenConstants.TPL_SUB.equals(genTable.getTplCategory())) {
			if (StringUtils.isEmpty(genTable.getSubTableName())) {
				throw new BusinessException("The table name of the associated child table cannot be empty");
			} else if (StringUtils.isEmpty(genTable.getSubTableFkName())) {
				throw new BusinessException("The name of the foreign key associated with the child table cannot be empty");
			}
		}
	}

	/**
	 * Set the primary key column information
	 * 
	 * @param table Business table information
	 */
	public void setPkColumn(GenTable table) {
		for (GenTableColumn column : table.getColumns()) {
			if (column.isPk()) {
				table.setPkColumn(column);
				break;
			}
		}
		if (StringUtils.isNull(table.getPkColumn())) {
			table.setPkColumn(table.getColumns().get(0));
		}
		if (GenConstants.TPL_SUB.equals(table.getTplCategory())) {
			for (GenTableColumn column : table.getSubTable().getColumns()) {
				if (column.isPk()) {
					table.getSubTable().setPkColumn(column);
					break;
				}
			}
			if (StringUtils.isNull(table.getSubTable().getPkColumn())) {
				table.getSubTable().setPkColumn(table.getSubTable().getColumns().get(0));
			}
		}
	}

	/**
	 * Set master and sub table information
	 * 
	 * @param table Business table information
	 */
	public void setSubTable(GenTable table) {
		String subTableName = table.getSubTableName();
		if (StringUtils.isNotEmpty(subTableName)) {
			table.setSubTable(genTableMapper.selectGenTableByName(subTableName));
		}
	}

	/**
	 * Set the code to generate other option values
	 * 
	 * @param genTable Generated object after setting
	 */
	public void setTableFromOptions(GenTable genTable) {
		JSONObject paramsObj = JSONObject.parseObject(genTable.getOptions());
		if (StringUtils.isNotNull(paramsObj)) {
			String treeCode = paramsObj.getString(GenConstants.TREE_CODE);
			String treeParentCode = paramsObj.getString(GenConstants.TREE_PARENT_CODE);
			String treeName = paramsObj.getString(GenConstants.TREE_NAME);
			String parentMenuId = paramsObj.getString(GenConstants.PARENT_MENU_ID);
			String parentMenuName = paramsObj.getString(GenConstants.PARENT_MENU_NAME);

			genTable.setTreeCode(treeCode);
			genTable.setTreeParentCode(treeParentCode);
			genTable.setTreeName(treeName);
			genTable.setParentMenuId(parentMenuId);
			genTable.setParentMenuName(parentMenuName);
		}
	}

	/**
	 * Get code generation address
	 * 
	 * @param table    Business table information
	 * @param template Template file path
	 * @return Generate address
	 */
	public static String getGenPath(GenTable table, String template) {
		String genPath = table.getGenPath();
		if (StringUtils.equals(genPath, "/")) {
			return System.getProperty("user.dir") + File.separator + "src" + File.separator
					+ VelocityUtils.getFileName(template, table);
		}
		return genPath + File.separator + VelocityUtils.getFileName(template, table);
	}
}