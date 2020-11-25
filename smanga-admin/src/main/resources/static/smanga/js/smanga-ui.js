/**
 * General js method packaging processing
 * Copyright (c) 2020 smanga
 */

// current table related information
var table = {
    config: {},
    // Current instance configuration
    options: {},
    // Set instance configuration
    set: function (id) {
        if ($.common.getLength(table.config) > 1) {
            var tableId = $.common.isEmpty(id) ? $(event.currentTarget).parents(".bootstrap-table").find("table.table").attr("id") : id;
            if ($.common.isNotEmpty(tableId)) {
                table.options = table.get(tableId);
            }
        }
    },
    // Get instance configuration
    get: function (id) {
        return table.config[id];
    },
    // Remember to select the instance group
    rememberSelecteds: {},
    // Remember to select the ID group
    rememberSelectedIds: {}
};

(function ($) {
    $.extend({
        _tree: {},
        bttTable: {},
        // Form packaging processing
        table: {
            // Initialize table parameters
            init: function (options) {
                var defaults = {
                    id: "bootstrap-table",
                    type: 0, // 0 stands for bootstrapTable 1 stands for bootstrapTreeTable
                    method: 'post',
                    height: undefined,
                    sidePagination: "server",
                    sortName: "",
                    sortOrder: "asc",
                    pagination: true,
                    paginationLoop: false,
                    pageSize: 10,
                    pageNumber: 1,
                    pageList: [10, 25, 50],
                    toolbar: "toolbar",
                    loadingFontSize: 13,
                    striped: false,
                    escape: false,
                    firstLoad: true,
                    showFooter: false,
                    search: false,
                    showSearch: true,
                    showPageGo: false,
                    showRefresh: true,
                    showColumns: true,
                    showToggle: true,
                    showExport: false,
                    clickToSelect: false,
                    singleSelect: false,
                    mobileResponsive: true,
                    maintainSelected: false,
                    rememberSelected: false,
                    fixedColumns: false,
                    fixedNumber: 0,
                    fixedRightNumber: 0,
                    queryParams: $.table.queryParams,
                    rowStyle: {},
                };
                var options = $.extend(defaults, options);
                table.options = options;
                table.config[options.id] = options;
                $.table.initEvent();
                $('#' + options.id).bootstrapTable({
                    id: options.id,
                    url: options.url,                                   // Request backend URL (*）
                    contentType: "application/x-www-form-urlencoded",   // Encoding type
                    method: options.method,                             // Request method (*）
                    cache: false,                                       // Whether to use cache
                    height: options.height,                             // Table height
                    striped: options.striped,                           // Whether to display line spacing color
                    sortable: true,                                     // Whether to enable sorting
                    sortStable: true,                                   // Set to true to get stable sorting
                    sortName: options.sortName,                         // Sort column name
                    sortOrder: options.sortOrder,                       // Sort by asc or desc
                    pagination: options.pagination,                     // Whether to show page break (*)
                    paginationLoop: options.paginationLoop,             // Whether to enable the infinite loop of the paging bar
                    pageNumber: 1,                                      // Initially load the first page, the default first page
                    pageSize: options.pageSize,                         // Number of records per page (*)
                    pageList: options.pageList,                         // Number of rows per page available for selection (*)
                    firstLoad: options.firstLoad,                       // Whether to request to load data for the first time, you can configure false for larger data
                    escape: options.escape,                             // Escape HTML string
                    showFooter: options.showFooter,                     // Whether to show the footer
                    iconSize: 'outline',                                // Icon size: undefined default button size xs super small button sm small button lg large button
                    toolbar: '#' + options.toolbar,                     // Designated work bar
                    loadingFontSize: options.loadingFontSize,           // Customize the font size of the loaded text
                    sidePagination: options.sidePagination,             // Server enables server paging client client paging
                    search: options.search,                             // Whether to show the search box function
                    searchText: options.searchText,                     // The initial display content of the search box, which is empty by default
                    showSearch: options.showSearch,                     // Whether to display search information
                    showPageGo: options.showPageGo,                     // Whether to display the jump page
                    showRefresh: options.showRefresh,                   // Whether to show the refresh button
                    showColumns: options.showColumns,                   // Whether to show or hide a column of drop-down boxes
                    showToggle: options.showToggle,                     // Whether to display the switch button between detailed view and list view
                    showExport: options.showExport,                     // Whether to support export files
                    showHeader: options.showHeader,                     // Whether to show header
                    showFullscreen: options.showFullscreen,             // Whether to show the full screen button
                    uniqueId: options.uniqueId,                         // Unique identifier
                    clickToSelect: options.clickToSelect,               // Whether to enable click to select rows
                    singleSelect: options.singleSelect,                 // Whether to single checkbox
                    mobileResponsive: options.mobileResponsive,         // Whether to support mobile terminal adaptation
                    cardView: options.cardView,                         // Whether to enable the display card view
                    detailView: options.detailView,                     // Whether to enable the detail view
                    onCheck: options.onCheck,                           // Triggered when this row is selected
                    onUncheck: options.onUncheck,                       // Triggered when this line is cancelled
                    onCheckAll: options.onCheckAll,                     // Triggered when all rows are selected
                    onUncheckAll: options.onUncheckAll,                 // Triggered when all rows are unselected
                    onClickRow: options.onClickRow,                     // Event triggered by clicking on a row
                    onDblClickRow: options.onDblClickRow,               // Double-click a row to trigger an event
                    onClickCell: options.onClickCell,                   // Event triggered by clicking on a cell
                    onDblClickCell: options.onDblClickCell,             // Events triggered by double-clicking a certain cell
                    onEditableSave: options.onEditableSave,             // Edit saved events in line
                    onExpandRow: options.onExpandRow,                   // Click the event of the detailed view
                    maintainSelected: options.maintainSelected,         // Keep the selected row when flipping the front end
                    rememberSelected: options.rememberSelected,         // Enable page turning to remember previous choices
                    fixedColumns: options.fixedColumns,                 // Whether to enable the freeze column (left side)
                    fixedNumber: options.fixedNumber,                   // Number of columns frozen (left side)
                    fixedRightNumber: options.fixedRightNumber,         // Number of columns frozen (right side)
                    onReorderRow: options.onReorderRow,                 // Processing function when dragging is over
                    queryParams: options.queryParams,                   // Pass parameters (*)
                    rowStyle: options.rowStyle,                         // Set line styles through custom functions
                    footerStyle: options.footerStyle,                   // Set footer style through custom function
                    headerStyle: options.headerStyle,                   // Set heading style by custom function
                    columns: options.columns,                           // Display column information (*)
                    data: options.data,                                 // Data being loaded
                    responseHandler: $.table.responseHandler,           // Process the function before loading the data sent by the server
                    onLoadSuccess: $.table.onLoadSuccess,               // Trigger processing function when all data is loaded
                    exportOptions: options.exportOptions,               // Front-end export ignores column index
                    detailFormatter: options.detailFormatter,           // Show a list of other data below the row
                });
            },
            // Get the instance ID, If there are multiple return #id1, #id2 delimeter separators
            getOptionsIds: function (separator) {
                var _separator = $.common.isEmpty(separator) ? "," : separator;
                var optionsIds = "";
                $.each(table.config, function (key, value) {
                    optionsIds += "#" + key + _separator;
                });
                return optionsIds.substring(0, optionsIds.length - 1);
            },
            // Query conditions
            queryParams: function (params) {
                var curParams = {
                    // Pass parameter query parameters
                    pageSize: params.limit,
                    pageNum: params.offset / params.limit + 1,
                    searchValue: params.search,
                    orderByColumn: params.sort,
                    isAsc: params.order
                };
                var currentId = $.common.isEmpty(table.options.formId) ? $('form').attr('id') : table.options.formId;
                return $.extend(curParams, $.common.formToJSON(currentId));
            },
            // Processing callback function after requesting to obtain data
            responseHandler: function (res) {
                if (typeof table.get(this.id).responseHandler == "function") {
                    table.get(this.id).responseHandler(res);
                }
                if (res.code == 0) {
                    if ($.common.isNotEmpty(table.options.sidePagination) && table.options.sidePagination == 'client') {
                        return res.rows;
                    } else {
                        if ($.common.isNotEmpty(table.options.rememberSelected) && table.options.rememberSelected) {
                            var column = $.common.isEmpty(table.options.uniqueId) ? table.options.columns[1].field : table.options.uniqueId;
                            $.each(res.rows, function (i, row) {
                                row.state = $.inArray(row[column], table.rememberSelectedIds[table.options.id]) !== -1;
                            })
                        }
                        return { rows: res.rows, total: res.total };
                    }
                } else {
                    $.modal.alertWarning(res.msg);
                    return { rows: [], total: 0 };
                }
            },
            // Initialization event
            initEvent: function () {
                // Instance ID information
                var optionsIds = $.table.getOptionsIds();
                // Monitor event processing
                $(optionsIds).on(TABLE_EVENTS, function () {
                    table.set($(this).attr("id"));
                });
                // Triggered after the table body is rendered and visible in the DOM (event)
                $(optionsIds).on("post-body.bs.table", function (e, args) {
                    // Floating prompt box special effects
                    $(".table [data-toggle='tooltip']").tooltip();
                });
                // select, cancel, select all, cancel all (event)
                $(optionsIds).on("check.bs.table check-all.bs.table uncheck.bs.table uncheck-all.bs.table", function (e, rowsAfter, rowsBefore) {
                    // The checkbox paging keeps the selected array
                    var rows = $.common.equals("uncheck-all", e.type) ? rowsBefore : rowsAfter;
                    var rowIds = $.table.affectedRowIds(rows);
                    if ($.common.isNotEmpty(table.options.rememberSelected) && table.options.rememberSelected) {
                        func = $.inArray(e.type, ['check', 'check-all']) > -1 ? 'union' : 'difference';
                        var selectedIds = table.rememberSelectedIds[table.options.id];
                        if ($.common.isNotEmpty(selectedIds)) {
                            table.rememberSelectedIds[table.options.id] = _[func](selectedIds, rowIds);
                        } else {
                            table.rememberSelectedIds[table.options.id] = _[func]([], rowIds);
                        }
                        var selectedRows = table.rememberSelecteds[table.options.id];
                        if ($.common.isNotEmpty(selectedRows)) {
                            table.rememberSelecteds[table.options.id] = _[func](selectedRows, rows);
                        } else {
                            table.rememberSelecteds[table.options.id] = _[func]([], rows);
                        }
                    }
                });
                // Load successfully, select, cancel, select all, cancel all (event)
                $(optionsIds).on("check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table load-success.bs.table", function () {
                    var toolbar = table.options.toolbar;
                    var uniqueId = table.options.uniqueId;
                    // Toolbar button control
                    var rows = $.common.isEmpty(uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns(uniqueId);
                    // not multiple disabled
                    $('#' + toolbar + '.multiple').toggleClass('disabled', !rows.length);
                    // not individually disabled
                    $('#' + toolbar + '.single').toggleClass('disabled', rows.length != 1);
                });
                // Picture preview event
                $(optionsIds).off("click").on("click", '.img-circle', function () {
                    var src = $(this).attr('src');
                    var target = $(this).data('target');
                    if ($.common.equals("self", target)) {
                        var height = $(this).data('height');
                        var width = $(this).data('width');
                        // If it is a mobile terminal, use adaptive size popup
                        if ($.common.isMobile()) {
                            width = 'auto';
                            height = 'auto';
                        }
                        layer.open({
                            title: false,
                            type: 1,
                            closeBtn: true,
                            shadeClose: true,
                            area: ['auto', 'auto'],
                            content: "<img src='" + src + "' height='" + height + "' width='" + width + "'/>"
                        });
                    } else if ($.common.equals("blank", target)) {
                        window.open(src);
                    }
                });
                // Click the tooltip event
                $(optionsIds).on("click", '.tooltip-show', function () {
                    var target = $(this).data('target');
                    var input = $(this).prev();
                    if ($.common.equals("copy", target)) {
                        input.select();
                        document.execCommand("copy");
                    } else if ($.common.equals("open", target)) {
                        parent.layer.alert(input.val(), {
                            title: "Information Content",
                            shadeClose: true,
                            btn: ['Confirm'],
                            btnclass: ['btn btn-primary'],
                        });
                    }
                });
            },
            // Triggered when all data is loaded
            onLoadSuccess: function (data) {
                if (typeof table.options.onLoadSuccess == "function") {
                    table.options.onLoadSuccess(data);
                }
            },
            // Form destruction
            destroy: function (tableId) {
                var currentId = $.common.isEmpty(tableId) ? table.options.id : tableId;
                $("#" + currentId).bootstrapTable('destroy');
            },
            // Serial number generation
            serialNumber: function (index, tableId) {
                var currentId = $.common.isEmpty(tableId) ? table.options.id : tableId;
                var tableParams = $("#" + currentId).bootstrapTable('getOptions');
                var pageSize = $.common.isNotEmpty(tableParams.pageSize) ? tableParams.pageSize : table.options.pageSize;
                var pageNumber = $.common.isNotEmpty(tableParams.pageNumber) ? tableParams.pageNumber : table.options.pageNumber;
                return pageSize * (pageNumber - 1) + index + 1;
            },
            // The column exceeds the specified length floating prompt target (copy click to copy the text open pop-up window to open the text)
            tooltip: function (value, length, target) {
                var _length = $.common.isEmpty(length) ? 20 : length;
                var _text = "";
                var _value = $.common.nullToStr(value);
                var _target = $.common.isEmpty(target) ? 'copy' : target;
                if (_value.length > _length) {
                    _text = _value.substr(0, _length) + "...";
                    _value = _value.replace(/\'/g, "&apos;");
                    _value = _value.replace(/\"/g, "&quot;");
                    var actions = [];
                    actions.push($.common.sprintf('<input style="opacity: 0;position: absolute;width:5px;z-index:-1" type="text" value="%s"/>', _value));
                    actions.push($.common.sprintf('<a href="###" class="tooltip-show" data-toggle="tooltip" data-target="%s" title="%s">%s</a>', _target, _value, _text));
                    return actions.join('');
                } else {
                    _text = _value;
                    return _text;
                }
            },
            // drop down button switch
            dropdownToggle: function (value) {
                var actions = [];
                actions.push('<div class="btn-group">');
                actions.push('<button type="button" class="btn btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">');
                actions.push('<i class="fa fa-cog"></i>&nbsp;<span class="fa fa-chevron-down"></span></button>');
                actions.push('<ul class="dropdown-menu">');
                actions.push(value.replace(/<a/g, "<li><a").replace(/<\/a>/g, "</a></li>"));
                actions.push('</ul>');
                actions.push('</div>');
                return actions.join('');
            },
            // Picture Preview
            imageView: function (value, height, width, target) {
                if ($.common.isEmpty(width)) {
                    width = 'auto';
                }
                if ($.common.isEmpty(height)) {
                    height = 'auto';
                }
                // blank or self
                var _target = $.common.isEmpty(target) ? 'self' : target;
                if ($.common.isNotEmpty(value)) {
                    return $.common.sprintf("<img class='img-circle img-xs' data-height='%s' data-width='%s' data-target='%s' src='%s'/>", height, width, _target, value);
                } else {
                    return $.common.nullToStr(value);
                }
            },
            // Search-default first form
            search: function (formId, tableId) {
                table.set(tableId);
                table.options.formId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
                var params = $.common.isEmpty(tableId) ? $("#" + table.options.id).bootstrapTable('getOptions') : $("#" + tableId).bootstrapTable('getOptions');
                if ($.common.isNotEmpty(tableId)) {
                    $("#" + tableId).bootstrapTable('refresh', params);
                } else {
                    $("#" + table.options.id).bootstrapTable('refresh', params);
                }
            },
            // export data
            exportExcel: function (formId) {
                table.set();
                $.modal.confirm("Are you sure to export all " + table.options.modalName + "?", function () {
                    var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
                    var params = $("#" + table.options.id).bootstrapTable('getOptions');
                    var dataParam = $("#" + currentId).serializeArray();
                    dataParam.push({ "name": "orderByColumn", "value": params.sortName });
                    dataParam.push({ "name": "isAsc", "value": params.sortOrder });
                    $.modal.loading("Exporting data, please wait...");
                    $.post(table.options.exportUrl, dataParam, function (result) {
                        if (result.code == web_status.SUCCESS) {
                            window.location.href = ctx + "common/download?fileName=" + encodeURI(result.msg) + "&delete=" + true;
                        } else if (result.code == web_status.WARNING) {
                            $.modal.alertWarning(result.msg)
                        } else {
                            $.modal.alertError(result.msg);
                        }
                        $.modal.closeLoading();
                    });
                });
            },
            // Download template
            importTemplate: function () {
                table.set();
                $.get(table.options.importTemplateUrl, function (result) {
                    if (result.code == web_status.SUCCESS) {
                        window.location.href = ctx + "common/download?fileName=" + encodeURI(result.msg) + "&delete=" + true;
                    } else if (result.code == web_status.WARNING) {
                        $.modal.alertWarning(result.msg)
                    } else {
                        $.modal.alertError(result.msg);
                    }
                });
            },
            // Import Data
            importExcel: function (formId, width, height) {
                table.set();
                var currentId = $.common.isEmpty(formId) ? 'importTpl' : formId;
                var _width = $.common.isEmpty(width) ? "400" : width;
                var _height = $.common.isEmpty(height) ? "230" : height;
                layer.open({
                    type: 1,
                    area: [_width + 'px', _height + 'px'],
                    fix: false,
                    //Not fixed
                    maxmin: true,
                    shade: 0.3,
                    title: 'Import ' + table.options.modalName + ' data',
                    content: $('#' + currentId).html(),
                    btn: ['<i class="fa fa-check"></i> import', '<i class="fa fa-remove"></i> cancel'],
                    // The area outside the bomb layer is closed
                    shadeClose: true,
                    btn1: function (index, layero) {
                        var file = layero.find('#file').val();
                        if (file == '' || (!$.common.endWith(file, '.xls') && !$.common.endWith(file, '.xlsx'))) {
                            $.modal.msgWarning("Please select the suffix as “xls” or “xlsx” document.");
                            return false;
                        }
                        var index = layer.load(2, { shade: false });
                        $.modal.disable();
                        var formData = new FormData(layero.find('form')[0]);
                        $.ajax({
                            url: table.options.importUrl,
                            data: formData,
                            cache: false,
                            contentType: false,
                            processData: false,
                            type: 'POST',
                            success: function (result) {
                                if (result.code == web_status.SUCCESS) {
                                    $.modal.closeAll();
                                    $.modal.alertSuccess(result.msg);
                                    $.table.refresh();
                                } else if (result.code == web_status.WARNING) {
                                    layer.close(index);
                                    $.modal.enable();
                                    $.modal.alertWarning(result.msg)
                                } else {
                                    layer.close(index);
                                    $.modal.enable();
                                    $.modal.alertError(result.msg);
                                }
                            }
                        });
                    }
                });
            },
            // refresh the table
            refresh: function (tableId) {
                var currentId = $.common.isEmpty(tableId) ? table.options.id : tableId;
                $("#" + currentId).bootstrapTable('refresh', {
                    silent: true
                });
            },
            // Query table specified column value
            selectColumns: function (column) {
                var rows = $.map($("#" + table.options.id).bootstrapTable('getSelections'), function (row) {
                    return $.common.getItemField(row, column);
                });
                if ($.common.isNotEmpty(table.options.rememberSelected) && table.options.rememberSelected) {
                    var selectedRows = table.rememberSelecteds[table.options.id];
                    if ($.common.isNotEmpty(selectedRows)) {
                        rows = $.map(table.rememberSelecteds[table.options.id], function (row) {
                            return $.common.getItemField(row, column);
                        });
                    }
                }
                return $.common.uniqueFn(rows);
            },
            // Get the selected or canceled row ID of the current page
            affectedRowIds: function (rows) {
                var column = $.common.isEmpty(table.options.uniqueId) ? table.options.columns[1].field : table.options.uniqueId;
                var rowIds;
                if ($.isArray(rows)) {
                    rowIds = $.map(rows, function (row) {
                        return $.common.getItemField(row, column);
                    });
                } else {
                    rowIds = [rows[column]];
                }
                return rowIds;
            },
            // Query the first column value of the table
            selectFirstColumns: function () {
                var rows = $.map($("#" + table.options.id).bootstrapTable('getSelections'), function (row) {
                    return $.common.getItemField(row, table.options.columns[1].field);
                });
                if ($.common.isNotEmpty(table.options.rememberSelected) && table.options.rememberSelected) {
                    var selectedRows = table.rememberSelecteds[table.options.id];
                    if ($.common.isNotEmpty(selectedRows)) {
                        rows = $.map(selectedRows, function (row) {
                            return $.common.getItemField(row, table.options.columns[1].field);
                        });
                    }
                }
                return $.common.uniqueFn(rows);
            },
            // Echo the data dictionary
            selectDictLabel: function (datas, value) {
                var actions = [];
                $.each(datas, function (index, dict) {
                    if (dict.dictValue == ('' + value)) {
                        var listClass = $.common.equals("default", dict.listClass) || $.common.isEmpty(dict.listClass) ? "" : "badge badge-" + dict.listClass;
                        actions.push($.common.sprintf("<span class='%s'>%s</span>", listClass, dict.dictLabel));
                        return false;
                    }
                });
                return actions.join('');
            },
            // Echo the data dictionary (string array)
            selectDictLabels: function (datas, value, separator) {
                if ($.common.isEmpty(value)) {
                    return '';
                }
                var currentSeparator = $.common.isEmpty(separator) ? "," : separator;
                var actions = [];
                $.each(value.split(currentSeparator), function (i, val) {
                    $.each(datas, function (index, dict) {
                        if (dict.dictValue == ('' + val)) {
                            var listClass = $.common.equals("default", dict.listClass) || $.common.isEmpty(dict.listClass) ? "" : "badge badge-" + dict.listClass;
                            actions.push($.common.sprintf("<span class='%s'>%s </span>", listClass, dict.dictLabel));
                            return false;
                        }
                    });
                });
                return actions.join('');
            },
            // Display the specified column of the table
            showColumn: function (column, tableId) {
                var currentId = $.common.isEmpty(tableId) ? table.options.id : tableId;
                $("#" + currentId).bootstrapTable('showColumn', column);
            },
            // Hide the specified column of the table
            hideColumn: function (column, tableId) {
                var currentId = $.common.isEmpty(tableId) ? table.options.id : tableId;
                $("#" + currentId).bootstrapTable('hideColumn', column);
            },
            // Show all table columns
            showAllColumns: function (tableId) {
                var currentId = $.common.isEmpty(tableId) ? table.options.id : tableId;
                $("#" + currentId).bootstrapTable('showAllColumns');
            },
            // hide all table columns
            hideAllColumns: function (tableId) {
                var currentId = $.common.isEmpty(tableId) ? table.options.id : tableId;
                $("#" + currentId).bootstrapTable('hideAllColumns');
            }
        },
        // Table tree packaging processing
        treeTable: {
            // Initialize the table
            init: function (options) {
                var defaults = {
                    id: "bootstrap-tree-table",
                    type: 1, // 0 stands for bootstrapTable 1 stands for bootstrapTreeTable
                    height: 0,
                    rootIdValue: null,
                    ajaxParams: {},
                    toolbar: "toolbar",
                    striped: false,
                    expandColumn: 1,
                    showSearch: true,
                    showRefresh: true,
                    showColumns: true,
                    expandAll: true,
                    expandFirst: true
                };
                var options = $.extend(defaults, options);
                table.options = options;
                table.config[options.id] = options;
                $.table.initEvent();
                $.bttTable = $('#' + options.id).bootstrapTreeTable({
                    code: options.code,                                 // Used to set the parent-child relationship
                    parentCode: options.parentCode,                     // Used to set the parent-child relationship
                    type: 'post',                                       // Request method (*)
                    url: options.url,                                   // Request backend URL (*)
                    data: options.data,                                 // Data used for rendering when there is no url
                    ajaxParams: options.ajaxParams,                     // The data attribute of ajax requesting data
                    rootIdValue: options.rootIdValue,                   // Set the id value of the specified root node
                    height: options.height,                             // Height of table tree
                    expandColumn: options.expandColumn,                 // On which column to display the expand button
                    striped: options.striped,                           // Whether to display line spacing color
                    bordered: false,                                    // Whether to show border
                    toolbar: '#' + options.toolbar,                     // Designated work bar
                    showSearch: options.showSearch,                     // Whether to display search information
                    showRefresh: options.showRefresh,                   // Whether to show the refresh button
                    showColumns: options.showColumns,                   // Whether to show or hide a column of drop-down boxes
                    expandAll: options.expandAll,                       // Whether to expand all
                    expandFirst: options.expandFirst,                   // Whether to expand the first level by default - take effect when expandAll is false
                    columns: options.columns,                           // Display column information (*)
                    responseHandler: $.treeTable.responseHandler,       // Process the function before loading the data sent by the server
                    onLoadSuccess: $.table.onLoadSuccess                // Trigger processing function when all data is loaded
                });
            },
            // Condition query
            search: function (formId) {
                var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
                var params = $.common.formToJSON(currentId);
                $.bttTable.bootstrapTreeTable('refresh', params);
            },
            // refresh
            refresh: function () {
                $.bttTable.bootstrapTreeTable('refresh');
            },
            // Query the specified column value of the table tree
            selectColumns: function (column) {
                var rows = $.map($.bttTable.bootstrapTreeTable('getSelections'), function (row) {
                    return $.common.getItemField(row, column);
                });
                return $.common.uniqueFn(rows);
            },
            // Process the callback function after requesting to obtain the data, and verify the abnormal state remind
            responseHandler: function (res) {
                if (typeof table.options.responseHandler == "function") {
                    table.options.responseHandler(res);
                }
                if (res.code != undefined && res.code != 0) {
                    $.modal.alertWarning(res.msg);
                    return [];
                } else {
                    return res;
                }
            },
        },

        // Form package processing
        form: {
            // form reset
            reset: function (formId, tableId) {
                table.set(tableId);
                var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
                $("#" + currentId)[0].reset();
                if (table.options.type == table_type.bootstrapTable) {
                    if ($.common.isEmpty(tableId)) {
                        $("#" + table.options.id).bootstrapTable('refresh');
                    } else {
                        $("#" + tableId).bootstrapTable('refresh');
                    }
                } else if (table.options.type == table_type.bootstrapTreeTable) {
                    if ($.common.isEmpty(tableId)) {
                        $("#" + table.options.id).bootstrapTreeTable('refresh', []);
                    } else {
                        $("#" + tableId).bootstrapTreeTable('refresh', []);
                    }
                }
            },
            // Get the selected checkbox item
            selectCheckeds: function (name) {
                var checkeds = "";
                $('input:checkbox[name="' + name + '"]:checked').each(function (i) {
                    if (0 == i) {
                        checkeds = $(this).val();
                    } else {
                        checkeds += ("," + $(this).val());
                    }
                });
                return checkeds;
            },
            // Get the selected drop-down box item
            selectSelects: function (name) {
                var selects = "";
                $('#' + name + 'option:selected').each(function (i) {
                    if (0 == i) {
                        selects = $(this).val();
                    } else {
                        selects += ("," + $(this).val());
                    }
                });
                return selects;
            }
        },
        // Pop-up layer packaging processing
        modal: {
            // Show icon
            icon: function (type) {
                var icon = "";
                if (type == modal_status.WARNING) {
                    icon = 0;
                } else if (type == modal_status.SUCCESS) {
                    icon = 1;
                } else if (type == modal_status.FAIL) {
                    icon = 2;
                } else {
                    icon = 3;
                }
                return icon;
            },
            // notification
            msg: function (content, type) {
                if (type != undefined) {
                    layer.msg(content, { icon: $.modal.icon(type), time: 1000, shift: 5 });
                } else {
                    layer.msg(content);
                }
            },
            // wrong information
            msgError: function (content) {
                $.modal.msg(content, modal_status.FAIL);
            },
            // success message
            msgSuccess: function (content) {
                $.modal.msg(content, modal_status.SUCCESS);
            },
            // warning message
            msgWarning: function (content) {
                $.modal.msg(content, modal_status.WARNING);
            },
            // Pop up prompt
            alert: function (content, type) {
                layer.alert(content, {
                    icon: $.modal.icon(type),
                    title: "System Tips",
                    btn: ['Confirm'],
                    btnclass: ['btn btn-primary'],
                });
            },
            // Message prompt and refresh the parent form
            msgReload: function (msg, type) {
                layer.msg(msg, {
                    icon: $.modal.icon(type),
                    time: 500,
                    shade: [0.1, '#8F8F8F']
                },
                    function () {
                        $.modal.reload();
                    });
            },
            // Error message
            alertError: function (content) {
                $.modal.alert(content, modal_status.FAIL);
            },
            // success prompt
            alertSuccess: function (content) {
                $.modal.alert(content, modal_status.SUCCESS);
            },
            // Warning prompt
            alertWarning: function (content) {
                $.modal.alert(content, modal_status.WARNING);
            },
            // close the form
            close: function (index) {
                if ($.common.isEmpty(index)) {
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                } else {
                    layer.close(index);
                }
            },
            // Close all forms
            closeAll: function () {
                layer.closeAll();
            },
            // Confirmation form
            confirm: function (content, callBack) {
                layer.confirm(content, {
                    icon: 3,
                    title: "System Tips",
                    btn: ['Confirm', 'Cancel']
                }, function (index) {
                    layer.close(index);
                    callBack(true);
                });
            },
            // Specify the width of the pop-up layer
            open: function (title, url, width, height, callback) {
                //If it is a mobile terminal, use adaptive size pop-up window
                if ($.common.isMobile()) {
                    width = 'auto';
                    height = 'auto';
                }
                if ($.common.isEmpty(title)) {
                    title = false;
                }
                if ($.common.isEmpty(url)) {
                    url = "/404.html";
                }
                if ($.common.isEmpty(width)) {
                    width = 800;
                }
                if ($.common.isEmpty(height)) {
                    height = ($(window).height() - 50);
                }
                if ($.common.isEmpty(callback)) {
                    callback = function (index, layero) {
                        var iframeWin = layero.find('iframe')[0];
                        iframeWin.contentWindow.submitHandler(index, layero);
                    }
                }
                layer.open({
                    type: 2,
                    area: [width + 'px', height + 'px'],
                    fix: false,
                    // Not fixed
                    maxmin: true,
                    shade: 0.3,
                    title: title,
                    content: url,
                    btn: ['OK', 'Close'],
                    // The area outside the bomb layer is closed
                    shadeClose: true,
                    yes: callback,
                    cancel: function (index) {
                        return true;
                    }
                });
            },
            // Pop-up layer specifies parameter options
            openOptions: function (options) {
                var _url = $.common.isEmpty(options.url) ? "/404.html" : options.url;
                var _title = $.common.isEmpty(options.title) ? "System Window" : options.title;
                var _width = $.common.isEmpty(options.width) ? "800" : options.width;
                var _height = $.common.isEmpty(options.height) ? ($(window).height() - 50) : options.height;
                var _btn = ['<i class="fa fa-check"></i> Confirm', '<i class="fa fa-close"></i> Close'];
                if ($.common.isEmpty(options.yes)) {
                    options.yes = function (index, layero) {
                        options.callBack(index, layero);
                    }
                }
                var btnCallback = {};
                if (options.btn instanceof Array) {
                    for (var i = 1, len = options.btn.length; i < len; i++) {
                        var btn = options["btn" + (i + 1)];
                        if (btn) {
                            btnCallback["btn" + (i + 1)] = btn;
                        }
                    }
                }
                var index = layer.open($.extend({
                    type: 2,
                    maxmin: $.common.isEmpty(options.maxmin) ? true : options.maxmin,
                    shade: 0.3,
                    title: _title,
                    fix: false,
                    area: [_width + 'px', _height + 'px'],
                    content: _url,
                    shadeClose: $.common.isEmpty(options.shadeClose) ? true : options.shadeClose,
                    skin: options.skin,
                    btn: $.common.isEmpty(options.btn) ? _btn : options.btn,
                    yes: options.yes,
                    cancel: function () {
                        return true;
                    }
                }, btnCallback));
                if ($.common.isNotEmpty(options.full) && options.full === true) {
                    layer.full(index);
                }
            },
            // Pop-up layer full screen
            openFull: function (title, url, width, height) {
                //If it is a mobile terminal, use adaptive size pop-up window
                if ($.common.isMobile()) {
                    width = 'auto';
                    height = 'auto';
                }
                if ($.common.isEmpty(title)) {
                    title = false;
                }
                if ($.common.isEmpty(url)) {
                    url = "/404.html";
                }
                if ($.common.isEmpty(width)) {
                    width = 800;
                }
                if ($.common.isEmpty(height)) {
                    height = ($(window).height() - 50);
                }
                var index = layer.open({
                    type: 2,
                    area: [width + 'px', height + 'px'],
                    fix: false,
                    // Not fixed
                    maxmin: true,
                    shade: 0.3,
                    title: title,
                    content: url,
                    btn: ['OK', 'Close'],
                    // The area outside the bomb layer is closed
                    shadeClose: true,
                    yes: function (index, layero) {
                        var iframeWin = layero.find('iframe')[0];
                        iframeWin.contentWindow.submitHandler(index, layero);
                    },
                    cancel: function (index) {
                        return true;
                    }
                });
                layer.full(index);
            },
            // Open by selecting card page
            openTab: function (title, url) {
                createMenuItem(url, title);
            },
            // Open the same tab on the tab page
            parentTab: function (title, url) {
                var dataId = window.frameElement.getAttribute('data-id');
                createMenuItem(url, title);
                closeItem(dataId);
            },
            // Close tab
            closeTab: function (dataId) {
                closeItem(dataId);
            },
            // Disable button
            disable: function () {
                var doc = window.top == window.parent ? window.document : window.parent.document;
                $("a[class*=layui-layer-btn]", doc).addClass("layer-disabled");
            },
            // Enable button
            enable: function () {
                var doc = window.top == window.parent ? window.document : window.parent.document;
                $("a[class*=layui-layer-btn]", doc).removeClass("layer-disabled");
            },
            // Open the mask layer
            loading: function (message) {
                $.blockUI({ message: '<div class="loaderbox"><div class="loading-activity"></div> ' + message + '</div>' });
            },
            // Close the mask layer
            closeLoading: function () {
                setTimeout(function () {
                    $.unblockUI();
                }, 50);
            },
            // Reload
            reload: function () {
                parent.location.reload();
            }
        },
        // Operation package processing
        operate: {
            // submit data
            submit: function (url, type, dataType, data, callback) {
                var config = {
                    url: url,
                    type: type,
                    dataType: dataType,
                    data: data,
                    beforeSend: function () {
                        $.modal.loading("Processing, please wait...");
                    },
                    success: function (result) {
                        if (typeof callback == "function") {
                            callback(result);
                        }
                        $.operate.ajaxSuccess(result);
                    }
                };
                $.ajax(config)
            },
            // post request transmission
            post: function (url, data, callback) {
                $.operate.submit(url, "post", "json", data, callback);
            },
            // get request transmission
            get: function (url, callback) {
                $.operate.submit(url, "get", "json", "", callback);
            },
            // details
            detail: function (id, width, height) {
                table.set();
                var _url = $.operate.detailUrl(id);
                var _width = $.common.isEmpty(width) ? "800" : width;
                var _height = $.common.isEmpty(height) ? ($(window).height() - 50) : height;
                //If it is a mobile terminal, use adaptive size pop-up window
                if ($.common.isMobile()) {
                    _width = 'auto';
                    _height = 'auto';
                }
                var options = {
                    title: table.options.modalName + " detail",
                    width: _width,
                    height: _height,
                    url: _url,
                    skin: 'layui-layer-gray',
                    btn: ['Close'],
                    yes: function (index, layero) {
                        layer.close(index);
                    }
                };
                $.modal.openOptions(options);
            },
            // Detailed access address
            detailUrl: function (id) {
                var url = "/404.html";
                if ($.common.isNotEmpty(id)) {
                    url = table.options.detailUrl.replace("{id}", id);
                } else {
                    var id = $.common.isEmpty(table.options.uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns(table.options.uniqueId);
                    if (id.length == 0) {
                        $.modal.alertWarning("Please select at least one record");
                        return;
                    }
                    url = table.options.detailUrl.replace("{id}", id);
                }
                return url;
            },
            // delete message
            remove: function (id) {
                table.set();
                $.modal.confirm("Are you sure to delete this item " + table.options.modalName + " information?", function () {
                    var url = $.common.isEmpty(id) ? table.options.removeUrl : table.options.removeUrl.replace("{id}", id);
                    if (table.options.type == table_type.bootstrapTreeTable) {
                        $.operate.get(url);
                    } else {
                        var data = { "ids": id };
                        $.operate.submit(url, "post", "json", data);
                    }
                });
            },
            // Batch delete information
            removeAll: function () {
                table.set();
                var rows = $.common.isEmpty(table.options.uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns(table.options.uniqueId);
                if (rows.length == 0) {
                    $.modal.alertWarning("Please select at least one record");
                    return;
                }
                $.modal.confirm("Are you sure you want to delete the selected " + rows.length + " data?", function () {
                    var url = table.options.removeUrl;
                    var data = { "ids": rows.join() };
                    $.operate.submit(url, "post", "json", data);
                });
            },
            // Clear information
            clean: function () {
                table.set();
                $.modal.confirm("Are you sure to clear all " + table.options.modalName + "?", function () {
                    var url = table.options.cleanUrl;
                    $.operate.submit(url, "post", "json", "");
                });
            },
            // add information
            add: function (id) {
                table.set();
                $.modal.open("Add " + table.options.modalName, $.operate.addUrl(id));
            },
            // Add information and display it in tab page
            addTab: function (id) {
                table.set();
                $.modal.openTab("Add " + table.options.modalName, $.operate.addUrl(id));
            },
            // add information full screen
            addFull: function (id) {
                table.set();
                var url = $.common.isEmpty(id) ? table.options.createUrl : table.options.createUrl.replace("{id}", id);
                $.modal.openFull("Add" + table.options.modalName, url);
            },
            // Add access address
            addUrl: function (id) {
                var url = $.common.isEmpty(id) ? table.options.createUrl.replace("{id}", "") : table.options.createUrl.replace("{id}", id);
                return url;
            },
            // Modify information
            edit: function (id) {
                table.set();
                if ($.common.isEmpty(id) && table.options.type == table_type.bootstrapTreeTable) {
                    var row = $("#" + table.options.id).bootstrapTreeTable('getSelections')[0];
                    if ($.common.isEmpty(row)) {
                        $.modal.alertWarning("Please select at least one record");
                        return;
                    }
                    var url = table.options.updateUrl.replace("{id}", row[table.options.uniqueId]);
                    $.modal.open("Modify " + table.options.modalName, url);
                } else {
                    $.modal.open("Modify " + table.options.modalName, $.operate.editUrl(id));
                }
            },
            // Modify information and display it in tab page
            editTab: function (id) {
                table.set();
                $.modal.openTab("Modify " + table.options.modalName, $.operate.editUrl(id));
            },
            // modify information full screen
            editFull: function (id) {
                table.set();
                var url = "/404.html";
                if ($.common.isNotEmpty(id)) {
                    url = table.options.updateUrl.replace("{id}", id);
                } else {
                    if (table.options.type == table_type.bootstrapTreeTable) {
                        var row = $("#" + table.options.id).bootstrapTreeTable('getSelections')[0];
                        if ($.common.isEmpty(row)) {
                            $.modal.alertWarning("Please select at least one record");
                            return;
                        }
                        url = table.options.updateUrl.replace("{id}", row[table.options.uniqueId]);
                    } else {
                        var row = $.common.isEmpty(table.options.uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns(table.options.uniqueId);
                        url = table.options.updateUrl.replace("{id}", row);
                    }
                }
                $.modal.openFull("Modify " + table.options.modalName, url);
            },
            // modify access address
            editUrl: function (id) {
                var url = "/404.html";
                if ($.common.isNotEmpty(id)) {
                    url = table.options.updateUrl.replace("{id}", id);
                } else {
                    var id = $.common.isEmpty(table.options.uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns(table.options.uniqueId);
                    if (id.length == 0) {
                        $.modal.alertWarning("Please select at least one record");
                        return;
                    }
                    url = table.options.updateUrl.replace("{id}", id);
                }
                return url;
            },
            // save information refresh table
            save: function (url, data, callback) {
                var config = {
                    url: url,
                    type: "post",
                    dataType: "json",
                    data: data,
                    beforeSend: function () {
                        $.modal.loading("Processing, please wait...");
                        $.modal.disable();
                    },
                    success: function (result) {
                        if (typeof callback == "function") {
                            callback(result);
                        }
                        $.operate.successCallback(result);
                    }
                };
                $.ajax(config)
            },
            // Save information, pop up a prompt box
            saveModal: function (url, data, callback) {
                var config = {
                    url: url,
                    type: "post",
                    dataType: "json",
                    data: data,
                    beforeSend: function () {
                        $.modal.loading("Processing, please wait...");
                    },
                    success: function (result) {
                        if (typeof callback == "function") {
                            callback(result);
                        }
                        if (result.code == web_status.SUCCESS) {
                            $.modal.alertSuccess(result.msg)
                        } else if (result.code == web_status.WARNING) {
                            $.modal.alertWarning(result.msg)
                        } else {
                            $.modal.alertError(result.msg);
                        }
                        $.modal.closeLoading();
                    }
                };
                $.ajax(config)
            },
            // Save tab information
            saveTab: function (url, data, callback) {
                var config = {
                    url: url,
                    type: "post",
                    dataType: "json",
                    data: data,
                    beforeSend: function () {
                        $.modal.loading("Processing, please wait...");
                    },
                    success: function (result) {
                        if (typeof callback == "function") {
                            callback(result);
                        }
                        $.operate.successTabCallback(result);
                    }
                };
                $.ajax(config)
            },
            // Save the result pop up msg to refresh the table table
            ajaxSuccess: function (result) {
                if (result.code == web_status.SUCCESS && table.options.type == table_type.bootstrapTable) {
                    $.modal.msgSuccess(result.msg);
                    $.table.refresh();
                } else if (result.code == web_status.SUCCESS && table.options.type == table_type.bootstrapTreeTable) {
                    $.modal.msgSuccess(result.msg);
                    $.treeTable.refresh();
                } else if (result.code == web_status.SUCCESS && $.common.isEmpty(table.options.type)) {
                    $.modal.msgSuccess(result.msg)
                } else if (result.code == web_status.WARNING) {
                    $.modal.alertWarning(result.msg)
                } else {
                    $.modal.alertError(result.msg);
                }
                $.modal.closeLoading();
            },
            // Successful result prompt msg (parent form global update)
            saveSuccess: function (result) {
                if (result.code == web_status.SUCCESS) {
                    $.modal.msgReload("Save successfully, please wait while refreshing data...", modal_status.SUCCESS);
                } else if (result.code == web_status.WARNING) {
                    $.modal.alertWarning(result.msg)
                } else {
                    $.modal.alertError(result.msg);
                }
                $.modal.closeLoading();
            },
            // Successful callback execution event (the parent form is updated silently)
            successCallback: function (result) {
                if (result.code == web_status.SUCCESS) {
                    var parent = window.parent;
                    if (parent.table.options.type == table_type.bootstrapTable) {
                        $.modal.close();
                        parent.$.modal.msgSuccess(result.msg);
                        parent.$.table.refresh();
                    } else if (parent.table.options.type == table_type.bootstrapTreeTable) {
                        $.modal.close();
                        parent.$.modal.msgSuccess(result.msg);
                        parent.$.treeTable.refresh();
                    } else {
                        $.modal.msgReload("Successfully saved, the data is being refreshed, please wait...", modal_status.SUCCESS);
                    }
                } else if (result.code == web_status.WARNING) {
                    $.modal.alertWarning(result.msg)
                } else {
                    $.modal.alertError(result.msg);
                }
                $.modal.closeLoading();
                $.modal.enable();
            },
            // The successful callback execution event of the tab (the parent form is updated silently)
            successTabCallback: function (result) {
                if (result.code == web_status.SUCCESS) {
                    var topWindow = $(window.parent.document);
                    var currentId = $('.page-tabs-content', topWindow).find('.active').attr('data-panel');
                    var $contentWindow = $('.RuoYi_iframe[data-id="' + currentId + '"]', topWindow)[0].contentWindow;
                    $.modal.close();
                    $contentWindow.$.modal.msgSuccess(result.msg);
                    $contentWindow.$(".layui-layer-padding").removeAttr("style");
                    if ($contentWindow.table.options.type == table_type.bootstrapTable) {
                        $contentWindow.$.table.refresh();
                    } else if ($contentWindow.table.options.type == table_type.bootstrapTreeTable) {
                        $contentWindow.$.treeTable.refresh();
                    }
                    $.modal.closeTab();
                } else if (result.code == web_status.WARNING) {
                    $.modal.alertWarning(result.msg)
                } else {
                    $.modal.alertError(result.msg);
                }
                $.modal.closeLoading();
            }
        },
        // Verify package processing
        validate: {
            // Determine whether the returned identifier is unique false does not exist true exists
            unique: function (value) {
                if (value == "0") {
                    return true;
                }
                return false;
            },
            // form validation
            form: function (formId) {
                var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
                return $("#" + currentId).validate().form();
            },
            // Reset the form validation (clear the prompt information)
            reset: function (formId) {
                var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
                return $("#" + currentId).validate().resetForm();
            }
        },
        // Tree plug-in package processing
        tree: {
            _option: {},
            _lastValue: {},
            // Initialize the tree structure
            init: function (options) {
                var defaults = {
                    id: "tree",                    // Attribute ID
                    expandLevel: 0,                // Expand level node
                    view: {
                        selectedMulti: false,      // Set whether to allow multiple nodes to be selected at the same time
                        nameIsHTML: true           // Set whether the name attribute supports HTML scripts
                    },
                    check: {
                        enable: false,             // Whether to display checkbox / radio on the node of zTree
                        nocheckInherit: true,      // Set whether child nodes are automatically inherited
                        chkboxType: { "Y": "ps", "N": "ps" } // Relationship between parent and child nodes
                    },
                    data: {
                        key: {
                            title: "title"         // The node data saves the attribute name of the node prompt information
                        },
                        simpleData: {
                            enable: true           // true/false means use/not use simple data mode respectively
                        }
                    },
                };
                var options = $.extend(defaults, options);
                $.tree._option = options;
                // Tree structure initial loading
                var setting = {
                    callback: {
                        onClick: options.onClick,                      // Event callback function used to capture the node being clicked
                        onCheck: options.onCheck,                      // Callback function used to capture the checkbox/radio check or uncheck event
                        onDblClick: options.onDblClick                 // Used to capture the event callback function after the mouse double click
                    },
                    check: options.check,
                    view: options.view,
                    data: options.data
                };
                $.get(options.url, function (data) {
                    var treeId = $("#treeId").val();
                    tree = $.fn.zTree.init($("#" + options.id), setting, data);
                    $._tree = tree;
                    for (var i = 0; i < options.expandLevel; i++) {
                        var nodes = tree.getNodesByParam("level", i);
                        for (var j = 0; j < nodes.length; j++) {
                            tree.expandNode(nodes[j], true, false, false);
                        }
                    }
                    var node = tree.getNodesByParam("id", treeId, null)[0];
                    $.tree.selectByIdName(treeId, node);
                    // Callback tree method
                    if (typeof (options.callBack) === "function") {
                        options.callBack(tree);
                    }
                });
            },
            // search node
            searchNode: function () {
                // Get the value of the entered keyword
                var value = $.common.trim($("#keyword").val());
                if ($.tree._lastValue == value) {
                    return;
                }
                // Save the last search name
                $.tree._lastValue = value;
                var nodes = $._tree.getNodes();
                // If you want to check an empty string, just exit without checking.
                if (value == "") {
                    $.tree.showAllNode(nodes);
                    return;
                }
                $.tree.hideAllNode(nodes);
                // Fuzzy match based on search value
                $.tree.updateNodes($._tree.getNodesByParamFuzzy("name", value));
            },
            // Select the specified node according to Id and Name
            selectByIdName: function (treeId, node) {
                if ($.common.isNotEmpty(treeId) && treeId == node.id) {
                    $._tree.selectNode(node, true);
                }
            },
            // Show all nodes
            showAllNode: function (nodes) {
                nodes = $._tree.transformToArray(nodes);
                for (var i = nodes.length - 1; i >= 0; i--) {
                    if (nodes[i].getParentNode() != null) {
                        $._tree.expandNode(nodes[i], true, false, false, false);
                    } else {
                        $._tree.expandNode(nodes[i], true, true, false, false);
                    }
                    $._tree.showNode(nodes[i]);
                    $.tree.showAllNode(nodes[i].children);
                }
            },
            // hide all nodes
            hideAllNode: function (nodes) {
                var tree = $.fn.zTree.getZTreeObj("tree");
                var nodes = $._tree.transformToArray(nodes);
                for (var i = nodes.length - 1; i >= 0; i--) {
                    $._tree.hideNode(nodes[i]);
                }
            },
            // Show all parent nodes
            showParent: function (treeNode) {
                var parentNode;
                while ((parentNode = treeNode.getParentNode()) != null) {
                    $._tree.showNode(parentNode);
                    $._tree.expandNode(parentNode, true, false, false);
                    treeNode = parentNode;
                }
            },
            // Show all child nodes
            showChildren: function (treeNode) {
                if (treeNode.isParent) {
                    for (var idx in treeNode.children) {
                        var node = treeNode.children[idx];
                        $._tree.showNode(node);
                        $.tree.showChildren(node);
                    }
                }
            },
            // Update node status
            updateNodes: function (nodeList) {
                $._tree.showNodes(nodeList);
                for (var i = 0, l = nodeList.length; i < l; i++) {
                    var treeNode = nodeList[i];
                    $.tree.showChildren(treeNode);
                    $.tree.showParent(treeNode)
                }
            },
            // Get the currently checked collection
            getCheckedNodes: function (column) {
                var _column = $.common.isEmpty(column) ? "id" : column;
                var nodes = $._tree.getCheckedNodes(true);
                return $.map(nodes, function (row) {
                    return row[_column];
                }).join();
            },
            // Do not allow root parent node selection
            notAllowParents: function (_tree) {
                var nodes = _tree.getSelectedNodes();
                if (nodes.length == 0) {
                    $.modal.msgError("Please select the node and submit");
                    return false;
                }
                for (var i = 0; i < nodes.length; i++) {
                    if (nodes[i].level == 0) {
                        $.modal.msgError("Cannot select the root node (" + nodes[i].name + ")");
                        return false;
                    }
                    if (nodes[i].isParent) {
                        $.modal.msgError("Cannot select parent node (" + nodes[i].name + ")");
                        return false;
                    }
                }
                return true;
            },
            // The last level node selection is not allowed
            notAllowLastLevel: function (_tree) {
                var nodes = _tree.getSelectedNodes();
                for (var i = 0; i < nodes.length; i++) {
                    if (!nodes[i].isParent) {
                        $.modal.msgError("Cannot select the last level node (" + nodes[i].name + ")");
                        return false;
                    }
                }
                return true;
            },
            // hide/show search bar
            toggleSearch: function () {
                $('#search').slideToggle(200);
                $('#btnShow').toggle();
                $('#btnHide').toggle();
                $('#keyword').focus();
            },
            // fold
            collapse: function () {
                $._tree.expandAll(false);
            },
            // expand
            expand: function () {
                $._tree.expandAll(true);
            }
        },
        // General method package processing
        common: {
            // Determine whether the string is empty
            isEmpty: function (value) {
                if (value == null || this.trim(value) == "") {
                    return true;
                }
                return false;
            },
            // Determine whether a string is non-empty
            isNotEmpty: function (value) {
                return !$.common.isEmpty(value);
            },
            // empty object to string
            nullToStr: function (value) {
                if ($.common.isEmpty(value)) {
                    return "-";
                }
                return value;
            },
            // Whether to display the data or not, the default is to display
            visible: function (value) {
                if ($.common.isEmpty(value) || value == true) {
                    return true;
                }
                return false;
            },
            // Space interception
            trim: function (value) {
                if (value == null) {
                    return "";
                }
                return value.toString().replace(/(^\s*)|(\s*$)|\r|\n/g, "");
            },
            // Compare two strings (case sensitive)
            equals: function (str, that) {
                return str == that;
            },
            // Compare two strings (not case sensitive)
            equalsIgnoreCase: function (str, that) {
                return String(str).toUpperCase() === String(that).toUpperCase();
            },
            // Split the string by specified characters
            split: function (str, sep, maxLen) {
                if ($.common.isEmpty(str)) {
                    return null;
                }
                var value = String(str).split(sep);
                return maxLen ? value.slice(0, maxLen - 1) : value;
            },
            // String formatting (%s)
            sprintf: function (str) {
                var args = arguments, flag = true, i = 1;
                str = str.replace(/%s/g, function () {
                    var arg = args[i++];
                    if (typeof arg === 'undefined') {
                        flag = false;
                        return '';
                    }
                    return arg == null ? '' : arg;
                });
                return flag ? str : '';
            },
            // Date formatting timestamp -> yyyy-MM-dd HH-mm-ss
            dateFormat: function (date, format) {
                var that = this;
                if (that.isEmpty(date)) return "";
                if (!date) return;
                if (!format) format = "yyyy-MM-dd";
                switch (typeof date) {
                    case "string":
                        date = new Date(date.replace(/-/, "/"));
                        break;
                    case "number":
                        date = new Date(date);
                        break;
                }
                if (!date instanceof Date) return;
                var dict = {
                    "yyyy": date.getFullYear(),
                    "M": date.getMonth() + 1,
                    "d": date.getDate(),
                    "H": date.getHours(),
                    "m": date.getMinutes(),
                    "s": date.getSeconds(),
                    "MM": ("" + (date.getMonth() + 101)).substr(1),
                    "dd": ("" + (date.getDate() + 100)).substr(1),
                    "HH": ("" + (date.getHours() + 100)).substr(1),
                    "mm": ("" + (date.getMinutes() + 100)).substr(1),
                    "ss": ("" + (date.getSeconds() + 100)).substr(1)
                };
                return format.replace(/(yyyy|MM?|dd?|HH?|ss?|mm?)/g,
                    function () {
                        return dict[arguments[0]];
                    });
            },
            // Get node data, support multi-level access
            getItemField: function (item, field) {
                var value = item;
                if (typeof field !== 'string' || item.hasOwnProperty(field)) {
                    return item[field];
                }
                var props = field.split('.');
                for (var p in props) {
                    value = value && value[props[p]];
                }
                return value;
            },
            // Specify a random number to return
            random: function (min, max) {
                return Math.floor((Math.random() * max) + min);
            },
            // Determine whether the string starts with start
            startWith: function (value, start) {
                var reg = new RegExp("^" + start);
                return reg.test(value)
            },
            // Determine whether the string ends with end
            endWith: function (value, end) {
                var reg = new RegExp(end + "$");
                return reg.test(value)
            },
            // Array deduplication
            uniqueFn: function (array) {
                var result = [];
                var hashObj = {};
                for (var i = 0; i < array.length; i++) {
                    if (!hashObj[array[i]]) {
                        hashObj[array[i]] = true;
                        result.push(array[i]);
                    }
                }
                return result;
            },
            // Put all elements in the array into a string
            join: function (array, separator) {
                if ($.common.isEmpty(array)) {
                    return null;
                }
                return array.join(separator);
            },
            // Get all the fields under the form and convert them to json objects
            formToJSON: function (formId) {
                var json = {};
                $.each($("#" + formId).serializeArray(), function (i, field) {
                    if (json[field.name]) {
                        json[field.name] += ("," + field.value);
                    } else {
                        json[field.name] = field.value;
                    }
                });
                return json;
            },
            // Data dictionary to drop-down box
            dictToSelect: function (datas, value, name) {
                var actions = [];
                actions.push($.common.sprintf("<select class='form-control' name='%s'>", name));
                $.each(datas, function (index, dict) {
                    actions.push($.common.sprintf("<option value='%s'", dict.dictValue));
                    if (dict.dictValue == ('' + value)) {
                        actions.push(' selected');
                    }
                    actions.push($.common.sprintf(">%s</option>", dict.dictLabel));
                });
                actions.push('</select>');
                return actions.join('');
            },
            // Get the length of the obj object
            getLength: function (obj) {
                var count = 0;
                for (var i in obj) {
                    if (obj.hasOwnProperty(i)) {
                        count++;
                    }
                }
                return count;
            },
            // Determine the mobile terminal
            isMobile: function () {
                return navigator.userAgent.match(/(Android|iPhone|SymbianOS|Windows Phone|iPad|iPod)/i);
            },
            // Number regular expression, can only be 0-9 numbers
            numValid: function (text) {
                var patten = new RegExp(/^[0-9]+$/);
                return patten.test(text);
            },
            // English regular expression, only a-z and A-Z letters
            enValid: function (text) {
                var patten = new RegExp(/^[a-zA-Z]+$/);
                return patten.test(text);
            },
            // Regular expressions for English and numbers, must contain (letters, numbers)
            enNumValid: function (text) {
                var patten = new RegExp(/^(?=.*[a-zA-Z]+)(?=.*[0-9]+)[a-zA-Z0-9]+$/);
                return patten.test(text);
            },
            // Regular expressions for English, numbers, special characters, must contain (letters, numbers, special characters! @#$%^&*()-=_+)
            charValid: function (text) {
                var patten = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#\$%\^&\*\(\ )\-=_\+])[A-Za-z\d~!@#\$%\^&\*\(\)\-=_\+]{6,}$/);
                return patten.test(text);
            },
        }
    });
})(jQuery);

/** Form type */
table_type = {
    bootstrapTable: 0,
    bootstrapTreeTable: 1
};

/** Message status code */
web_status = {
    SUCCESS: 0,
    FAIL: 500,
    WARNING: 301
};

/** Popup status code */
modal_status = {
    SUCCESS: "success",
    FAIL: "error",
    WARNING: "warning"
};