package com.smanga.generator.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.smanga.common.annotation.Log;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.domain.CxSelect;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.core.text.Convert;
import com.smanga.common.enums.BusinessType;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.security.PermissionUtils;
import com.smanga.generator.domain.GenTable;
import com.smanga.generator.domain.GenTableColumn;
import com.smanga.generator.service.IGenTableColumnService;
import com.smanga.generator.service.IGenTableService;

/**
 * Code generation operation processing
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/tool/gen")
public class GenController extends BaseController {
	private String prefix = "tool/gen";

	@Autowired
	private IGenTableService genTableService;

	@Autowired
	private IGenTableColumnService genTableColumnService;

	@RequiresPermissions("tool:gen:view")
	@GetMapping()
	public String gen() {
		return prefix + "/gen";
	}

	/**
	 * Query code generation list
	 */
	@RequiresPermissions("tool:gen:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo genList(GenTable genTable) {
		startPage();
		List<GenTable> list = genTableService.selectGenTableList(genTable);
		return getDataTable(list);
	}

	/**
	 * Query database list
	 */
	@RequiresPermissions("tool:gen:list")
	@PostMapping("/db/list")
	@ResponseBody
	public TableDataInfo dataList(GenTable genTable) {
		startPage();
		List<GenTable> list = genTableService.selectDbTableList(genTable);
		return getDataTable(list);
	}

	/**
	 * Query the list of data table fields
	 */
	@RequiresPermissions("tool:gen:list")
	@PostMapping("/column/list")
	@ResponseBody
	public TableDataInfo columnList(GenTableColumn genTableColumn) {
		TableDataInfo dataInfo = new TableDataInfo();
		List<GenTableColumn> list = genTableColumnService.selectGenTableColumnListByTableId(genTableColumn);
		dataInfo.setRows(list);
		dataInfo.setTotal(list.size());
		return dataInfo;
	}

	/**
	 * Import table structure
	 */
	@RequiresPermissions("tool:gen:list")
	@GetMapping("/importTable")
	public String importTable() {
		return prefix + "/importTable";
	}

	/**
	 * Import table structure (save)
	 */
	@RequiresPermissions("tool:gen:list")
	@Log(title = "Code generation", businessType = BusinessType.IMPORT)
	@PostMapping("/importTable")
	@ResponseBody
	public AjaxResult importTableSave(String tables) {
		String[] tableNames = Convert.toStrArray(tables);
		// Query form information
		List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
		String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
		genTableService.importGenTable(tableList, operName);
		return AjaxResult.success();
	}

	/**
	 * Modify code generation business
	 */
	@GetMapping("/edit/{tableId}")
	public String edit(@PathVariable("tableId") Long tableId, ModelMap mmap) {
		GenTable table = genTableService.selectGenTableById(tableId);
		List<GenTable> genTables = genTableService.selectGenTableAll();
		List<CxSelect> cxSelect = new ArrayList<CxSelect>();
		for (GenTable genTable : genTables) {
			if (!StringUtils.equals(table.getTableName(), genTable.getTableName())) {
				CxSelect cxTable = new CxSelect(genTable.getTableName(),
						genTable.getTableName() + '：' + genTable.getTableComment());
				List<CxSelect> cxColumns = new ArrayList<CxSelect>();
				for (GenTableColumn tableColumn : genTable.getColumns()) {
					cxColumns.add(new CxSelect(tableColumn.getColumnName(),
							tableColumn.getColumnName() + '：' + tableColumn.getColumnComment()));
				}
				cxTable.setS(cxColumns);
				cxSelect.add(cxTable);
			}
		}
		mmap.put("table", table);
		mmap.put("data", JSON.toJSON(cxSelect));
		return prefix + "/edit";
	}

	/**
	 * Modify and save code generation business
	 */
	@RequiresPermissions("tool:gen:edit")
	@Log(title = "Code generation", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(@Validated GenTable genTable) {
		genTableService.validateEdit(genTable);
		genTableService.updateGenTable(genTable);
		return AjaxResult.success();
	}

	@RequiresPermissions("tool:gen:remove")
	@Log(title = "Code generation", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		genTableService.deleteGenTableByIds(ids);
		return AjaxResult.success();
	}

	/**
	 * Preview code
	 */
	@RequiresPermissions("tool:gen:preview")
	@GetMapping("/preview/{tableId}")
	@ResponseBody
	public AjaxResult preview(@PathVariable("tableId") Long tableId) throws IOException {
		Map<String, String> dataMap = genTableService.previewCode(tableId);
		return AjaxResult.success(dataMap);
	}

	/**
	 * Generate code (download method)
	 */
	@RequiresPermissions("tool:gen:code")
	@Log(title = "Code generation", businessType = BusinessType.GENCODE)
	@GetMapping("/download/{tableName}")
	public void download(HttpServletResponse response, @PathVariable("tableName") String tableName) throws IOException {
		byte[] data = genTableService.downloadCode(tableName);
		genCode(response, data);
	}

	/**
	 * Generate code (custom path)
	 */
	@RequiresPermissions("tool:gen:code")
	@Log(title = "Code generation", businessType = BusinessType.GENCODE)
	@GetMapping("/genCode/{tableName}")
	@ResponseBody
	public AjaxResult genCode(@PathVariable("tableName") String tableName) {
		genTableService.generatorCode(tableName);
		return AjaxResult.success();
	}

	/**
	 * Synchronize the database
	 */
	@RequiresPermissions("tool:gen:edit")
	@Log(title = "Code generation", businessType = BusinessType.UPDATE)
	@GetMapping("/synchDb/{tableName}")
	@ResponseBody
	public AjaxResult synchDb(@PathVariable("tableName") String tableName) {
		genTableService.synchDb(tableName);
		return AjaxResult.success();
	}

	/**
	 * Batch code generation
	 */
	@RequiresPermissions("tool:gen:code")
	@Log(title = "Code generation", businessType = BusinessType.GENCODE)
	@GetMapping("/batchGenCode")
	@ResponseBody
	public void batchGenCode(HttpServletResponse response, String tables) throws IOException {
		String[] tableNames = Convert.toStrArray(tables);
		byte[] data = genTableService.downloadCode(tableNames);
		genCode(response, data);
	}

	/**
	 * Generate zip file
	 */
	private void genCode(HttpServletResponse response, byte[] data) throws IOException {
		response.reset();
		response.setHeader("Content-Disposition", "attachment; filename=\"ruoyi.zip\"");
		response.addHeader("Content-Length", "" + data.length);
		response.setContentType("application/octet-stream; charset=UTF-8");
		IOUtils.write(data, response.getOutputStream());
	}
}