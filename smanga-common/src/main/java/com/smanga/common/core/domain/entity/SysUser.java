package com.smanga.common.core.domain.entity;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.smanga.common.annotation.Excel;
import com.smanga.common.annotation.Excel.ColumnType;
import com.smanga.common.annotation.Excel.Type;
import com.smanga.common.annotation.Excels;
import com.smanga.common.core.domain.BaseEntity;

/**
 * User object sys_user
 *
 * @author Trong Hieu
 */
public class SysUser extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** User ID */
	@Excel(name = "User Serial Number", cellType = ColumnType.NUMERIC, prompt = "User Number")
	private Long userId;

	/** Department ID */
	@Excel(name = "Department Number", type = Type.IMPORT)
	private Long deptId;

	/** Department parent ID */
	private Long parentId;

	/** Role ID */
	private Long roleId;

	/** Login name */
	@Excel(name = "Login name")
	private String loginName;

	/** user name */
	@Excel(name = "User Name")
	private String userName;

	/** user type */
	private String userType;

	/** User mailbox */
	@Excel(name = "user mailbox")
	private String email;

	/** mobile phone number */
	@Excel(name = "mobile phone number")
	private String phonenumber;

	/** User gender */
	@Excel(name = "user gender", readConverterExp = "0=male, 1=female, 2=unknown")
	private String sex;

	/** profile picture */
	private String avatar;

	/** Password */
	private String password;

	/** Salt encryption */
	private String salt;

	/** Account status (0 normal 1 disabled) */
	@Excel(name = "Account Status", readConverterExp = "0=normal, 1=disabled")
	private String status;

	/** Delete flag (0 means existence 2 means deletion) */
	private String delFlag;

	/** Last login IP */
	@Excel(name = "last login IP", type = Type.EXPORT)
	private String loginIp;

	/** last login time */
	@Excel(name = "Last login time", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss", type = Type.EXPORT)
	private Date loginDate;

	/** Last password update time */
	private Date pwdUpdateDate;

	/** Department object */
	@Excels({ @Excel(name = "Department Name", targetAttr = "deptName", type = Type.EXPORT),
			@Excel(name = "Department Leader", targetAttr = "leader", type = Type.EXPORT) })
	private SysDept dept;

	private List<SysRole> roles;

	/** Role group */
	private Long[] roleIds;

	/** Position group */
	private Long[] postIds;

	public SysUser() {

	}

	public SysUser(Long userId) {
		this.userId = userId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public boolean isAdmin() {
		return isAdmin(this.userId);
	}

	public static boolean isAdmin(Long userId) {
		return userId != null && userId.equals(1L);
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	@NotBlank(message = "Login account cannot be empty")
	@Size(min = 0, max = 30, message = "The length of the login account cannot exceed 30 characters")
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Size(min = 0, max = 30, message = "The length of the user nickname cannot exceed 30 characters")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Email(message = "The email format is incorrect")
	@Size(min = 0, max = 50, message = "The length of the mailbox cannot exceed 50 characters")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Size(min = 0, max = 11, message = "The length of the mobile phone number cannot exceed 11 characters")
	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@JsonIgnore
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public Date getPwdUpdateDate() {
		return pwdUpdateDate;
	}

	public void setPwdUpdateDate(Date pwdUpdateDate) {
		this.pwdUpdateDate = pwdUpdateDate;
	}

	public SysDept getDept() {
		if (dept == null) {
			dept = new SysDept();
		}
		return dept;
	}

	public void setDept(SysDept dept) {
		this.dept = dept;
	}

	public List<SysRole> getRoles() {
		return roles;
	}

	public void setRoles(List<SysRole> roles) {
		this.roles = roles;
	}

	public Long[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Long[] roleIds) {
		this.roleIds = roleIds;
	}

	public Long[] getPostIds() {
		return postIds;
	}

	public void setPostIds(Long[] postIds) {
		this.postIds = postIds;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("userId", getUserId())
				.append("deptId", getDeptId()).append("loginName", getLoginName()).append("userName", getUserName())
				.append("userType", getUserType()).append("email", getEmail()).append("phonenumber", getPhonenumber())
				.append("sex", getSex()).append("avatar", getAvatar()).append("password", getPassword())
				.append("salt", getSalt()).append("status", getStatus()).append("delFlag", getDelFlag())
				.append("loginIp", getLoginIp()).append("loginDate", getLoginDate()).append("createBy", getCreateBy())
				.append("createTime", getCreateTime()).append("updateBy", getUpdateBy())
				.append("updateTime", getUpdateTime()).append("remark", getRemark()).append("dept", getDept())
				.append("roles", getRoles()).toString();
	}
}
