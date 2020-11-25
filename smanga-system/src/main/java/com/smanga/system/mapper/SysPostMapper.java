package com.smanga.system.mapper;

import java.util.List;

import com.smanga.system.domain.SysPost;

/**
 * Position information Data layer
 *
 * @author Trong Hieu
 */
public interface SysPostMapper
{
    /**
     * Query job data collection
     *
     * @param post job information
     * @return post data collection
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
     */
    public int deletePostByIds(Long[] ids);

    /**
     * Modify post information
     *
     * @param post job information
     * @return result
     */
    public int updatePost(SysPost post);

    /**
     * New job information
     *
     * @param post job information
     * @return result
     */
    public int insertPost(SysPost post);

    /**
     * Check post name
     *
     * @param postName post name
     * @return result
     */
    public SysPost checkPostNameUnique(String postName);

    /**
     * Check post code
     *
     * @param postCode post code
     * @return result
     */
    public SysPost checkPostCodeUnique(String postCode);
}
