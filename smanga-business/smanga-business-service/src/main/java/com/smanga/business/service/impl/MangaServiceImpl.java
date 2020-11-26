package com.smanga.business.service.impl;

import java.util.List;
import com.smanga.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smanga.business.mapper.MangaMapper;
import com.smanga.business.domain.Manga;
import com.smanga.business.service.IMangaService;
import com.smanga.common.core.text.Convert;

/**
 * MangaService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Service
public class MangaServiceImpl implements IMangaService 
{
    @Autowired
    private MangaMapper mangaMapper;

    /**
     * Query Manga
     * 
     * @param id MangaID
     * @return Manga
     */
    @Override
    public Manga selectMangaById(Long id)
    {
        return mangaMapper.selectMangaById(id);
    }

    /**
     * Query the list of Manga
     * 
     * @param manga Manga
     * @return Manga
     */
    @Override
    public List<Manga> selectMangaList(Manga manga)
    {
        return mangaMapper.selectMangaList(manga);
    }

    /**
     * Add Manga
     * 
     * @param manga Manga
     * @return result
     */
    @Override
    public int insertManga(Manga manga)
    {
        manga.setCreateTime(DateUtils.getNowDate());
        return mangaMapper.insertManga(manga);
    }

    /**
     * Modify Manga
     * 
     * @param manga Manga
     * @return result
     */
    @Override
    public int updateManga(Manga manga)
    {
        manga.setUpdateTime(DateUtils.getNowDate());
        return mangaMapper.updateManga(manga);
    }

    /**
     * Delete Manga object
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    @Override
    public int deleteMangaByIds(String ids)
    {
        return mangaMapper.deleteMangaByIds(Convert.toStrArray(ids));
    }

    /**
     * Delete Manga information
     * 
     * @param id MangaID
     * @return result
     */
    @Override
    public int deleteMangaById(Long id)
    {
        return mangaMapper.deleteMangaById(id);
    }
}
