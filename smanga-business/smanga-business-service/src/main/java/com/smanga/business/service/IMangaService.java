package com.smanga.business.service;

import java.util.List;

import com.smanga.business.domain.Manga;

/**
 * MangaService interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface IMangaService {
	/**
	 * Query Manga
	 * 
	 * @param id MangaID
	 * @return Manga
	 */
	public Manga selectMangaById(Long id);

	/**
	 * Query the list of Manga
	 * 
	 * @param manga Manga
	 * @return Manga collection
	 */
	public List<Manga> selectMangaList(Manga manga);

	/**
	 * Add Manga
	 * 
	 * @param manga Manga
	 * @return result
	 */
	public int insertManga(Manga manga);

	/**
	 * Modify Manga
	 * 
	 * @param manga Manga
	 * @return result
	 */
	public int updateManga(Manga manga);

	/**
	 * Batch delete Manga
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	public int deleteMangaByIds(String ids);

	/**
	 * Delete Manga information
	 * 
	 * @param id MangaID
	 * @return result
	 */
	public int deleteMangaById(Long id);

	/**
	 * Select most popular manga list
	 * 
	 * @param manga
	 * @return
	 */
	public List<Manga> selectMostPopularMangaList(Manga manga);

	/**
	 * Select recommend manga list
	 * 
	 * @param manga
	 * @return
	 */
	public List<Manga> selectRecommendMangaList(Manga manga);
}
