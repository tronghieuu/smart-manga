package com.smanga.business.service;

import java.util.List;

import com.smanga.business.domain.MangaChapter;

/**
 * Manga ChapterService interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface IMangaChapterService {
	/**
	 * Query Manga Chapter
	 * 
	 * @param id Manga ChapterID
	 * @return Manga Chapter
	 */
	public MangaChapter selectMangaChapterById(Long id);

	/**
	 * Query the list of Manga Chapter
	 * 
	 * @param mangaChapter Manga Chapter
	 * @return Manga Chapter collection
	 */
	public List<MangaChapter> selectMangaChapterList(MangaChapter mangaChapter);

	/**
	 * Add Manga Chapter
	 * 
	 * @param mangaChapter Manga Chapter
	 * @return result
	 */
	public int insertMangaChapter(MangaChapter mangaChapter);

	/**
	 * Modify Manga Chapter
	 * 
	 * @param mangaChapter Manga Chapter
	 * @return result
	 */
	public int updateMangaChapter(MangaChapter mangaChapter);

	/**
	 * Batch delete Manga Chapter
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	public int deleteMangaChapterByIds(String ids);

	/**
	 * Delete Manga Chapter information
	 * 
	 * @param id Manga ChapterID
	 * @return result
	 */
	public int deleteMangaChapterById(Long id);

	/**
	 * Select manga chapter latest list
	 * 
	 * @param mangaChapter
	 * @return
	 */
	public List<MangaChapter> selectMangaChapterLatestList(MangaChapter mangaChapter);

	/**
	 * Select chapter list for manga
	 * 
	 * @param mangaChapter
	 * @return
	 */
	public List<MangaChapter> selectChapterListForManga(MangaChapter mangaChapter);
}
