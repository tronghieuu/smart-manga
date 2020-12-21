package com.smanga.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.business.domain.RecommendManga;
import com.smanga.business.mapper.RecommendMangaMapper;
import com.smanga.business.service.IRecommendMangaService;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DateUtils;

/**
 * List manga rating predict by systemService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
@Service
public class RecommendMangaServiceImpl implements IRecommendMangaService {
	@Autowired
	private RecommendMangaMapper recommendMangaMapper;

	/**
	 * Query List manga rating predict by system
	 * 
	 * @param id List manga rating predict by systemID
	 * @return List manga rating predict by system
	 */
	@Override
	public RecommendManga selectRecommendMangaById(Long id) {
		return recommendMangaMapper.selectRecommendMangaById(id);
	}

	/**
	 * Query the list of List manga rating predict by system
	 * 
	 * @param recommendManga List manga rating predict by system
	 * @return List manga rating predict by system
	 */
	@Override
	public List<RecommendManga> selectRecommendMangaList(RecommendManga recommendManga) {
		return recommendMangaMapper.selectRecommendMangaList(recommendManga);
	}

	/**
	 * Add List manga rating predict by system
	 * 
	 * @param recommendManga List manga rating predict by system
	 * @return result
	 */
	@Override
	public int insertRecommendManga(RecommendManga recommendManga) {
		recommendManga.setCreateTime(DateUtils.getNowDate());
		return recommendMangaMapper.insertRecommendManga(recommendManga);
	}

	/**
	 * Modify List manga rating predict by system
	 * 
	 * @param recommendManga List manga rating predict by system
	 * @return result
	 */
	@Override
	public int updateRecommendManga(RecommendManga recommendManga) {
		recommendManga.setUpdateTime(DateUtils.getNowDate());
		return recommendMangaMapper.updateRecommendManga(recommendManga);
	}

	/**
	 * Delete List manga rating predict by system object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteRecommendMangaByIds(String ids) {
		return recommendMangaMapper.deleteRecommendMangaByIds(Convert.toStrArray(ids));
	}

	/**
	 * Delete List manga rating predict by system information
	 * 
	 * @param id List manga rating predict by systemID
	 * @return result
	 */
	@Override
	public int deleteRecommendMangaById(Long id) {
		return recommendMangaMapper.deleteRecommendMangaById(id);
	}

	/**
	 * Delete all
	 * 
	 * @return
	 */
	@Override
	public int deleteAll() {
		return recommendMangaMapper.deleteAll();
	}
}
