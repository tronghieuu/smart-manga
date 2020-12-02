package com.smanga.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Manga Chapter object manga_chapter
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public class MangaChapter extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** Serial ID */
	private Long id;

	/** Manga name */
	@Excel(name = "Manga name")
	private String chapterName;

	/** Index of chapter in manga */
	@Excel(name = "Index of chapter in manga")
	private String chapterIndex;

	/** Language of chapter */
	@Excel(name = "Language of chapter")
	private String chapterLang;

	/** Image paths with multipe image seperated by comma */
	@Excel(name = "Image paths with multipe image seperated by comma")
	private String chapterImages;

	/** Image ids with multipe image seperated by comma */
	@Excel(name = "Image ids with multipe image seperated by comma")
	private String chapterImageIds;

	/** Author name of manga */
	@Excel(name = "Author name of manga")
	private Long mangaId;

	/** Number of reader read this chapter */
	@Excel(name = "Number of reader read this chapter")
	private Integer viewCounter;

	/** Number of reader like this chapter */
	@Excel(name = "Number of reader like this chapter")
	private Integer favoriteCounter;

	/** Chapter status (1 enabled 0 disabled) */
	@Excel(name = "Chapter status (1 enabled 0 disabled)")
	private String status;

	/** Delete flag (0 means existence 1 means deletion) */
	private String delFlag;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterIndex(String chapterIndex) {
		this.chapterIndex = chapterIndex;
	}

	public String getChapterIndex() {
		return chapterIndex;
	}

	public void setChapterLang(String chapterLang) {
		this.chapterLang = chapterLang;
	}

	public String getChapterLang() {
		return chapterLang;
	}

	public void setChapterImages(String chapterImages) {
		this.chapterImages = chapterImages;
	}

	public String getChapterImages() {
		return chapterImages;
	}

	public void setChapterImageIds(String chapterImageIds) {
		this.chapterImageIds = chapterImageIds;
	}

	public String getChapterImageIds() {
		return chapterImageIds;
	}

	public void setMangaId(Long mangaId) {
		this.mangaId = mangaId;
	}

	public Long getMangaId() {
		return mangaId;
	}

	public void setViewCounter(Integer viewCounter) {
		this.viewCounter = viewCounter;
	}

	public Integer getViewCounter() {
		return viewCounter;
	}

	public void setFavoriteCounter(Integer favoriteCounter) {
		this.favoriteCounter = favoriteCounter;
	}

	public Integer getFavoriteCounter() {
		return favoriteCounter;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
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
				.append("chapterName", getChapterName()).append("chapterIndex", getChapterIndex())
				.append("chapterLang", getChapterLang()).append("chapterImages", getChapterImages())
				.append("chapterImageIds", getChapterImageIds()).append("mangaId", getMangaId())
				.append("viewCounter", getViewCounter()).append("favoriteCounter", getFavoriteCounter())
				.append("remark", getRemark()).append("status", getStatus()).append("delFlag", getDelFlag())
				.append("createBy", getCreateBy()).append("createTime", getCreateTime())
				.append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).toString();
	}
}
