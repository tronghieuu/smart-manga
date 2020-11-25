package com.smanga.generator.util;

import java.util.Arrays;

import org.apache.commons.lang3.RegExUtils;

import com.smanga.common.constant.GenConstants;
import com.smanga.common.utils.StringUtils;
import com.smanga.generator.config.GenConfig;
import com.smanga.generator.domain.GenTable;
import com.smanga.generator.domain.GenTableColumn;

/**
 * Code generator tools
 * 
 * @author Trong Hieu
 */
public class GenUtils {
	/**
	 * Initialize table information
	 */
	public static void initTable(GenTable genTable, String operName) {
		genTable.setClassName(convertClassName(genTable.getTableName()));
		genTable.setPackageName(GenConfig.getPackageName());
		genTable.setModuleName(getModuleName(GenConfig.getPackageName()));
		genTable.setBusinessName(getBusinessName(genTable.getTableName()));
		genTable.setFunctionName(replaceText(genTable.getTableComment()));
		genTable.setFunctionAuthor(GenConfig.getAuthor());
		genTable.setCreateBy(operName);
	}

	/**
	 * Initialize column attribute fields
	 */
	public static void initColumnField(GenTableColumn column, GenTable table) {
		String dataType = getDbType(column.getColumnType());
		String columnName = column.getColumnName();
		column.setTableId(table.getTableId());
		column.setCreateBy(table.getCreateBy());
		// Set java field name
		column.setJavaField(StringUtils.toCamelCase(columnName));

		if (arraysContains(GenConstants.COLUMNTYPE_STR, dataType)) {
			column.setJavaType(GenConstants.TYPE_STRING);
			// Set the string length more than 500 as a text field
			Integer columnLength = getColumnLength(column.getColumnType());
			String htmlType = columnLength >= 500 ? GenConstants.HTML_TEXTAREA : GenConstants.HTML_INPUT;
			column.setHtmlType(htmlType);
		} else if (arraysContains(GenConstants.COLUMNTYPE_TIME, dataType)) {
			column.setJavaType(GenConstants.TYPE_DATE);
			column.setHtmlType(GenConstants.HTML_DATETIME);
		} else if (arraysContains(GenConstants.COLUMNTYPE_NUMBER, dataType)) {
			column.setHtmlType(GenConstants.HTML_INPUT);

			// If it is floating point
			String[] str = StringUtils.split(StringUtils.substringBetween(column.getColumnType(), "(", ")"), ",");
			if (str != null && str.length == 2 && Integer.parseInt(str[1]) > 0) {
				column.setJavaType(GenConstants.TYPE_BIGDECIMAL);
			}
			// If it is plastic surgery
			else if (str != null && str.length == 1 && Integer.parseInt(str[0]) <= 10) {
				column.setJavaType(GenConstants.TYPE_INTEGER);
			}
			// Long plastic
			else {
				column.setJavaType(GenConstants.TYPE_LONG);
			}
		}

		// Insert field (default all fields need to be inserted)
		column.setIsInsert(GenConstants.REQUIRE);

		// Edit field
		if (!arraysContains(GenConstants.COLUMNNAME_NOT_EDIT, columnName) && !column.isPk()) {
			column.setIsEdit(GenConstants.REQUIRE);
		}
		// List field
		if (!arraysContains(GenConstants.COLUMNNAME_NOT_LIST, columnName) && !column.isPk()) {
			column.setIsList(GenConstants.REQUIRE);
		}
		// Query field
		if (!arraysContains(GenConstants.COLUMNNAME_NOT_QUERY, columnName) && !column.isPk()) {
			column.setIsQuery(GenConstants.REQUIRE);
		}

		// Query field type
		if (StringUtils.endsWithIgnoreCase(columnName, "name")) {
			column.setQueryType(GenConstants.QUERY_LIKE);
		}
		// Status field setting radio button
		if (StringUtils.endsWithIgnoreCase(columnName, "status")) {
			column.setHtmlType(GenConstants.HTML_RADIO);
		}
		// Type & gender field setting drop-down box
		else if (StringUtils.endsWithIgnoreCase(columnName, "type")
				|| StringUtils.endsWithIgnoreCase(columnName, "sex")) {
			column.setHtmlType(GenConstants.HTML_SELECT);
		}
		// File field setting upload control
		else if (StringUtils.endsWithIgnoreCase(columnName, "file")) {
			column.setHtmlType(GenConstants.HTML_UPLOAD);
		}
		// Content field setting rich text control
		else if (StringUtils.endsWithIgnoreCase(columnName, "content")) {
			column.setHtmlType(GenConstants.HTML_SUMMERNOTE);
		}
	}

	/**
	 * Check whether the array contains the specified value
	 * 
	 * @param arr         Array
	 * @param targetValue value
	 * @return Does it contain
	 */
	public static boolean arraysContains(String[] arr, String targetValue) {
		return Arrays.asList(arr).contains(targetValue);
	}

	/**
	 * Get module name
	 * 
	 * @param packageName Package names
	 * @return Module name
	 */
	public static String getModuleName(String packageName) {
		int lastIndex = packageName.lastIndexOf(".");
		int nameLength = packageName.length();
		String moduleName = StringUtils.substring(packageName, lastIndex + 1, nameLength);
		return moduleName;
	}

	/**
	 * Get business name
	 * 
	 * @param tableName Table Name
	 * @return Business name
	 */
	public static String getBusinessName(String tableName) {
		int lastIndex = tableName.lastIndexOf("_");
		int nameLength = tableName.length();
		String businessName = StringUtils.substring(tableName, lastIndex + 1, nameLength);
		return businessName;
	}

	/**
	 * Table name is converted to Java class name
	 * 
	 * @param tableName Table name
	 * @return Class name
	 */
	public static String convertClassName(String tableName) {
		boolean autoRemovePre = GenConfig.getAutoRemovePre();
		String tablePrefix = GenConfig.getTablePrefix();
		if (autoRemovePre && StringUtils.isNotEmpty(tablePrefix)) {
			String[] searchList = StringUtils.split(tablePrefix, ",");
			tableName = replaceFirst(tableName, searchList);
		}
		return StringUtils.convertToCamelCase(tableName);
	}

	/**
	 * Replace prefixes in bulk
	 * 
	 * @param replacementm Replacement value
	 * @param searchList   Replacement list
	 * @return
	 */
	public static String replaceFirst(String replacementm, String[] searchList) {
		String text = replacementm;
		for (String searchString : searchList) {
			if (replacementm.startsWith(searchString)) {
				text = replacementm.replaceFirst(searchString, "");
				break;
			}
		}
		return text;
	}

	/**
	 * Keyword substitution
	 * 
	 * @param text The name that needs to be replaced
	 * @return Replaced name
	 */
	public static String replaceText(String text) {
		return RegExUtils.replaceAll(text, "(?:Table | Smanga)", "");
	}

	/**
	 * Get database type field
	 * 
	 * @param columnType Column type
	 * @return Column type after interception
	 */
	public static String getDbType(String columnType) {
		if (StringUtils.indexOf(columnType, "(") > 0) {
			return StringUtils.substringBefore(columnType, "(");
		} else {
			return columnType;
		}
	}

	/**
	 * Get field length
	 * 
	 * @param columnType Column type
	 * @return Column type after interception
	 */
	public static Integer getColumnLength(String columnType) {
		if (StringUtils.indexOf(columnType, "(") > 0) {
			String length = StringUtils.substringBetween(columnType, "(", ")");
			return Integer.valueOf(length);
		} else {
			return 0;
		}
	}

	/**
	 * Get empty array list
	 * 
	 * @param length length
	 * @return Array information
	 */
	public static String[] emptyList(int length) {
		String[] values = new String[length];
		for (int i = 0; i < length; i++) {
			values[i] = StringUtils.EMPTY;
		}
		return values;
	}
}