package com.smanga.web.controller.business;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smanga.business.domain.ImageFile;
import com.smanga.business.service.IImageFileService;
import com.smanga.common.config.SmartMangaConfig;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.file.InvalidExtensionException;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.file.FileUploadUtils;
import com.smanga.common.utils.file.MimeTypeUtils;
import com.smanga.framework.shiro.util.ShiroUtils;

/**
 * @author Trong Hieu
 *
 */
@Controller
@RequestMapping("/file")
public class BusinessFileController extends BaseController {

	@Autowired
	private IImageFileService imageFileService;

	@PostMapping("/category/cover")
	@ResponseBody
	public AjaxResult saveFile(MultipartFile file_data) throws IOException, InvalidExtensionException {
		String basePath = String.format("%s/%s", SmartMangaConfig.getUploadPath() + "/category/cover/",
				DateUtils.getDate());
		String now = DateUtils.dateTimeNow();
		String fileName = String.format("file%s.%s", now, FileUploadUtils.getExtension(file_data));
		String filePath = FileUploadUtils.upload(basePath, fileName, file_data,
				MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);

		ImageFile imageFile = new ImageFile();
		imageFile.setImageName(fileName);
		imageFile.setImagePath(filePath);
		imageFile.setCreateBy(ShiroUtils.getSysUser().getUserName());
		imageFileService.insertImageFile(imageFile);

		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("file", imageFile);
		return ajaxResult;
	}

	@DeleteMapping
	@ResponseBody
	public AjaxResult deleteFileByIds(String ids) {
		// Select list image file in database by ids
		ImageFile imageFileParam = new ImageFile();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ids", Convert.toStrArray(ids));
		imageFileParam.setParams(params);
		imageFileParam.setDelFlag(SmangaConstants.DEL_FLAG_NOT_DELETED);
		List<ImageFile> imageFiles = imageFileService.selectImageFileList(imageFileParam);
		if (CollectionUtils.isNotEmpty(imageFiles)) {
			// Get image path in image Files to delete
			for (ImageFile imageFile : imageFiles) {
				File deleteFile = new File(SmartMangaConfig.getProfile() + imageFile.getImagePath());
				deleteFile.delete();
			}
			imageFileService.deleteImageFileByIds(ids);
		}
		return success();
	}
}
