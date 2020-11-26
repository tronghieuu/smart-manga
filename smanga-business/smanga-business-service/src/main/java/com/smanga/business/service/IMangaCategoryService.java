package com.smanga.business.service;

import java.util.List;

import com.smanga.business.domain.MangaCategory;

/**
 * Manga CategoryService interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface IMangaCategoryService {
	/**
	 * Query Manga Category
	 * 
	 * @param id Manga CategoryID
	 * @return Manga Category
	 */
	public MangaCategory selectMangaCategoryById(Long id);

	/**
	 * Query the list of Manga Category
	 * 
	 * @param mangaCategory Manga Category
	 * @return Manga Category collection
	 */
	public List<MangaCategory> selectMangaCategoryList(MangaCategory mangaCategory);

	/**
	 * Add Manga Category
	 * 
	 * @param mangaCategory Manga Category
	 * @return result
	 */
	public int insertMangaCategory(MangaCategory mangaCategory);

	/**
	 * Modify Manga Category
	 * 
	 * @param mangaCategory Manga Category
	 * @return result
	 */
	public int updateMangaCategory(MangaCategory mangaCategory);

	/**
	 * Batch delete Manga Category
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	public int deleteMangaCategoryByIds(String ids);

	/**
	 * Delete Manga Category information
	 * 
	 * @param id Manga CategoryID
	 * @return result
	 */
	public int deleteMangaCategoryById(Long id);

	/**
	 * Check category name unique
	 * 
	 * @param mangaCategory
	 * @return result
	 */
	public String checkCategoryNameUnique(MangaCategory mangaCategory);
}
