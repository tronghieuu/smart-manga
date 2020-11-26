package com.smanga.business.service;

import java.util.List;
import com.smanga.business.domain.ImageFile;

/**
 * Image FileService interface
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
public interface IImageFileService 
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
     * Batch delete Image File
     * 
     * @param ids ID of the data to be deleted
     * @return result
     */
    public int deleteImageFileByIds(String ids);

    /**
     * Delete Image File information
     * 
     * @param id Image FileID
     * @return result
     */
    public int deleteImageFileById(Long id);
}
