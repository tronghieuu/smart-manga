package com.smanga.business.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smanga.business.domain.ImageFile;
import com.smanga.business.mapper.ImageFileMapper;
import com.smanga.business.service.IImageFileService;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DateUtils;

/**
 * Image FileService business layer processing
 * 
 * @author Trong Hieu
 * @date 2020-11-26
 */
@Service
public class ImageFileServiceImpl implements IImageFileService {
	@Autowired
	private ImageFileMapper imageFileMapper;

	/**
	 * Query Image File
	 * 
	 * @param id Image FileID
	 * @return Image File
	 */
	@Override
	public ImageFile selectImageFileById(Long id) {
		return imageFileMapper.selectImageFileById(id);
	}

	/**
	 * Query the list of Image File
	 * 
	 * @param imageFile Image File
	 * @return Image File
	 */
	@Override
	public List<ImageFile> selectImageFileList(ImageFile imageFile) {
		return imageFileMapper.selectImageFileList(imageFile);
	}

	/**
	 * Add Image File
	 * 
	 * @param imageFile Image File
	 * @return result
	 */
	@Override
	public int insertImageFile(ImageFile imageFile) {
		imageFile.setCreateTime(DateUtils.getNowDate());
		return imageFileMapper.insertImageFile(imageFile);
	}

	/**
	 * Modify Image File
	 * 
	 * @param imageFile Image File
	 * @return result
	 */
	@Override
	public int updateImageFile(ImageFile imageFile) {
		imageFile.setUpdateTime(DateUtils.getNowDate());
		return imageFileMapper.updateImageFile(imageFile);
	}

	/**
	 * Delete Image File object
	 * 
	 * @param ids ID of the data to be deleted
	 * @return result
	 */
	@Override
	public int deleteImageFileByIds(String ids) {
		ImageFile imageFileParam = new ImageFile();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ids", Convert.toStrArray(ids));
		imageFileParam.setParams(params);
		imageFileParam.setDelFlag(SmangaConstants.DEL_FLAG_NOT_DELETED);
		List<ImageFile> imageFiles = imageFileMapper.selectImageFileList(imageFileParam);
		if (CollectionUtils.isNotEmpty(imageFiles)) {
			for (ImageFile imageFile : imageFiles) {
				File deleteFile = new File(imageFile.getAbsolutePath());
				deleteFile.delete();
			}
		}
		return imageFileMapper.deleteImageFileByIds(Convert.toStrArray(ids));
	}

	/**
	 * Delete Image File information
	 * 
	 * @param id Image FileID
	 * @return result
	 */
	@Override
	public int deleteImageFileById(Long id) {
		ImageFile imageFileDelete = imageFileMapper.selectImageFileById(id);
		if (imageFileDelete != null) {
			File deleteFile = new File(imageFileDelete.getAbsolutePath());
			deleteFile.delete();
		}
		return imageFileMapper.deleteImageFileById(id);
	}
}
