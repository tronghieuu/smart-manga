package com.smanga.business.mapper;

import java.util.List;
import com.smanga.business.domain.ImageFile;

/**
 * Image FileMapper interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface ImageFileMapper 
{
    /**
     * Query Image File
     * 
     * @param id Image FileID
     * @return Image File
     */
    public ImageFile selectImageFileById(Long id);

    /**
     * Query the list of Image File
     * 
     * @param imageFile Image File
     * @return Image File collection
     */
    public List<ImageFile> selectImageFileList(ImageFile imageFile);

    /**
     * Add Image File
     * 
     * @param imageFile Image File
     * @return result
     */
    public int insertImageFile(ImageFile imageFile);

    /**
     * Modify Image File
     * 
     * @param imageFile Image File
     * @return result
     */
    public int updateImageFile(ImageFile imageFile);

    /**
     * Delete Image File
     * 
     * @param id Image FileID
     * @return result
     */
    public int deleteImageFileById(Long id);

    /**
     * Batch delete Image File
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteImageFileByIds(String[] ids);
}
