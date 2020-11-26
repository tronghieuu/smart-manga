package com.smanga.business.mapper;

import java.util.List;
import com.smanga.business.domain.MangaChapter;

/**
 * Manga ChapterMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface MangaChapterMapper 
{
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
     * Delete Manga Chapter
     * 
     * @param id Manga ChapterID
     * @return result
     */
    public int deleteMangaChapterById(Long id);

    /**
     * Batch delete Manga Chapter
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteMangaChapterByIds(String[] ids);
}
