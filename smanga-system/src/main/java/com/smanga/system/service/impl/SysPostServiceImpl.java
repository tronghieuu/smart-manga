package com.smanga.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.StringUtils;
import com.smanga.system.domain.SysPost;
import com.smanga.system.mapper.SysPostMapper;
import com.smanga.system.mapper.SysUserPostMapper;
import com.smanga.system.service.ISysPostService;

/**
 * Job information service layer processing
 *
 * @author Trong Hieu
 */
@Service
public class SysPostServiceImpl implements ISysPostService {
	@Autowired
	private SysPostMapper postMapper;

	@Autowired
	private SysUserPostMapper userPostMapper;

	/**
	 * Query job information collection
	 *
	 * @param post job information
	 * @return Post information collection
	 */
	@Override
	public List<SysPost> selectPostList(SysPost post) {
		return postMapper.selectPostList(post);
	}

	/**
	 * Query all positions
	 *
	 * @return post list
	 */
	@Override
	public List<SysPost> selectPostAll() {
		return postMapper.selectPostAll();
	}

	/**
	 * Query position based on user ID
	 *
	 * @param userId user ID
	 * @return post list
	 */
	@Override
	public List<SysPost> selectPostsByUserId(Long userId) {
		List<SysPost> userPosts = postMapper.selectPostsByUserId(userId);
		List<SysPost> posts = postMapper.selectPostAll();
		for (SysPost post : posts) {
			for (SysPost userRole : userPosts) {
				if (post.getPostId().longValue() == userRole.getPostId().longValue()) {
					post.setFlag(true);
					break;
				}
			}
		}
		return posts;
	}

	/**
	 * Query job information through job ID
	 *
	 * @param postId post ID
	 * @return role object information
	 */
	@Override
	public SysPost selectPostById(Long postId) {
		return postMapper.selectPostById(postId);
	}

	/**
	 * Delete job information in bulk
	 *
	 * @param ids ID of the data to be deleted
	 * @throws Exception
	 */
	@Override
	public int deletePostByIds(String ids) throws BusinessException {
		Long[] postIds = Convert.toLongArray(ids);
		for (Long postId : postIds) {
			SysPost post = selectPostById(postId);
			if (countUserPostById(postId) > 0) {
				throw new BusinessException(
						String.format("%1$s has been allocated and cannot be deleted", post.getPostName()));
			}
		}
		return postMapper.deletePostByIds(postIds);
	}

	/**
	 * Added save job information
	 * 
	 * @param post Job information
	 * @return result
	 */
	@Override
	public int insertPost(SysPost post) {
		return postMapper.insertPost(post);
	}

	/**
	 * Modify and save post information
	 *
	 * @param post job information
	 * @return result
	 */
	@Override
	public int updatePost(SysPost post) {
		return postMapper.updatePost(post);
	}

	/**
	 * Query the number of posts used by post ID
	 *
	 * @param postId post ID
	 * @return result
	 */
	@Override
	public int countUserPostById(Long postId) {
		return userPostMapper.countUserPostById(postId);
	}

	/**
	 * Verify that the job name is unique
	 *
	 * @param post job information
	 * @return result
	 */
	@Override
	public String checkPostNameUnique(SysPost post) {
		Long postId = StringUtils.isNull(post.getPostId()) ? -1L : post.getPostId();
		SysPost info = postMapper.checkPostNameUnique(post.getPostName());
		if (StringUtils.isNotNull(info) && info.getPostId().longValue() != postId.longValue()) {
			return UserConstants.POST_NAME_NOT_UNIQUE;
		}
		return UserConstants.POST_NAME_UNIQUE;
	}

	/**
	 * Check whether the post code is unique
	 *
	 * @param post job information
	 * @return result
	 */
	@Override
	public String checkPostCodeUnique(SysPost post) {
		Long postId = StringUtils.isNull(post.getPostId()) ? -1L : post.getPostId();
		SysPost info = postMapper.checkPostCodeUnique(post.getPostCode());
		if (StringUtils.isNotNull(info) && info.getPostId().longValue() != postId.longValue()) {
			return UserConstants.POST_CODE_NOT_UNIQUE;
		}
		return UserConstants.POST_CODE_UNIQUE;
	}
}
