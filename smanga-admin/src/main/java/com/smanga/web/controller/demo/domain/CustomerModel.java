package com.smanga.web.controller.demo.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * Customer test information
 * 
 * @author Trong Hieu
 */
public class CustomerModel
{
    /**
     * Customer Name
     */
    private String name;

    /**
     * Customer phone
     */
    private String phonenumber;

    /**
     * Customer gender
     */
    private String sex;

    /**
     * Customer birthday
     */
    private String birthday;

    /**
     * Client Description
     */
    private String remark;

    /**
     * Product information
     */
    private List<GoodsModel> goods;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPhonenumber()
    {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber)
    {
        this.phonenumber = phonenumber;
    }


    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getBirthday()
    {
        return birthday;
    }

    public void setBirthday(String birthday)
    {
        this.birthday = birthday;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public List<GoodsModel> getGoods()
    {
        return goods;
    }

    public void setGoods(List<GoodsModel> goods)
    {
        this.goods = goods;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("name", getName())
            .append("phonenumber", getPhonenumber())
            .append("sex", getSex())
            .append("birthday", getBirthday())
            .append("goods", getGoods())
            .append("remark", getRemark())
            .toString();
    }
}
