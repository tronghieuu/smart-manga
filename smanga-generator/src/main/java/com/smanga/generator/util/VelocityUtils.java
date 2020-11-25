package com.smanga.generator.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.apache.velocity.VelocityContext;

import com.alibaba.fastjson.JSONObject;
import com.smanga.common.constant.GenConstants;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.generator.config.GenConfig;
import com.smanga.generator.domain.GenTable;
import com.smanga.generator.domain.GenTableColumn;

public class VelocityUtils {
	/** Project space path */
	private static final String PROJECT_PATH = "main/java";

	/** mybatis space path */
	private static final String MYBATIS_PATH = "main/resources/mapper";

	/** html space path */
	private static final String TEMPLATES_PATH = "main/resources/templates";

	/** Default superior menu, system tools */
	private static final String DEFAULT_PARENT_MENU_ID = "3";

	/**
	 * Set template variable information
	 * 
	 * @return Template list
	 */
	public static VelocityContext prepareContext(GenTable genTable) {
		String moduleName = genTable.getModuleName();
		String businessName = genTable.getBusinessName();
		String packageName = genTable.getPackageName();
		String tplCategory = genTable.getTplCategory();
		String functionName = genTable.getFunctionName();

		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("tplCategory", genTable.getTplCategory());
		velocityContext.put("tableName", genTable.getTableName());
		velocityContext.put("functionName", StringUtils.isNotEmpty(functionName) ? functionName : "【Please fill in the function name】");
		velocityContext.put("ClassName", genTable.getClassName());
		velocityContext.put("className", StringUtils.uncapitalize(genTable.getClassName()));
		velocityContext.put("moduleName", genTable.getModuleName());
		velocityContext.put("businessName", genTable.getBusinessName());
		velocityContext.put("basePackage", getPackagePrefix(packageName));
		velocityContext.put("packageName", packageName);
		velocityContext.put("author", genTable.getFunctionAuthor());
		velocityContext.put("datetime", DateUtils.getDate());
		velocityContext.put("pkColumn", genTable.getPkColumn());
		velocityContext.put("importList", getImportList(genTable));
		velocityContext.put("permissionPrefix", getPermissionPrefix(moduleName, businessName));
		velocityContext.put("columns", genTable.getColumns());
		velocityContext.put("table", genTable);
		setMenuVelocityContext(velocityContext, genTable);
		if (GenConstants.TPL_TREE.equals(tplCategory)) {
			setTreeVelocityContext(velocityContext, genTable);
		}
		if (GenConstants.TPL_SUB.equals(tplCategory)) {
			setSubVelocityContext(velocityContext, genTable);
		}
		return velocityContext;
	}

	public static void setMenuVelocityContext(VelocityContext context, GenTable genTable) {
		String options = genTable.getOptions();
		JSONObject paramsObj = JSONObject.parseObject(options);
		String parentMenuId = getParentMenuId(paramsObj);
		context.put("parentMenuId", parentMenuId);
	}

	public static void setTreeVelocityContext(VelocityContext context, GenTable genTable) {
		String options = genTable.getOptions();
		JSONObject paramsObj = JSONObject.parseObject(options);
		String treeCode = getTreecode(paramsObj);
		String treeParentCode = getTreeParentCode(paramsObj);
		String treeName = getTreeName(paramsObj);

		context.put("treeCode", treeCode);
		context.put("treeParentCode", treeParentCode);
		context.put("treeName", treeName);
		context.put("expandColumn", getExpandColumn(genTable));
		if (paramsObj.containsKey(GenConstants.TREE_PARENT_CODE)) {
			context.put("tree_parent_code", paramsObj.getString(GenConstants.TREE_PARENT_CODE));
		}
		if (paramsObj.containsKey(GenConstants.TREE_NAME)) {
			context.put("tree_name", paramsObj.getString(GenConstants.TREE_NAME));
		}
	}

	public static void setSubVelocityContext(VelocityContext context, GenTable genTable) {
		GenTable subTable = genTable.getSubTable();
		String subTableName = genTable.getSubTableName();
		String subTableFkName = genTable.getSubTableFkName();
		String subClassName = genTable.getSubTable().getClassName();
		String subTableFkClassName = StringUtils.convertToCamelCase(subTableFkName);

		context.put("subTable", subTable);
		context.put("subTableName", subTableName);
		context.put("subTableFkName", subTableFkName);
		context.put("subTableFkClassName", subTableFkClassName);
		context.put("subTableFkclassName", StringUtils.uncapitalize(subTableFkClassName));
		context.put("subClassName", subClassName);
		context.put("subclassName", StringUtils.uncapitalize(subClassName));
		context.put("subImportList", getImportList(genTable.getSubTable()));
	}

	/**
	 * Get template information
	 * 
	 * @return Template list
	 */
	public static List<String> getTemplateList(String tplCategory) {
		List<String> templates = new ArrayList<String>();
		templates.add("vm/java/domain.java.vm");
		templates.add("vm/java/mapper.java.vm");
		templates.add("vm/java/service.java.vm");
		templates.add("vm/java/serviceImpl.java.vm");
		templates.add("vm/java/controller.java.vm");
		templates.add("vm/xml/mapper.xml.vm");
		if (GenConstants.TPL_CRUD.equals(tplCategory)) {
			templates.add("vm/html/list.html.vm");
		} else if (GenConstants.TPL_TREE.equals(tplCategory)) {
			templates.add("vm/html/tree.html.vm");
			templates.add("vm/html/list-tree.html.vm");
		} else if (GenConstants.TPL_SUB.equals(tplCategory)) {
			templates.add("vm/html/list.html.vm");
			templates.add("vm/java/sub-domain.java.vm");
		}
		templates.add("vm/html/add.html.vm");
		templates.add("vm/html/edit.html.vm");
		templates.add("vm/sql/sql.vm");
		return templates;
	}

	/**
	 * Get file name
	 */
	public static String getFileName(String template, GenTable genTable) {
		// file name
		String fileName = "";
		// Package path
		String packageName = genTable.getPackageName();
		// Module name
		String moduleName = genTable.getModuleName();
		// Uppercase class name
		String className = genTable.getClassName();
		// business name
		String businessName = genTable.getBusinessName();

		String javaPath = PROJECT_PATH + "/" + StringUtils.replace(packageName, ".", "/");
		String mybatisPath = MYBATIS_PATH + "/" + moduleName;
		String htmlPath = TEMPLATES_PATH + "/" + moduleName + "/" + businessName;

		if (template.contains("domain.java.vm")) {
			fileName = StringUtils.format("{}/domain/{}.java", javaPath, className);
		}
		if (template.contains("sub-domain.java.vm")
				&& StringUtils.equals(GenConstants.TPL_SUB, genTable.getTplCategory())) {
			fileName = StringUtils.format("{}/domain/{}.java", javaPath, genTable.getSubTable().getClassName());
		} else if (template.contains("mapper.java.vm")) {
			fileName = StringUtils.format("{}/mapper/{}Mapper.java", javaPath, className);
		} else if (template.contains("service.java.vm")) {
			fileName = StringUtils.format("{}/service/I{}Service.java", javaPath, className);
		} else if (template.contains("serviceImpl.java.vm")) {
			fileName = StringUtils.format("{}/service/impl/{}ServiceImpl.java", javaPath, className);
		} else if (template.contains("controller.java.vm")) {
			fileName = StringUtils.format("{}/controller/{}Controller.java", javaPath, className);
		} else if (template.contains("mapper.xml.vm")) {
			fileName = StringUtils.format("{}/{}Mapper.xml", mybatisPath, className);
		} else if (template.contains("list.html.vm")) {
			fileName = StringUtils.format("{}/{}.html", htmlPath, businessName);
		} else if (template.contains("list-tree.html.vm")) {
			fileName = StringUtils.format("{}/{}.html", htmlPath, businessName);
		} else if (template.contains("tree.html.vm")) {
			fileName = StringUtils.format("{}/tree.html", htmlPath);
		} else if (template.contains("add.html.vm")) {
			fileName = StringUtils.format("{}/add.html", htmlPath);
		} else if (template.contains("edit.html.vm")) {
			fileName = StringUtils.format("{}/edit.html", htmlPath);
		} else if (template.contains("sql.vm")) {
			fileName = businessName + "Menu.sql";
		}
		return fileName;
	}

	/**
	 * Get project file path
	 * 
	 * @return path
	 */
	public static String getProjectPath() {
		String packageName = GenConfig.getPackageName();
		StringBuffer projectPath = new StringBuffer();
		projectPath.append("main/java/");
		projectPath.append(packageName.replace(".", "/"));
		projectPath.append("/");
		return projectPath.toString();
	}

	/**
	 * Get package prefix
	 * 
	 * @param packageName Package name
	 * @return Package prefix name
	 */
	public static String getPackagePrefix(String packageName) {
		int lastIndex = packageName.lastIndexOf(".");
		String basePackage = StringUtils.substring(packageName, 0, lastIndex);
		return basePackage;
	}

	/**
	 * Get the import package according to the column type
	 * 
	 * @param genTable Business table object
	 * @return Return the list of packages that need to be imported
	 */
	public static HashSet<String> getImportList(GenTable genTable) {
		List<GenTableColumn> columns = genTable.getColumns();
		GenTable subGenTable = genTable.getSubTable();
		HashSet<String> importList = new HashSet<String>();
		if (StringUtils.isNotNull(subGenTable)) {
			importList.add("java.util.List");
		}
		for (GenTableColumn column : columns) {
			if (!column.isSuperColumn() && GenConstants.TYPE_DATE.equals(column.getJavaType())) {
				importList.add("java.util.Date");
			} else if (!column.isSuperColumn() && GenConstants.TYPE_BIGDECIMAL.equals(column.getJavaType())) {
				importList.add("java.math.BigDecimal");
			}
		}
		return importList;
	}

	/**
	 * Get permission prefix
	 * 
	 * @param moduleName   Module name
	 * @param businessName business name
	 * @return Return permission prefix
	 */
	public static String getPermissionPrefix(String moduleName, String businessName) {
		return StringUtils.format("{}:{}", moduleName, businessName);
	}

	/**
	 * Get the upper-level menu ID field
	 * 
	 * @param options Generate other options
	 * @return Upper menu ID field
	 */
	public static String getParentMenuId(JSONObject paramsObj) {
		if (StringUtils.isNotEmpty(paramsObj) && paramsObj.containsKey(GenConstants.PARENT_MENU_ID)) {
			return paramsObj.getString(GenConstants.PARENT_MENU_ID);
		}
		return DEFAULT_PARENT_MENU_ID;
	}

	/**
	 * Get tree encoding
	 * 
	 * @param options Generate other options
	 * @return Tree coding
	 */
	public static String getTreecode(JSONObject paramsObj) {
		if (paramsObj.containsKey(GenConstants.TREE_CODE)) {
			return StringUtils.toCamelCase(paramsObj.getString(GenConstants.TREE_CODE));
		}
		return StringUtils.EMPTY;
	}

	/**
	 * Get tree parent code
	 * 
	 * @param options Generate other options
	 * @return Tree parent encoding
	 */
	public static String getTreeParentCode(JSONObject paramsObj) {
		if (paramsObj.containsKey(GenConstants.TREE_PARENT_CODE)) {
			return StringUtils.toCamelCase(paramsObj.getString(GenConstants.TREE_PARENT_CODE));
		}
		return StringUtils.EMPTY;
	}

	/**
	 * Get tree name
	 * 
	 * @param options Generate other options
	 * @return Tree name
	 */
	public static String getTreeName(JSONObject paramsObj) {
		if (paramsObj.containsKey(GenConstants.TREE_NAME)) {
			return StringUtils.toCamelCase(paramsObj.getString(GenConstants.TREE_NAME));
		}
		return StringUtils.EMPTY;
	}

	/**
	 * Get the column on which the expand button needs to be displayed
	 * 
	 * @param genTable Business table object
	 * @return Expand button column number
	 */
	public static int getExpandColumn(GenTable genTable) {
		String options = genTable.getOptions();
		JSONObject paramsObj = JSONObject.parseObject(options);
		String treeName = paramsObj.getString(GenConstants.TREE_NAME);
		int num = 0;
		for (GenTableColumn column : genTable.getColumns()) {
			if (column.isList()) {
				num++;
				String columnName = column.getColumnName();
				if (columnName.equals(treeName)) {
					break;
				}
			}
		}
		return num;
	}
}