package com.smanga.business.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Business User Information Form object business_user
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public class BusinessUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** User ID */
    private Long userId;

    /** Login account */
    @Excel(name = "Login account")
    private String loginName;

    /** User name */
    @Excel(name = "User name")
    private String userName;

    /** User type (R reader P publisher) */
    @Excel(name = "User type (R reader P publisher)")
    private String userType;

    /** User mailbox */
    @Excel(name = "User mailbox")
    private String email;

    /** Mobile phone number */
    @Excel(name = "Mobile phone number")
    private String phonenumber;

    /** User gender (0 male 1 female 2 unknown) */
    @Excel(name = "User gender (0 male 1 female 2 unknown)")
    private String sex;

    /** Avatar path */
    @Excel(name = "Avatar path")
    private String avatar;

    /** Password */
    @Excel(name = "Password")
    private String password;

    /** Salt encryption */
    @Excel(name = "Salt encryption")
    private String salt;

    /** Account status (0 normal 1 disabled) */
    @Excel(name = "Account status (0 normal 1 disabled)")
    private String status;

    /** Delete flag (0 means existence 2 means deletion) */
    private String delFlag;

    /** Last login IP */
    @Excel(name = "Last login IP")
    private String loginIp;

    /** Last login time */
    @Excel(name = "Last login time", width = 30, dateFormat = "yyyy-MM-dd")
    private Date loginDate;

    /** Last password update time */
    @Excel(name = "Last password update time", width = 30, dateFormat = "yyyy-MM-dd")
    private Date pwdUpdateDate;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setLoginName(String loginName) 
    {
        this.loginName = loginName;
    }

    public String getLoginName() 
    {
        return loginName;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setUserType(String userType) 
    {
        this.userType = userType;
    }

    public String getUserType() 
    {
        return userType;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setPhonenumber(String phonenumber) 
    {
        this.phonenumber = phonenumber;
    }

    public String getPhonenumber() 
    {
        return phonenumber;
    }
    public void setSex(String sex) 
    {
        this.sex = sex;
    }

    public String getSex() 
    {
        return sex;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setSalt(String salt) 
    {
        this.salt = salt;
    }

    public String getSalt() 
    {
        return salt;
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
    public void setLoginIp(String loginIp) 
    {
        this.loginIp = loginIp;
    }

    public String getLoginIp() 
    {
        return loginIp;
    }
    public void setLoginDate(Date loginDate) 
    {
        this.loginDate = loginDate;
    }

    public Date getLoginDate() 
    {
        return loginDate;
    }
    public void setPwdUpdateDate(Date pwdUpdateDate) 
    {
        this.pwdUpdateDate = pwdUpdateDate;
    }

    public Date getPwdUpdateDate() 
    {
        return pwdUpdateDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("loginName", getLoginName())
            .append("userName", getUserName())
            .append("userType", getUserType())
            .append("email", getEmail())
            .append("phonenumber", getPhonenumber())
            .append("sex", getSex())
            .append("avatar", getAvatar())
            .append("password", getPassword())
            .append("salt", getSalt())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("loginIp", getLoginIp())
            .append("loginDate", getLoginDate())
            .append("pwdUpdateDate", getPwdUpdateDate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
