package com.smanga.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.business.domain.BusinessUser;
import com.smanga.business.mapper.BusinessUserMapper;
import com.smanga.business.service.IBusinessUserService;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DateUtils;

/**
 * Business User Information FormService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Service
public class BusinessUserServiceImpl implements IBusinessUserService {
	@Autowired
	private BusinessUserMapper businessUserMapper;

	/**
	 * Query Business User Information Form
	 * 
	 * @param userId Business User Information FormID
	 * @return Business User Information Form
	 */
	@Override
	public BusinessUser selectBusinessUserById(Long userId) {
		return businessUserMapper.selectBusinessUserById(userId);
	}

	/**
	 * Query the list of Business User Information Form
	 * 
	 * @param businessUser Business User Information Form
	 * @return Business User Information Form
	 */
	@Override
	public List<BusinessUser> selectBusinessUserList(BusinessUser businessUser) {
		return businessUserMapper.selectBusinessUserList(businessUser);
	}

	/**
	 * Add Business User Information Form
	 * 
	 * @param businessUser Business User Information Form
	 * @return result
	 */
	@Override
	public int insertBusinessUser(BusinessUser businessUser) {
		businessUser.setCreateTime(DateUtils.getNowDate());
		return businessUserMapper.insertBusinessUser(businessUser);
	}

	/**
	 * Modify Business User Information Form
	 * 
	 * @param businessUser Business User Information Form
	 * @return result
	 */
	@Override
	public int updateBusinessUser(BusinessUser businessUser) {
		businessUser.setUpdateTime(DateUtils.getNowDate());
		return businessUserMapper.updateBusinessUser(businessUser);
	}

	/**
	 * Delete Business User Information Form object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteBusinessUserByIds(String ids) {
		return businessUserMapper.deleteBusinessUserByIds(Convert.toStrArray(ids));
	}

	/**
	 * Delete Business User Information Form information
	 * 
	 * @param userId Business User Information FormID
	 * @return result
	 */
	@Override
	public int deleteBusinessUserById(Long userId) {
		return businessUserMapper.deleteBusinessUserById(userId);
	}

	/**
	 * Check unique login account name
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public String checkLoginNameUnique(BusinessUser user) {
		if (businessUserMapper.countBusinessUserAccount(user) == 0) {
			return SmangaConstants.UNIQUE;
		}
		return SmangaConstants.NOT_UNIQUE;
	}

	/**
	 * Check unique phone number
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public String checkPhoneUnique(BusinessUser user) {
		if (businessUserMapper.countBusinessUserAccount(user) == 0) {
			return SmangaConstants.UNIQUE;
		}
		return SmangaConstants.NOT_UNIQUE;
	}

	/**
	 * Check unique email
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public String checkEmailUnique(BusinessUser user) {
		if (businessUserMapper.countBusinessUserAccount(user) == 0) {
			return SmangaConstants.UNIQUE;
		}
		return SmangaConstants.NOT_UNIQUE;
	}
}
