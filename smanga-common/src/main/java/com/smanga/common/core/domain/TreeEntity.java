package com.smanga.common.core.domain;

/**
 * Tree base class
 *
 * @author Trong Hieu
 */
public class TreeEntity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** Parent menu name */
    private String parentName;

    /** Parent menu ID */
    private Long parentId;

    /** display order */
    private Integer orderNum;

    /** List of ancestors */
    private String ancestors;

    public String getParentName()
    {
        return parentName;
    }

    public void setParentName(String parentName)
    {
        this.parentName = parentName;
    }

    public Long getParentId()
    {
        return parentId;
    }

    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Integer getOrderNum()
    {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum)
    {
        this.orderNum = orderNum;
    }

    public String getAncestors()
    {
        return ancestors;
    }

    public void setAncestors(String ancestors)
    {
        this.ancestors = ancestors;
    }
}