/**
 * General method package processing
 * Copyright (c) 2020 smanga 
 */
$(function () {

    // layer extension skin
    if (window.layer !== undefined) {
        layer.config({
            extend: 'moon/style.css',
            skin: 'layer-ext-moon'
        });
    }

    // Back to top binding
    if ($.fn.toTop !== undefined) {
        $('#scroll-up').toTop();
    }

    // select2 checkbox event binding
    if ($.fn.select2 !== undefined) {
        $.fn.select2.defaults.set("theme", "bootstrap");
        $("select.form-control:not(.noselect2)").each(function () {
            $(this).select2().on("change", function () {
                $(this).valid();
            })
        })
    }

    // iCheck radio button and check box event binding
    if ($.fn.iCheck !== undefined) {
        $(".check-box:not(.noicheck),.radio-box:not(.noicheck)").each(function () {
            $(this).iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
            })
        })
    }

    // Bubble pop-up box effect (when moving to the element)
    $(document).on("mouseenter", '.table [data-toggle="popover"]', function () {
        var _this = this;
        $(this).popover("show");
        $(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
        });
    })

    // Bubble pop-up box effect (when leaving the element)
    $(document).on("mouseleave", '.table [data-toggle="popover"]', function () {
        var _this = this;
        setTimeout(function () {
            if (!$(".popover:hover").length) $(_this).popover("hide");
        }, 100);
    });

    // Cancel the carriage return to automatically submit the form
    $(document).on("keypress", ":input:not(textarea):not([type=submit])", function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
        }
    });

    // laydate time control binding
    if ($(".select-time").length > 0) {
        layui.use('laydate', function () {
            var laydate = layui.laydate;
            var startDate = laydate.render({
                elem: '#startTime',
                max: $('#endTime').val(),
                theme: 'molv',
                trigger: 'click',
                done: function (value, date) {
                    // end time is greater than start time
                    if (value !== '') {
                        endDate.config.min.year = date.year;
                        endDate.config.min.month = date.month - 1;
                        endDate.config.min.date = date.date;
                    } else {
                        endDate.config.min.year = '';
                        endDate.config.min.month = '';
                        endDate.config.min.date = '';
                    }
                }
            });
            var endDate = laydate.render({
                elem: '#endTime',
                min: $('#startTime').val(),
                theme: 'molv',
                trigger: 'click',
                done: function (value, date) {
                    // start time is less than end time
                    if (value !== '') {
                        startDate.config.max.year = date.year;
                        startDate.config.max.month = date.month - 1;
                        startDate.config.max.date = date.date;
                    } else {
                        startDate.config.max.year = '2099';
                        startDate.config.max.month = '12';
                        startDate.config.max.date = '31';
                    }
                }
            });
        });
    }

    // laydate time-input time control binding
    if ($(".time-input").length > 0) {
        layui.use('laydate', function () {
            var com = layui.laydate;
            $(".time-input").each(function (index, item) {
                var time = $(item);
                // Control the appearance of the control
                var type = time.attr("data-type") || 'date';
                // Control the echo format
                var format = time.attr("data-format") || 'yyyy-MM-dd';
                // Control date control button
                var buttons = time.attr("data-btn") || 'clear|now|confirm', newBtnArr = [];
                // Callback processing after the date control is selected
                var callback = time.attr("data-callback") || {};
                if (buttons) {
                    if (buttons.indexOf("|") > 0) {
                        var btnArr = buttons.split("|"), btnLen = btnArr.length;
                        for (var j = 0; j < btnLen; j++) {
                            if ("clear" === btnArr[j] || "now" === btnArr[j] || "confirm" === btnArr[j]) {
                                newBtnArr.push(btnArr[j]);
                            }
                        }
                    } else {
                        if ("clear" === buttons || "now" === buttons || "confirm" === buttons) {
                            newBtnArr.push(buttons);
                        }
                    }
                } else {
                    newBtnArr = ['clear', 'now', 'confirm'];
                }
                com.render({
                    elem: item,
                    theme: 'molv',
                    trigger: 'click',
                    type: type,
                    format: format,
                    btns: newBtnArr,
                    done: function (value, data) {
                        if (typeof window[callback] != 'undefined'
                            && window[callback] instanceof Function) {
                            window[callback](value, data);
                        }
                    }
                });
            });
        });
    }

    // tree keyword search binding
    if ($("#keyword").length > 0) {
        $("#keyword").bind("focus", function focusKey(e) {
            if ($("#keyword").hasClass("empty")) {
                $("#keyword").removeClass("empty");
            }
        }).bind("blur", function blurKey(e) {
            if ($("#keyword").val() === "") {
                $("#keyword").addClass("empty");
            }
            $.tree.searchNode(e);
        }).bind("input propertychange", $.tree.searchNode);
    }

    // tree table tree expand/collapse
    var expandFlag;
    $("#expandAllBtn").click(function () {
        var dataExpand = $.common.isEmpty(table.options.expandAll) ? true : table.options.expandAll;
        expandFlag = $.common.isEmpty(expandFlag) ? dataExpand : expandFlag;
        if (!expandFlag) {
            $.bttTable.bootstrapTreeTable('expandAll');
        } else {
            $.bttTable.bootstrapTreeTable('collapseAll');
        }
        expandFlag = expandFlag ? false : true;
    })

    // Press the ESC button to close the bomb layer
    $('body', document).on('keyup', function (e) {
        if (e.which === 27) {
            $.modal.closeAll();
        }
    });
});

(function ($) {
    'use strict';
    $.fn.toTop = function (opt) {
        var elem = this;
        var win = (opt && opt.hasOwnProperty('win')) ? opt.win : $(window);
        var doc = (opt && opt.hasOwnProperty('doc')) ? opt.doc : $('html, body');
        var options = $.extend({
            autohide: true,
            offset: 50,
            speed: 500,
            position: true,
            right: 15,
            bottom: 5
        }, opt);
        elem.css({
            'cursor': 'pointer'
        });
        if (options.autohide) {
            elem.css('display', 'none');
        }
        if (options.position) {
            elem.css({
                'position': 'fixed',
                'right': options.right,
                'bottom': options.bottom,
            });
        }
        elem.click(function () {
            doc.animate({
                scrollTop: 0
            }, options.speed);
        });
        win.scroll(function () {
            var scrolling = win.scrollTop();
            if (options.autohide) {
                if (scrolling > options.offset) {
                    elem.fadeIn(options.speed);
                } else elem.fadeOut(options.speed);
            }
        });
    };
})(jQuery);

/** Refresh tab */
var refreshItem = function () {
    var topWindow = $(window.parent.document);
    var currentId = $('.page-tabs-content', topWindow).find('.active').attr('data-id');
    var target = $('.RuoYi_iframe[data-id="' + currentId + '"]', topWindow);
    var url = target.attr('src');
    target.attr('src', url).ready();
}

/** Close tab */
var closeItem = function (dataId) {
    var topWindow = $(window.parent.document);
    if ($.common.isNotEmpty(dataId)) {
        window.parent.$.modal.closeLoading();
        // Close the specified tab according to dataId
        $('.menuTab[data-id="' + dataId + '"]', topWindow).remove();
        // Remove the content area corresponding to the corresponding tab
        $('.mainContent .RuoYi_iframe[data-id="' + dataId + '"]', topWindow).remove();
        return;
    }
    var panelUrl = window.frameElement.getAttribute('data-panel');
    $('.page-tabs-content .active i', topWindow).click();
    if ($.common.isNotEmpty(panelUrl)) {
        $('.menuTab[data-id="' + panelUrl + '"]', topWindow).addClass('active').siblings('.menuTab').removeClass('active');
        $('.mainContent .RuoYi_iframe', topWindow).each(function () {
            if ($(this).data('id') == panelUrl) {
                $(this).show().siblings('.RuoYi_iframe').hide();
                return false;
            }
        });
    }
}

/** Create tab */
function createMenuItem(dataUrl, menuName) {
    var panelUrl = window.frameElement.getAttribute('data-id');
    dataIndex = $.common.random(1, 100),
        flag = true;
    if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;
    var topWindow = $(window.parent.document);
    // Tab menu already exists
    $('.menuTab', topWindow).each(function () {
        if ($(this).data('id') == dataUrl) {
            if (!$(this).hasClass('active')) {
                $(this).addClass('active').siblings('.menuTab').removeClass('active');
                scrollToTab(this);
                $('.page-tabs-content').animate({ marginLeft: "" }, "fast");
                // Display the content area corresponding to tab
                $('.mainContent .RuoYi_iframe', topWindow).each(function () {
                    if ($(this).data('id') == dataUrl) {
                        $(this).show().siblings('.RuoYi_iframe').hide();
                        return false;
                    }
                });
            }
            flag = false;
            return false;
        }
    });
    // Tab menu does not exist
    if (flag) {
        var str = '<a href="javascript:;" class="active menuTab noactive" data-id="' + dataUrl + '" data-panel="' + panelUrl + '">' + menuName + '<i class="fa fa-times-circle"></i></a>';
        $('.menuTab', topWindow).removeClass('active');

        // Add the iframe corresponding to the tab
        var str1 = '<iframe class="RuoYi_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id ="' + dataUrl + '" data-panel="' + panelUrl + '" seamless></iframe>';
        $('.mainContent', topWindow).find('iframe.RuoYi_iframe').hide().parents('.mainContent').append(str1);

        window.parent.$.modal.loading("Data loading, please wait...");
        $('.mainContent iframe:visible', topWindow).load(function () {
            window.parent.$.modal.closeLoading();
        });

        // add tab
        $('.menuTabs .page-tabs-content', topWindow).append(str);
        scrollToTab($('.menuTab.active', topWindow));
    }
    return false;
}

// Scroll to the specified tab
function scrollToTab(element) {
    var topWindow = $(window.parent.document);
    var marginLeftVal = calSumWidth($(element).prevAll()),
        marginRightVal = calSumWidth($(element).nextAll());
    // non-tab width of the visible area
    var tabOuterWidth = calSumWidth($(".content-tabs", topWindow).children().not(".menuTabs"));
    //Viewable area tab width
    var visibleWidth = $(".content-tabs", topWindow).outerWidth(true) - tabOuterWidth;
    //The actual scroll width
    var scrollVal = 0;
    if ($(".page-tabs-content", topWindow).outerWidth() < visibleWidth) {
        scrollVal = 0;
    } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
        if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
            scrollVal = marginLeftVal;
            var tabElement = element;
            while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content", topWindow).outerWidth() - visibleWidth)) {
                scrollVal -= $(tabElement).prev().outerWidth();
                tabElement = $(tabElement).prev();
            }
        }
    } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
        scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
    }
    $('.page-tabs-content', topWindow).animate({ marginLeft: 0 - scrollVal + 'px' }, "fast");
}

//Calculate the total width of the element collection
function calSumWidth(elements) {
    var width = 0;
    $(elements).each(function () {
        width += $(this).outerWidth(true);
    });
    return width;
}

/** Password rule range verification */
function checkpwd(chrtype, password) {
    if (chrtype == 1) {
        if (!$.common.numValid(password)) {
            $.modal.alertWarning("Password can only be 0-9 numbers");
            return false;
        }
    } else if (chrtype == 2) {
        if (!$.common.enValid(password)) {
            $.modal.alertWarning("The password can only be a-z and A-Z letters");
            return false;
        }
    } else if (chrtype == 3) {
        if (!$.common.enNumValid(password)) {
            $.modal.alertWarning("Password must contain letters and numbers");
            return false;
        }
    } else if (chrtype == 4) {
        if (!$.common.charValid(password)) {
            $.modal.alertWarning("Password must contain letters, numbers, and special symbols<font color='red'>~!@#$%^&*()-=_+</font>");
            return false;
        }
    }
    return true;
}

// Log printing package processing
var log = {
    log: function (msg) {
        console.log(msg);
    },
    info: function (msg) {
        console.info(msg);
    },
    warn: function (msg) {
        console.warn(msg);
    },
    error: function (msg) {
        console.error(msg);
    }
};

// Local cache processing
var storage = {
    set: function (key, value) {
        window.localStorage.setItem(key, value);
    },
    get: function (key) {
        return window.localStorage.getItem(key);
    },
    remove: function (key) {
        window.localStorage.removeItem(key);
    },
    clear: function () {
        window.localStorage.clear();
    }
};

// Main and sub-table operation package processing
var sub = {
    editColumn: function () {
        var count = $("#" + table.options.id).bootstrapTable('getData').length;
        var params = new Array();
        for (var dataIndex = 0; dataIndex <= count; dataIndex++) {
            var columns = $('#' + table.options.id + 'tr[data-index="' + dataIndex + '"] td');
            var obj = new Object();
            for (var i = 0; i < columns.length; i++) {
                var inputValue = $(columns[i]).find('input');
                var selectValue = $(columns[i]).find('select');
                var key = table.options.columns[i].field;
                if ($.common.isNotEmpty(inputValue.val())) {
                    obj[key] = inputValue.val();
                } else if ($.common.isNotEmpty(selectValue.val())) {
                    obj[key] = selectValue.val();
                } else {
                    obj[key] = "";
                }
            }
            params.push({ index: dataIndex, row: obj });
        }
        $("#" + table.options.id).bootstrapTable("updateRow", params);
    },
    delColumn: function (column) {
        sub.editColumn();
        var subColumn = $.common.isEmpty(column) ? "index" : column;
        var ids = $.table.selectColumns(subColumn);
        if (ids.length == 0) {
            $.modal.alertWarning("Please select at least one record");
            return;
        }
        $("#" + table.options.id).bootstrapTable('remove', { field: subColumn, values: ids });
    }
};

// Load css file dynamically
function loadCss(file, headElem) {
    var link = document.createElement('link');
    link.href = file;
    link.rel = 'stylesheet';
    link.type = 'text/css';
    if (headElem) headElem.appendChild(link);
    else document.getElementsByTagName('head')[0].appendChild(link);
}

// Load js files dynamically
function loadJs(file, headElem) {
    var script = document.createElement('script');
    script.src = file;
    script.type = 'text/javascript';
    if (headElem) headElem.appendChild(script);
    else document.getElementsByTagName('head')[0].appendChild(script);
}

/** Set global ajax processing */
$.ajaxSetup({
    complete: function (XMLHttpRequest, textStatus) {
        if (textStatus == 'timeout') {
            $.modal.alertWarning("Server timed out, please try again later!");
            $.modal.enable();
            $.modal.closeLoading();
        } else if (textStatus == "parsererror" || textStatus == "error") {
            $.modal.alertWarning("Server error, please contact the administrator!");
            $.modal.enable();
            $.modal.closeLoading();
        }
    }
});
