package com.smanga.business.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smanga.business.domain.BusinessUser;
import com.smanga.common.core.controller.BaseController;
import com.smanga.framework.shiro.util.ShiroUtils;

/**
 * @author Trong Hieu
 *
 */
public class BusinessBaseController extends BaseController {

	protected static final Logger logger = LoggerFactory.getLogger(BusinessBaseController.class);

	public BusinessUser getUserInfo() {
		return ShiroUtils.getSysUser();
	}

	public String getUserIp() {
		return ShiroUtils.getIp();
	}
}
