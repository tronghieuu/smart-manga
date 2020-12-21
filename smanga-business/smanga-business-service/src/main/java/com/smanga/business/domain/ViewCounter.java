package com.smanga.business.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * List of ip prevent count view multiple time object view_counter
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
public class ViewCounter extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** Serial index */
	private Long id;

	/** Ip user */
	@Excel(name = "Ip user")
	private String ip;

	/** Expired time, user view can be counter after this time */
	@Excel(name = "Expired time, user view can be counter after this time", width = 30, dateFormat = "yyyy-MM-dd")
	private Date expiredTime;

	/** Chapter id */
	@Excel(name = "Chapter id")
	private Long chapterId;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getIp() {
		return ip;
	}

	public void setExpiredTime(Date expiredTime) {
		this.expiredTime = expiredTime;
	}

	public Date getExpiredTime() {
		return expiredTime;
	}

	public Long getChapterId() {
		return chapterId;
	}

	public void setChapterId(Long chapterId) {
		this.chapterId = chapterId;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId()).append("ip", getIp())
				.append("expiredTime", getExpiredTime()).append("createTime", getCreateTime())
				.append("chapterId", getChapterId()).toString();
	}
}
