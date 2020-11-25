package com.smanga.web.controller.demo.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * Product test information
 * 
 * @author Trong Hieu
 */
public class GoodsModel
{
    /**
     * product name
     */
    private String name;

    /**
     * commodity weight
     */
    private Integer weight;

    /**
     * Commodity price
     */
    private Double price;
    
    /**
     * Commodity date
     */
    private Date date;

    /**
     * Types of goods
     */
    private String type;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Integer getWeight()
    {
        return weight;
    }

    public void setWeight(Integer weight)
    {
        this.weight = weight;
    }

    public Double getPrice()
    {
        return price;
    }

    public void setPrice(Double price)
    {
        this.price = price;
    }

    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("name", getName())
            .append("weight", getWeight())
            .append("price", getPrice())
            .append("date", getDate())
            .append("type", getType())
            .toString();
    }
}
