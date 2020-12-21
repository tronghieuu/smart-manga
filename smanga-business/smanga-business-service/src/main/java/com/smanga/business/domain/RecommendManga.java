package com.smanga.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * List manga rating predict by system object recommend_manga
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
public class RecommendManga extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Serial index */
    private Long id;

    /** User id */
    @Excel(name = "User id")
    private Long userId;

    /** Manga id */
    @Excel(name = "Manga id")
    private Long mangaId;

    /** 0: is not recommend, 1: is recommend */
    @Excel(name = "0: is not recommend, 1: is recommend")
    private Integer isRecommend;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setMangaId(Long mangaId) 
    {
        this.mangaId = mangaId;
    }

    public Long getMangaId() 
    {
        return mangaId;
    }
    public void setIsRecommend(Integer isRecommend) 
    {
        this.isRecommend = isRecommend;
    }

    public Integer getIsRecommend() 
    {
        return isRecommend;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("mangaId", getMangaId())
            .append("isRecommend", getIsRecommend())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
