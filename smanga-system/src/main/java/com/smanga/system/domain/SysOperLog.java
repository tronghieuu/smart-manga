package com.smanga.system.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.annotation.Excel.ColumnType;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Operation log record table oper_log
 * 
 * @author Trong Hieu
 */
public class SysOperLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Log primary key */
    @Excel(name = "Operation number", cellType = ColumnType.NUMERIC)
    private Long operId;

    /** Operation module */
    @Excel(name = "Operation module")
    private String title;

    /** Business type (0 other 1 added 2 modified 3 deleted) */
    @Excel(name = "business type", readConverterExp = "0=others, 1=new, 2=modify, 3=delete, 4=authorize, 5=export, 6=import, 7=retire, 8=generate code, 9=clear data")
    private Integer businessType;

    /** Business type array */
    private Integer[] businessTypes;

    /** Request method */
    @Excel(name = "Request method")
    private String method;

    /** Request method */
    @Excel(name = "Request method")
    private String requestMethod;

    /** Operation category (0 other 1 background user 2 mobile terminal user) */
    @Excel(name = "Operation category", readConverterExp = "0=others, 1=background user, 2=mobile terminal user")
    private Integer operatorType;

    /** operator */
    @Excel(name = "operator")
    private String operName;

    /** Department name */
    @Excel(name = "Department name")
    private String deptName;

    /** Request url */
    @Excel(name = "Request address")
    private String operUrl;

    /** Operation address */
    @Excel(name = "Operation address")
    private String operIp;

    /** Operating location */
    @Excel(name = "Operating location")
    private String operLocation;

    /** Request parameter */
    @Excel(name = "Request parameter")
    private String operParam;

    /** Return parameter */
    @Excel(name = "Return parameter")
    private String jsonResult;

    /** Operation status (0 normal and 1 abnormal) */
    @Excel(name = "status", readConverterExp = "0=normal, 1=abnormal")
    private Integer status;

    /** wrong information */
    @Excel(name = "wrong information")
    private String errorMsg;

    /** Operating time */
    @Excel(name = "Operating time", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date operTime;

    public Long getOperId()
    {
        return operId;
    }

    public void setOperId(Long operId)
    {
        this.operId = operId;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public Integer getBusinessType()
    {
        return businessType;
    }

    public void setBusinessType(Integer businessType)
    {
        this.businessType = businessType;
    }

    public Integer[] getBusinessTypes()
    {
        return businessTypes;
    }

    public void setBusinessTypes(Integer[] businessTypes)
    {
        this.businessTypes = businessTypes;
    }

    public String getMethod()
    {
        return method;
    }

    public void setMethod(String method)
    {
        this.method = method;
    }

    public String getRequestMethod()
    {
        return requestMethod;
    }

    public void setRequestMethod(String requestMethod)
    {
        this.requestMethod = requestMethod;
    }

    public Integer getOperatorType()
    {
        return operatorType;
    }

    public void setOperatorType(Integer operatorType)
    {
        this.operatorType = operatorType;
    }

    public String getOperName()
    {
        return operName;
    }

    public void setOperName(String operName)
    {
        this.operName = operName;
    }

    public String getDeptName()
    {
        return deptName;
    }

    public void setDeptName(String deptName)
    {
        this.deptName = deptName;
    }

    public String getOperUrl()
    {
        return operUrl;
    }

    public void setOperUrl(String operUrl)
    {
        this.operUrl = operUrl;
    }

    public String getOperIp()
    {
        return operIp;
    }

    public void setOperIp(String operIp)
    {
        this.operIp = operIp;
    }

    public String getOperLocation()
    {
        return operLocation;
    }

    public void setOperLocation(String operLocation)
    {
        this.operLocation = operLocation;
    }

    public String getOperParam()
    {
        return operParam;
    }

    public void setOperParam(String operParam)
    {
        this.operParam = operParam;
    }

    public String getJsonResult()
    {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult)
    {
        this.jsonResult = jsonResult;
    }

    public Integer getStatus()
    {
        return status;
    }

    public void setStatus(Integer status)
    {
        this.status = status;
    }

    public String getErrorMsg()
    {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg)
    {
        this.errorMsg = errorMsg;
    }

    public Date getOperTime()
    {
        return operTime;
    }

    public void setOperTime(Date operTime)
    {
        this.operTime = operTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("operId", getOperId())
            .append("title", getTitle())
            .append("businessType", getBusinessType())
            .append("businessTypes", getBusinessTypes())
            .append("method", getMethod())
            .append("requestMethod", getRequestMethod())
            .append("operatorType", getOperatorType())
            .append("operName", getOperName())
            .append("deptName", getDeptName())
            .append("operUrl", getOperUrl())
            .append("operIp", getOperIp())
            .append("operLocation", getOperLocation())
            .append("operParam", getOperParam())
            .append("status", getStatus())
            .append("errorMsg", getErrorMsg())
            .append("operTime", getOperTime())
            .toString();
    }
}
