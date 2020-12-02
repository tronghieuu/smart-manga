package com.smanga.business.mapper;

import java.util.List;
import com.smanga.business.domain.Artist;

/**
 * artistMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-11-29
 */
public interface ArtistMapper 
{
    /**
     * Query artist
     * 
     * @param id artistID
     * @return artist
     */
    public Artist selectArtistById(Long id);

    /**
     * Query the list of artist
     * 
     * @param artist artist
     * @return artist collection
     */
    public List<Artist> selectArtistList(Artist artist);

    /**
     * Add artist
     * 
     * @param artist artist
     * @return result
     */
    public int insertArtist(Artist artist);

    /**
     * Modify artist
     * 
     * @param artist artist
     * @return result
     */
    public int updateArtist(Artist artist);

    /**
     * Delete artist
     * 
     * @param id artistID
     * @return result
     */
    public int deleteArtistById(Long id);

    /**
     * Batch delete artist
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteArtistByIds(String[] ids);
}
