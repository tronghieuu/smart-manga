package com.smanga.common.core.controller;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.domain.AjaxResult.Type;
import com.smanga.common.core.page.PageDomain;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.core.page.TableSupport;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.ServletUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.sql.SqlUtil;

/**
 * Web layer general data processing
 *
 * @author Trong Hieu
 */
public class BaseController
{
    protected final Logger logger = LoggerFactory.getLogger(BaseController.class);

    /**
     * The date format string passed from the front desk is automatically converted to Date type
     */
    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        // Date type conversion
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport()
        {
            @Override
            public void setAsText(String text)
            {
                setValue(DateUtils.parseDate(text));
            }
        });
    }

    /**
     * Set request paging data
     */
    protected void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }

    /**
     * Set request sort data
     */
    protected void startOrderBy()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        if (StringUtils.isNotEmpty(pageDomain.getOrderBy()))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.orderBy(orderBy);
        }
    }

    /**
     * Get request
     */
    public HttpServletRequest getRequest()
    {
        return ServletUtils.getRequest();
    }

    /**
     * Get response
     */
    public HttpServletResponse getResponse()
    {
        return ServletUtils.getResponse();
    }

    /**
     * Get session
     */
    public HttpSession getSession()
    {
        return getRequest().getSession();
    }

    /**
     * Paging data in response to requests
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * Response returns results
     *
     * @param rows affect the number of rows
     * @return operation result
     */
    protected AjaxResult toAjax(int rows)
    {
        return rows > 0 ? success() : error();
    }

    /**
     * Response return result
     *
     * @param result
     * @return operation result
     */
    protected AjaxResult toAjax(boolean result)
    {
        return result? success(): error();
    }

    /**
     * Return success
     */
    public AjaxResult success()
    {
        return AjaxResult.success();
    }

    /**
     * Return failure message
     */
    public AjaxResult error()
    {
        return AjaxResult.error();
    }

    /**
     * Return success message
     */
    public AjaxResult success(String message)
    {
        return AjaxResult.success(message);
    }

    /**
     * Return failure message
     */
    public AjaxResult error(String message)
    {
        return AjaxResult.error(message);
    }

    /**
     * Return error code message
     */
    public AjaxResult error(Type type, String message)
    {
        return new AjaxResult(type, message);
    }

    /**
     * Page jump
     */
    public String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }
}
