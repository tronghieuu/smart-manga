package com.smanga.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.business.domain.MangaCategory;
import com.smanga.business.mapper.MangaCategoryMapper;
import com.smanga.business.service.IMangaCategoryService;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DateUtils;

/**
 * Manga CategoryService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Service
public class MangaCategoryServiceImpl implements IMangaCategoryService {
	@Autowired
	private MangaCategoryMapper mangaCategoryMapper;

	/**
	 * Query Manga Category
	 * 
	 * @param id Manga CategoryID
	 * @return Manga Category
	 */
	@Override
	public MangaCategory selectMangaCategoryById(Long id) {
		return mangaCategoryMapper.selectMangaCategoryById(id);
	}

	/**
	 * Query the list of Manga Category
	 * 
	 * @param mangaCategory Manga Category
	 * @return Manga Category
	 */
	@Override
	public List<MangaCategory> selectMangaCategoryList(MangaCategory mangaCategory) {
		return mangaCategoryMapper.selectMangaCategoryList(mangaCategory);
	}

	/**
	 * Add Manga Category
	 * 
	 * @param mangaCategory Manga Category
	 * @return result
	 */
	@Override
	public int insertMangaCategory(MangaCategory mangaCategory) {
		mangaCategory.setCreateTime(DateUtils.getNowDate());
		return mangaCategoryMapper.insertMangaCategory(mangaCategory);
	}

	/**
	 * Modify Manga Category
	 * 
	 * @param mangaCategory Manga Category
	 * @return result
	 */
	@Override
	public int updateMangaCategory(MangaCategory mangaCategory) {
		mangaCategory.setUpdateTime(DateUtils.getNowDate());
		return mangaCategoryMapper.updateMangaCategory(mangaCategory);
	}

	/**
	 * Delete Manga Category object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteMangaCategoryByIds(String ids) {
		return mangaCategoryMapper.deleteMangaCategoryByIds(Convert.toStrArray(ids));
	}

	/**
	 * Delete Manga Category information
	 * 
	 * @param id Manga CategoryID
	 * @return result
	 */
	@Override
	public int deleteMangaCategoryById(Long id) {
		return mangaCategoryMapper.deleteMangaCategoryById(id);
	}

	/**
	 * Check category name unique
	 * 
	 * @param mangaCategory
	 * @return result
	 */
	@Override
	public String checkCategoryNameUnique(MangaCategory mangaCategory) {
		if (mangaCategoryMapper.countMangaCategory(mangaCategory) == 0) {
			return SmangaConstants.UNIQUE;
		}
		return SmangaConstants.NOT_UNIQUE;
	}
}
