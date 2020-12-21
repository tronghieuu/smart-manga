package com.smanga.business.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.smanga.common.annotation.Excel;
import com.smanga.common.core.domain.BaseEntity;

/**
 * Manga object manga
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public class Manga extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/** Serial ID */
	private Long id;

	/** Manga name */
	@Excel(name = "Manga name")
	private String mangaName;

	/** Categories (each category seperated by comma) */
	@Excel(name = "Categories (each category seperated by comma)")
	private String categories;

	/** Category ids (String with multiple category id seperated by comma */
	@Excel(name = "Category ids (String with multiple category id seperated by comma")
	private String categoryIds;

	/** Author name of manga */
	@Excel(name = "Author name of manga")
	private String author;

	/** Id of author */
	@Excel(name = "Id of author")
	private Long authorId;

	/** Number of reader like this manga */
	@Excel(name = "Number of reader like this manga")
	private Integer favoriteCounter;

	/** Manga cover image path */
	@Excel(name = "Manga cover image path")
	private String coverImage;

	/** Id of cover image */
	@Excel(name = "Id of cover image")
	private Long coverImageId;

	/** Manga slide image path */
	@Excel(name = "Manga slide image path")
	private String slideImage;

	/** Id of slide image */
	@Excel(name = "Id of slide image")
	private Long slideImageId;

	/** Age recommend */
	@Excel(name = "Age recommend")
	private String recommendedAge;

	/** Category status (1 enabled 0 disabled) */
	@Excel(name = "Category status (1 enabled 0 disabled)")
	private String status;

	/** Delete flag (0 means existence 1 means deletion) */
	private String delFlag;

	/** Artist */
	@Excel(name = "Artist")
	private String artist;

	/** Id of artist */
	@Excel(name = "Id of artist")
	private Long artistId;

	/** Release time */
	private Date releaseTime;

	/** View counter */
	private Integer viewCounter;

	/** Status complete 0: ongoing, 1: completed */
	private Integer statusComplete;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setMangaName(String mangaName) {
		this.mangaName = mangaName;
	}

	public String getMangaName() {
		return mangaName;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategoryIds(String categoryIds) {
		this.categoryIds = categoryIds;
	}

	public String getCategoryIds() {
		return categoryIds;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}

	public Long getAuthorId() {
		return authorId;
	}

	public void setFavoriteCounter(Integer favoriteCounter) {
		this.favoriteCounter = favoriteCounter;
	}

	public Integer getFavoriteCounter() {
		return favoriteCounter;
	}

	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}

	public String getCoverImage() {
		return coverImage;
	}

	public void setCoverImageId(Long coverImageId) {
		this.coverImageId = coverImageId;
	}

	public Long getCoverImageId() {
		return coverImageId;
	}

	public void setSlideImage(String slideImage) {
		this.slideImage = slideImage;
	}

	public String getSlideImage() {
		return slideImage;
	}

	public void setSlideImageId(Long slideImageId) {
		this.slideImageId = slideImageId;
	}

	public Long getSlideImageId() {
		return slideImageId;
	}

	public void setRecommendedAge(String recommendedAge) {
		this.recommendedAge = recommendedAge;
	}

	public String getRecommendedAge() {
		return recommendedAge;
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

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public Long getArtistId() {
		return artistId;
	}

	public void setArtistId(Long artistId) {
		this.artistId = artistId;
	}

	public Date getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}

	public Integer getViewCounter() {
		return viewCounter;
	}

	public void setViewCounter(Integer viewCounter) {
		this.viewCounter = viewCounter;
	}

	public Integer getStatusComplete() {
		return statusComplete;
	}

	public void setStatusComplete(Integer statusComplete) {
		this.statusComplete = statusComplete;
	}

	@Override
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId())
				.append("mangaName", getMangaName()).append("categories", getCategories())
				.append("categoryIds", getCategoryIds()).append("author", getAuthor()).append("authorId", getAuthorId())
				.append("favoriteCounter", getFavoriteCounter()).append("remark", getRemark())
				.append("coverImage", getCoverImage()).append("coverImageId", getCoverImageId())
				.append("slideImage", getSlideImage()).append("slideImageId", getSlideImageId())
				.append("recommendedAge", getRecommendedAge()).append("status", getStatus())
				.append("delFlag", getDelFlag()).append("createBy", getCreateBy()).append("createTime", getCreateTime())
				.append("updateBy", getUpdateBy()).append("updateTime", getUpdateTime()).append("artist", getArtist())
				.append("artistId", getArtistId()).append("releaseTime", getReleaseTime())
				.append("viewCounter", getViewCounter()).append("statusComplete", getStatusComplete()).toString();
	}

	@Override
	public boolean equals(Object obj) {
		// If the object is compared with itself then return true
		if (obj == this) {
			return true;
		}

		/*
		 * Check if o is an instance of Manga or not "null instanceof [type]" also
		 * returns false
		 */
		if (!(obj instanceof Manga)) {
			return false;
		}

		Manga compareManga = (Manga) obj;
		return new EqualsBuilder().append(id, compareManga.id).isEquals();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(id).toHashCode();
	}

}
