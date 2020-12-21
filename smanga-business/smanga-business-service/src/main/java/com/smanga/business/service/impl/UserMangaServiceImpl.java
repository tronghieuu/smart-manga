package com.smanga.business.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.business.domain.UserManga;
import com.smanga.business.mapper.UserMangaMapper;
import com.smanga.business.service.IUserMangaService;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DateUtils;

/**
 * Information of manga rate by userService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
@Service
public class UserMangaServiceImpl implements IUserMangaService {
	@Autowired
	private UserMangaMapper userMangaMapper;

	/**
	 * Query Information of manga rate by user
	 * 
	 * @param id Information of manga rate by userID
	 * @return Information of manga rate by user
	 */
	@Override
	public UserManga selectUserMangaById(Long id) {
		return userMangaMapper.selectUserMangaById(id);
	}

	/**
	 * Query the list of Information of manga rate by user
	 * 
	 * @param userManga Information of manga rate by user
	 * @return Information of manga rate by user
	 */
	@Override
	public List<UserManga> selectUserMangaList(UserManga userManga) {
		return userMangaMapper.selectUserMangaList(userManga);
	}

	/**
	 * Add Information of manga rate by user
	 * 
	 * @param userManga Information of manga rate by user
	 * @return result
	 */
	@Override
	public int insertUserManga(UserManga userManga) {
		userManga.setCreateTime(DateUtils.getNowDate());
		return userMangaMapper.insertUserManga(userManga);
	}

	/**
	 * Modify Information of manga rate by user
	 * 
	 * @param userManga Information of manga rate by user
	 * @return result
	 */
	@Override
	public int updateUserManga(UserManga userManga) {
		userManga.setUpdateTime(DateUtils.getNowDate());
		return userMangaMapper.updateUserManga(userManga);
	}

	/**
	 * Delete Information of manga rate by user object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteUserMangaByIds(String ids) {
		return userMangaMapper.deleteUserMangaByIds(Convert.toStrArray(ids));
	}

	/**
	 * Delete Information of manga rate by user information
	 * 
	 * @param id Information of manga rate by userID
	 * @return result
	 */
	@Override
	public int deleteUserMangaById(Long id) {
		return userMangaMapper.deleteUserMangaById(id);
	}

	/**
	 * Get rating info by manga id
	 * 
	 * @param mangaId
	 * @return
	 */
	@Override
	public Map<String, Object> getRatingInfo(Long mangaId) {
		Map<String, Object> ratingInfo = new HashMap<String, Object>();
		ratingInfo.put("rating", 0.0);
		ratingInfo.put("total", 0);

		// Get list rating
		UserManga userMangaParam = new UserManga();
		userMangaParam.setMangaId(mangaId);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("notNullRating", true);
		userMangaParam.setParams(params);
		List<UserManga> userMangas = userMangaMapper.selectUserMangaList(userMangaParam);

		// Calculate average rating
		if (CollectionUtils.isNotEmpty(userMangas)) {
			float rating = 0;
			for (UserManga userManga : userMangas) {
				rating += userManga.getRating();
			}
			rating = rating / userMangas.size();
			ratingInfo.put("rating", rating);
			ratingInfo.put("total", userMangas.size());
		}
		return ratingInfo;
	}
}
