package com.smanga.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Information of manga rate by user object user_manga
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
public class UserManga extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** Serial index */
	private Long id;

	/** User id */
	@Excel(name = "User id")
	private Long userId;

	/** Manga id */
	@Excel(name = "Manga id")
	private Long mangaId;

	/** Manga is bookmark (0: not bookmark, 1: bookmarked) */
	@Excel(name = "Manga is bookmark (0: not bookmark, 1: bookmarked)")
	private Integer bookmark;

	/** User name */
	@Excel(name = "User name")
	private String userName;

	/** Manga name */
	@Excel(name = "Manga name")
	private String mangaName;

	/**  */
	@Excel(name = "")
	private Long rating;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setMangaId(Long mangaId) {
		this.mangaId = mangaId;
	}

	public Long getMangaId() {
		return mangaId;
	}

	public void setBookmark(Integer bookmark) {
		this.bookmark = bookmark;
	}

	public Integer getBookmark() {
		return bookmark;
	}

	public void setRating(Long rating) {
		this.rating = rating;
	}

	public Long getRating() {
		return rating;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMangaName() {
		return mangaName;
	}

	public void setMangaName(String mangaName) {
		this.mangaName = mangaName;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
				.append("userId", getUserId()).append("mangaId", getMangaId()).append("bookmark", getBookmark())
				.append("rating", getRating()).append("createBy", getCreateBy()).append("createTime", getCreateTime())
				.append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).append("params", getParams())
				.append("userName", getUserName()).append("mangaName", getMangaName()).toString();
	}
}
