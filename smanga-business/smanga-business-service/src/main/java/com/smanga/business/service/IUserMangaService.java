package com.smanga.business.service;

import java.util.List;
import java.util.Map;

import com.smanga.business.domain.UserManga;

/**
 * Information of manga rate by userService interface
 * 
 * @author Trong Hieu
 * @date 2020-12-20
 */
public interface IUserMangaService {
	/**
	 * Query Information of manga rate by user
	 * 
	 * @param id Information of manga rate by userID
	 * @return Information of manga rate by user
	 */
	public UserManga selectUserMangaById(Long id);

	/**
	 * Query the list of Information of manga rate by user
	 * 
	 * @param userManga Information of manga rate by user
	 * @return Information of manga rate by user collection
	 */
	public List<UserManga> selectUserMangaList(UserManga userManga);

	/**
	 * Add Information of manga rate by user
	 * 
	 * @param userManga Information of manga rate by user
	 * @return result
	 */
	public int insertUserManga(UserManga userManga);

	/**
	 * Modify Information of manga rate by user
	 * 
	 * @param userManga Information of manga rate by user
	 * @return result
	 */
	public int updateUserManga(UserManga userManga);

	/**
	 * Batch delete Information of manga rate by user
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	public int deleteUserMangaByIds(String ids);

	/**
	 * Delete Information of manga rate by user information
	 * 
	 * @param id Information of manga rate by userID
	 * @return result
	 */
	public int deleteUserMangaById(Long id);

	/**
	 * Get rating info by manga id
	 * 
	 * @param mangaId
	 * @return
	 */
	public Map<String, Object> getRatingInfo(Long mangaId);
}
