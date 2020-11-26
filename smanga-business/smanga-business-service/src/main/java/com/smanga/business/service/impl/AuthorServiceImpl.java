package com.smanga.business.service.impl;

import java.util.List;
import com.smanga.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smanga.business.mapper.AuthorMapper;
import com.smanga.business.domain.Author;
import com.smanga.business.service.IAuthorService;
import com.smanga.common.core.text.Convert;

/**
 * AuthorService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Service
public class AuthorServiceImpl implements IAuthorService 
{
    @Autowired
    private AuthorMapper authorMapper;

    /**
     * Query Author
     * 
     * @param id AuthorID
     * @return Author
     */
    @Override
    public Author selectAuthorById(Long id)
    {
        return authorMapper.selectAuthorById(id);
    }

    /**
     * Query the list of Author
     * 
     * @param author Author
     * @return Author
     */
    @Override
    public List<Author> selectAuthorList(Author author)
    {
        return authorMapper.selectAuthorList(author);
    }

    /**
     * Add Author
     * 
     * @param author Author
     * @return result
     */
    @Override
    public int insertAuthor(Author author)
    {
        author.setCreateTime(DateUtils.getNowDate());
        return authorMapper.insertAuthor(author);
    }

    /**
     * Modify Author
     * 
     * @param author Author
     * @return result
     */
    @Override
    public int updateAuthor(Author author)
    {
        author.setUpdateTime(DateUtils.getNowDate());
        return authorMapper.updateAuthor(author);
    }

    /**
     * Delete Author object
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    @Override
    public int deleteAuthorByIds(String ids)
    {
        return authorMapper.deleteAuthorByIds(Convert.toStrArray(ids));
    }

    /**
     * Delete Author information
     * 
     * @param id AuthorID
     * @return result
     */
    @Override
    public int deleteAuthorById(Long id)
    {
        return authorMapper.deleteAuthorById(id);
    }
}
