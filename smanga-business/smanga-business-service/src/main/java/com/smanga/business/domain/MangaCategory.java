package com.smanga.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Manga Category object manga_category
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public class MangaCategory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Serial ID */
    private Long id;

    /** Category name */
    @Excel(name = "Category name")
    private String categoryName;

    /** Number of reader like this category */
    @Excel(name = "Number of reader like this category")
    private Integer favoriteCounter;

    /** Category status (1 enabled 0 disabled) */
    @Excel(name = "Category status (1 enabled 0 disabled)")
    private String status;

    /** Delete flag (0 means existence 1 means deletion) */
    private String delFlag;

    /** Category cover image path */
    @Excel(name = "Category cover image path")
    private String coverImage;

    /** Id of cover image */
    @Excel(name = "Id of cover image")
    private Long coverImageId;

    /** Age recommend */
    @Excel(name = "Age recommend")
    private String recommendedAge;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCategoryName(String categoryName) 
    {
        this.categoryName = categoryName;
    }

    public String getCategoryName() 
    {
        return categoryName;
    }
    public void setFavoriteCounter(Integer favoriteCounter) 
    {
        this.favoriteCounter = favoriteCounter;
    }

    public Integer getFavoriteCounter() 
    {
        return favoriteCounter;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setCoverImage(String coverImage) 
    {
        this.coverImage = coverImage;
    }

    public String getCoverImage() 
    {
        return coverImage;
    }
    public void setCoverImageId(Long coverImageId) 
    {
        this.coverImageId = coverImageId;
    }

    public Long getCoverImageId() 
    {
        return coverImageId;
    }
    public void setRecommendedAge(String recommendedAge) 
    {
        this.recommendedAge = recommendedAge;
    }

    public String getRecommendedAge() 
    {
        return recommendedAge;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryName", getCategoryName())
            .append("favoriteCounter", getFavoriteCounter())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("coverImage", getCoverImage())
            .append("coverImageId", getCoverImageId())
            .append("recommendedAge", getRecommendedAge())
            .toString();
    }
}
