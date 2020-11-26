package com.smanga.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Author object author
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public class Author extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Serial ID */
    private Long id;

    /** Author name */
    @Excel(name = "Author name")
    private String authorName;

    /** Author information */
    @Excel(name = "Author information")
    private String authorInfo;

    /** Number of reader like this author */
    @Excel(name = "Number of reader like this author")
    private Integer favoriteCounter;

    /** Delete flag (0 means existence 1 means deletion) */
    private String delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAuthorName(String authorName) 
    {
        this.authorName = authorName;
    }

    public String getAuthorName() 
    {
        return authorName;
    }
    public void setAuthorInfo(String authorInfo) 
    {
        this.authorInfo = authorInfo;
    }

    public String getAuthorInfo() 
    {
        return authorInfo;
    }
    public void setFavoriteCounter(Integer favoriteCounter) 
    {
        this.favoriteCounter = favoriteCounter;
    }

    public Integer getFavoriteCounter() 
    {
        return favoriteCounter;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("authorName", getAuthorName())
            .append("authorInfo", getAuthorInfo())
            .append("favoriteCounter", getFavoriteCounter())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
