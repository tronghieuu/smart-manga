package com.smanga.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Image File object image_file
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public class ImageFile extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** Serial ID */
	private Long id;

	/** Image file name */
	@Excel(name = "Image file name")
	private String imageName;

	/** Image file path */
	@Excel(name = "Image file path")
	private String imagePath;

	/** Used status (1 used 0 not use) */
	@Excel(name = "Used status (1 used 0 not use)")
	private String usedStatus;

	/** Delete flag (0 means existence 1 means deletion) */
	private String delFlag;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setUsedStatus(String usedStatus) {
		this.usedStatus = usedStatus;
	}

	public String getUsedStatus() {
		return usedStatus;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getDelFlag() {
		return delFlag;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
				.append("imageName", getImageName()).append("imagePath", getImagePath())
				.append("usedStatus", getUsedStatus()).append("delFlag", getDelFlag()).append("createBy", getCreateBy())
				.append("createTime", getCreateTime()).append("updateBy", getUpdateBy())
				.append("updateTime", getUpdateTime()).append("params", getParams()).toString();
	}
}
