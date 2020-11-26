package com.smanga.business.service;

import java.util.List;
import com.smanga.business.domain.Author;

/**
 * AuthorService interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface IAuthorService 
{
    /**
     * Query Author
     * 
     * @param id AuthorID
     * @return Author
     */
    public Author selectAuthorById(Long id);

    /**
     * Query the list of Author
     * 
     * @param author Author
     * @return Author collection
     */
    public List<Author> selectAuthorList(Author author);

    /**
     * Add Author
     * 
     * @param author Author
     * @return result
     */
    public int insertAuthor(Author author);

    /**
     * Modify Author
     * 
     * @param author Author
     * @return result
     */
    public int updateAuthor(Author author);

    /**
     * Batch delete Author
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteAuthorByIds(String ids);

    /**
     * Delete Author information
     * 
     * @param id AuthorID
     * @return result
     */
    public int deleteAuthorById(Long id);
}
