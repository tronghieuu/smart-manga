package com.smanga.business.mapper;

import java.util.List;
import com.smanga.business.domain.Author;

/**
 * AuthorMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface AuthorMapper 
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
     * Delete Author
     * 
     * @param id AuthorID
     * @return result
     */
    public int deleteAuthorById(Long id);

    /**
     * Batch delete Author
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteAuthorByIds(String[] ids);
}
