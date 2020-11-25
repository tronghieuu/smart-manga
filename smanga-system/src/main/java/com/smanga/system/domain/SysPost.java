package com.smanga.system.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.annotation.Excel.ColumnType;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Post table sys_post
 * 
 * @author Trong Hieu
 */
public class SysPost extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Position number */
    @Excel(name = "Position number", cellType = ColumnType.NUMERIC)
    private Long postId;

    /** Post code */
    @Excel(name = "Post code")
    private String postCode;

    /** position Name */
    @Excel(name = "position Name")
    private String postName;

    /** Job sorting */
    @Excel(name = "Job sorting", cellType = ColumnType.NUMERIC)
    private String postSort;

    /** Status (0 normal 1 disabled) */
    @Excel(name = "status", readConverterExp = "0=normal, 1=disabled")
    private String status;

    /** Does the user exist? This post ID does not exist by default */
    private boolean flag = false;

    public Long getPostId()
    {
        return postId;
    }

    public void setPostId(Long postId)
    {
        this.postId = postId;
    }

    @NotBlank(message = "Post code cannot be empty")
    @Size(min = 0, max = 64, message = "The length of the post code cannot exceed 64 characters")
    public String getPostCode()
    {
        return postCode;
    }

    public void setPostCode(String postCode)
    {
        this.postCode = postCode;
    }

    @NotBlank(message = "Position name cannot be empty")
    @Size(min = 0, max = 50, message = "The length of the job name cannot exceed 50 characters")
    public String getPostName()
    {
        return postName;
    }

    public void setPostName(String postName)
    {
        this.postName = postName;
    }

    @NotBlank(message = "Display order cannot be empty")
    public String getPostSort()
    {
        return postSort;
    }

    public void setPostSort(String postSort)
    {
        this.postSort = postSort;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public boolean isFlag()
    {
        return flag;
    }

    public void setFlag(boolean flag)
    {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("postId", getPostId())
            .append("postCode", getPostCode())
            .append("postName", getPostName())
            .append("postSort", getPostSort())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
