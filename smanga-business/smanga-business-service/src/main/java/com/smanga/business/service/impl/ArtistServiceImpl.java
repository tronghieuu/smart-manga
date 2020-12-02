package com.smanga.business.service.impl;

import java.util.List;
import com.smanga.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smanga.business.mapper.ArtistMapper;
import com.smanga.business.domain.Artist;
import com.smanga.business.service.IArtistService;
import com.smanga.common.core.text.Convert;

/**
 * artistService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-11-29
 */
@Service
public class ArtistServiceImpl implements IArtistService 
{
    @Autowired
    private ArtistMapper artistMapper;

    /**
     * Query artist
     * 
     * @param id artistID
     * @return artist
     */
    @Override
    public Artist selectArtistById(Long id)
    {
        return artistMapper.selectArtistById(id);
    }

    /**
     * Query the list of artist
     * 
     * @param artist artist
     * @return artist
     */
    @Override
    public List<Artist> selectArtistList(Artist artist)
    {
        return artistMapper.selectArtistList(artist);
    }

    /**
     * Add artist
     * 
     * @param artist artist
     * @return result
     */
    @Override
    public int insertArtist(Artist artist)
    {
        artist.setCreateTime(DateUtils.getNowDate());
        return artistMapper.insertArtist(artist);
    }

    /**
     * Modify artist
     * 
     * @param artist artist
     * @return result
     */
    @Override
    public int updateArtist(Artist artist)
    {
        artist.setUpdateTime(DateUtils.getNowDate());
        return artistMapper.updateArtist(artist);
    }

    /**
     * Delete artist object
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    @Override
    public int deleteArtistByIds(String ids)
    {
        return artistMapper.deleteArtistByIds(Convert.toStrArray(ids));
    }

    /**
     * Delete artist information
     * 
     * @param id artistID
     * @return result
     */
    @Override
    public int deleteArtistById(Long id)
    {
        return artistMapper.deleteArtistById(id);
    }
}
