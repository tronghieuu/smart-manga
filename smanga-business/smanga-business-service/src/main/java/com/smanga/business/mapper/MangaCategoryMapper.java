package com.smanga.business.mapper;

import java.util.List;

import com.smanga.business.domain.MangaCategory;

/**
 * Manga CategoryMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface MangaCategoryMapper {
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
	 * Delete Manga Category
	 * 
	 * @param id Manga CategoryID
	 * @return result
	 */
	public int deleteMangaCategoryById(Long id);

	/**
	 * Batch delete Manga Category
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	public int deleteMangaCategoryByIds(String[] ids);

	/**
	 * Count manga category with condition
	 * 
	 * @param mangaCategory
	 * @return result
	 */
	public int countMangaCategory(MangaCategory mangaCategory);
}
