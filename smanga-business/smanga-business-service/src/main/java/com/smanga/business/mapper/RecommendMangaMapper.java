package com.smanga.business.mapper;

import java.util.List;
import com.smanga.business.domain.RecommendManga;

/**
 * List manga rating predict by systemMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
public interface RecommendMangaMapper 
{
    /**
     * Query List manga rating predict by system
     * 
     * @param id List manga rating predict by systemID
     * @return List manga rating predict by system
     */
    public RecommendManga selectRecommendMangaById(Long id);

    /**
     * Query the list of List manga rating predict by system
     * 
     * @param recommendManga List manga rating predict by system
     * @return List manga rating predict by system collection
     */
    public List<RecommendManga> selectRecommendMangaList(RecommendManga recommendManga);

    /**
     * Add List manga rating predict by system
     * 
     * @param recommendManga List manga rating predict by system
     * @return result
     */
    public int insertRecommendManga(RecommendManga recommendManga);

    /**
     * Modify List manga rating predict by system
     * 
     * @param recommendManga List manga rating predict by system
     * @return result
     */
    public int updateRecommendManga(RecommendManga recommendManga);

    /**
     * Delete List manga rating predict by system
     * 
     * @param id List manga rating predict by systemID
     * @return result
     */
    public int deleteRecommendMangaById(Long id);

    /**
     * Batch delete List manga rating predict by system
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteRecommendMangaByIds(String[] ids);
}
