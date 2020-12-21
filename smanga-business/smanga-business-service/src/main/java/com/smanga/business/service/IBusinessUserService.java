package com.smanga.business.service;

import java.util.List;

import com.smanga.business.domain.BusinessUser;

/**
 * Business User Information FormService interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface IBusinessUserService {
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
	 * Batch delete Business User Information Form
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	public int deleteBusinessUserByIds(String ids);

	/**
	 * Delete Business User Information Form information
	 * 
	 * @param userId Business User Information FormID
	 * @return result
	 */
	public int deleteBusinessUserById(Long userId);

	/**
	 * Check unique login account name
	 * 
	 * @param user
	 * @return
	 */
	public String checkLoginNameUnique(BusinessUser user);

	/**
	 * Check unique phone number
	 * 
	 * @param user
	 * @return
	 */
	public String checkPhoneUnique(BusinessUser user);

	/**
	 * Check unique email
	 * 
	 * @param user
	 * @return
	 */
	public String checkEmailUnique(BusinessUser user);

	/**
	 * Query users by username
	 *
	 * @param userName username
	 * @return user object information
	 */
	public BusinessUser selectUserByLoginName(String userName);
}
