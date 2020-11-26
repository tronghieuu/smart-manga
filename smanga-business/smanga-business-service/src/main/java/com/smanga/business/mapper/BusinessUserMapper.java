package com.smanga.business.mapper;

import java.util.List;

import com.smanga.business.domain.BusinessUser;

/**
 * Business User Information FormMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface BusinessUserMapper {
	/**
	 * Query Business User Information Form
	 * 
	 * @param userId Business User Information FormID
	 * @return Business User Information Form
	 */
	public BusinessUser selectBusinessUserById(Long userId);

	/**
	 * Query the list of Business User Information Form
	 * 
	 * @param businessUser Business User Information Form
	 * @return Business User Information Form collection
	 */
	public List<BusinessUser> selectBusinessUserList(BusinessUser businessUser);

	/**
	 * Add Business User Information Form
	 * 
	 * @param businessUser Business User Information Form
	 * @return result
	 */
	public int insertBusinessUser(BusinessUser businessUser);

	/**
	 * Modify Business User Information Form
	 * 
	 * @param businessUser Business User Information Form
	 * @return result
	 */
	public int updateBusinessUser(BusinessUser businessUser);

	/**
	 * Delete Business User Information Form
	 * 
	 * @param userId Business User Information FormID
	 * @return result
	 */
	public int deleteBusinessUserById(Long userId);

	/**
	 * Batch delete Business User Information Form
	 * 
	 * @param userIds ID of the data to be deleted
	 * @return result
	 */
	public int deleteBusinessUserByIds(String[] userIds);

	/**
	 * Count number of business user account match condition
	 * 
	 * @param user
	 * @return result
	 */
	public int countBusinessUserAccount(BusinessUser user);
}
