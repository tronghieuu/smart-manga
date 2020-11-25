package com.smanga.system.service;

import java.util.List;

import com.smanga.system.domain.SysPost;

/**
 * Job information service layer
 *
 * @author Trong Hieu
 */
public interface ISysPostService
{
    /**
     * Query job information collection
     *
     * @param post job information
     * @return Post information collection
     */
    public List<SysPost> selectPostList(SysPost post);

    /**
     * Query all positions
     *
     * @return post list
     */
    public List<SysPost> selectPostAll();

    /**
     * Query position based on user ID
     *
     * @param userId user ID
     * @return post list
     */
    public List<SysPost> selectPostsByUserId(Long userId);

    /**
     * Query job information through job ID
     *
     * @param postId post ID
     * @return role object information
     */
    public SysPost selectPostById(Long postId);

    /**
     * Delete job information in bulk
     *
     * @param ids ID of the data to be deleted
     * @return result
     * @throws Exception
     */
    public int deletePostByIds(String ids) throws Exception;

    /**
     * Added save job information
     *
     * @param post job information
     * @return result
     */
    public int insertPost(SysPost post);

    /**
     * Modify and save post information
     *
     * @param post job information
     * @return result
     */
    public int updatePost(SysPost post);

    /**
     * Query the number of positions used by the position ID
     *
     * @param postId post ID
     * @return result
     */
    public int countUserPostById(Long postId);

    /**
     * Check post name
     *
     * @param post job information
     * @return result
     */
    public String checkPostNameUnique(SysPost post);

    /**
     * Check post code
     *
     * @param post job information
     * @return result
     */
    public String checkPostCodeUnique(SysPost post);
}
