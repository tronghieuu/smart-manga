package com.smanga.business.mapper;

import java.util.List;
import com.smanga.business.domain.Manga;

/**
 * MangaMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface MangaMapper 
{
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
     * Delete Manga
     * 
     * @param id MangaID
     * @return result
     */
    public int deleteMangaById(Long id);

    /**
     * Batch delete Manga
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteMangaByIds(String[] ids);
}
