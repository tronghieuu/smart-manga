package com.smanga.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * artist object artist
 * 
 * @author Trong Hieu
 * @date 2020-11-29
 */
public class Artist extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** Serial ID */
	private Long id;

	/** Artist name */
	@Excel(name = "Artist name")
	private String artistName;

	/** Artist information */
	@Excel(name = "Artist information")
	private String artistInfo;

	/** Number of reader like this artist */
	@Excel(name = "Number of reader like this artist")
	private Integer favoriteCounter;

	/** Delete flag (0 means existence 1 means deletion) */
	private String delFlag;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setArtistInfo(String artistInfo) {
		this.artistInfo = artistInfo;
	}

	public String getArtistInfo() {
		return artistInfo;
	}

	public void setFavoriteCounter(Integer favoriteCounter) {
		this.favoriteCounter = favoriteCounter;
	}

	public Integer getFavoriteCounter() {
		return favoriteCounter;
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
				.append("artistName", getArtistName()).append("artistInfo", getArtistInfo())
				.append("favoriteCounter", getFavoriteCounter()).append("remark", getRemark())
				.append("delFlag", getDelFlag()).append("createBy", getCreateBy()).append("createTime", getCreateTime())
				.append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).toString();
	}
}
