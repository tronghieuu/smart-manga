package com.smanga.business.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.business.domain.MangaChapter;
import com.smanga.business.mapper.MangaChapterMapper;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DateUtils;

/**
 * Manga ChapterService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Service
public class MangaChapterServiceImpl implements IMangaChapterService {
	@Autowired
	private MangaChapterMapper mangaChapterMapper;

	/**
	 * Query Manga Chapter
	 * 
	 * @param id Manga ChapterID
	 * @return Manga Chapter
	 */
	@Override
	public MangaChapter selectMangaChapterById(Long id) {
		return mangaChapterMapper.selectMangaChapterById(id);
	}

	/**
	 * Query the list of Manga Chapter
	 * 
	 * @param mangaChapter Manga Chapter
	 * @return Manga Chapter
	 */
	@Override
	public List<MangaChapter> selectMangaChapterList(MangaChapter mangaChapter) {
		return mangaChapterMapper.selectMangaChapterList(mangaChapter);
	}

	/**
	 * Add Manga Chapter
	 * 
	 * @param mangaChapter Manga Chapter
	 * @return result
	 */
	@Override
	public int insertMangaChapter(MangaChapter mangaChapter) {
		mangaChapter.setCreateTime(DateUtils.getNowDate());
		return mangaChapterMapper.insertMangaChapter(mangaChapter);
	}

	/**
	 * Modify Manga Chapter
	 * 
	 * @param mangaChapter Manga Chapter
	 * @return result
	 */
	@Override
	public int updateMangaChapter(MangaChapter mangaChapter) {
		mangaChapter.setUpdateTime(DateUtils.getNowDate());
		return mangaChapterMapper.updateMangaChapter(mangaChapter);
	}

	/**
	 * Delete Manga Chapter object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteMangaChapterByIds(String ids) {
		return mangaChapterMapper.deleteMangaChapterByIds(Convert.toStrArray(ids));
	}

	/**
	 * Delete Manga Chapter information
	 * 
	 * @param id Manga ChapterID
	 * @return result
	 */
	@Override
	public int deleteMangaChapterById(Long id) {
		return mangaChapterMapper.deleteMangaChapterById(id);
	}

	/**
	 * Select manga chapter latest list
	 * 
	 * @param mangaChapter
	 * @return
	 */
	@Override
	public List<MangaChapter> selectMangaChapterLatestList(MangaChapter mangaChapter) {
		return mangaChapterMapper.selectMangaChapterLatestList(mangaChapter);
	}

	/**
	 * Select chapter list for manga
	 * 
	 * @param mangaChapter
	 * @return
	 */
	@Override
	public List<MangaChapter> selectChapterListForManga(MangaChapter mangaChapter) {
		return mangaChapterMapper.selectChapterListForManga(mangaChapter);
	}

	/**
	 * Select most popular chapter
	 * 
	 * @param mangaChapter
	 * @return
	 */
	@Override
	public List<MangaChapter> selectMostPopularChapter(MangaChapter mangaChapter) {
		return mangaChapterMapper.selectMostPopularChapter(mangaChapter);
	}

	/**
	 * Get first chapter
	 * 
	 * @param mangaId
	 * @return
	 */
	@Override
	public MangaChapter getFirstChapter(Long mangaId) {
		return mangaChapterMapper.getFirstChapter(mangaId);
	}

	/**
	 * Get last chapter
	 * 
	 * @param mangaId
	 * @return
	 */
	@Override
	public MangaChapter getLastChapter(Long mangaId) {
		return mangaChapterMapper.getLastChapter(mangaId);
	}

	/**
	 * Get next chapter
	 * 
	 * @param mangaId
	 * @param chapterIndex
	 * @return
	 */
	@Override
	public MangaChapter getNextChapter(@Param("mangaId") Long mangaId, @Param("chapterIndex") String chapterIndex) {
		return mangaChapterMapper.getNextChapter(mangaId, chapterIndex);
	}

	/**
	 * Get previous chapter
	 * 
	 * @param mangaId
	 * @param chapterIndex
	 * @return
	 */
	@Override
	public MangaChapter getPreviousChapter(@Param("mangaId") Long mangaId, @Param("chapterIndex") String chapterIndex) {
		return mangaChapterMapper.getPreviousChapter(mangaId, chapterIndex);
	}
}
