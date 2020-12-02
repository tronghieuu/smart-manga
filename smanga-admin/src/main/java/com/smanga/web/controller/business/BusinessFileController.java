package com.smanga.web.controller.business;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smanga.business.domain.ImageFile;
import com.smanga.business.domain.Manga;
import com.smanga.business.domain.MangaCategory;
import com.smanga.business.service.IImageFileService;
import com.smanga.business.service.IMangaCategoryService;
import com.smanga.business.service.IMangaService;
import com.smanga.common.config.SmartMangaConfig;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
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

	@Autowired
	private IMangaCategoryService mangaCategoryService;

	@Autowired
	private IMangaService mangaService;

	/**
	 * Upload image for category cover
	 * 
	 * @param file_data
	 * @return
	 * @throws IOException
	 * @throws InvalidExtensionException
	 */
	@PostMapping("/category/cover")
	@ResponseBody
	public AjaxResult saveCategoryCoverFile(MultipartFile file_data) throws IOException, InvalidExtensionException {
		String basePath = String.format("%s/%s", SmartMangaConfig.getUploadPath() + "/category/cover",
				DateUtils.getDate());
		String now = DateUtils.dateTimeNow();
		String fileName = String.format("file%s.%s", now, FileUploadUtils.getExtension(file_data));
		String filePath = FileUploadUtils.upload(basePath, fileName, file_data,
				MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);

		ImageFile imageFile = new ImageFile();
		imageFile.setImageName(fileName);
		imageFile.setImagePath(filePath);
		imageFile.setAbsolutePath(basePath + "/" + fileName);
		imageFile.setCreateBy(ShiroUtils.getLoginName());
		imageFileService.insertImageFile(imageFile);

		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("file", imageFile);
		return ajaxResult;
	}

	/**
	 * Delete image for category cover
	 * 
	 * @param ids
	 * @param coverId
	 * @return
	 */
	@DeleteMapping("/category/cover")
	@ResponseBody
	public AjaxResult deleteCategoryCoverFileByIds(String ids, Long coverId) {
		if (coverId != null) {
			MangaCategory mangaCategoryUpdate = mangaCategoryService.selectMangaCategoryById(coverId);
			if (mangaCategoryUpdate != null && mangaCategoryUpdate.getCoverImageId() != null) {
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("nullCoverImage", true);
				mangaCategoryUpdate.setParams(params);
				mangaCategoryService.updateMangaCategory(mangaCategoryUpdate);
			}
		}
		imageFileService.deleteImageFileByIds(ids);
		return success();
	}

	/**
	 * Upload image for manga cover
	 * 
	 * @param file_data
	 * @return
	 * @throws IOException
	 * @throws InvalidExtensionException
	 */
	@PostMapping("/manga/cover")
	@ResponseBody
	public AjaxResult saveMangaCoverFile(MultipartFile file_data) throws IOException, InvalidExtensionException {
		String basePath = String.format("%s/%s", SmartMangaConfig.getUploadPath() + "/manga/cover",
				DateUtils.getDate());
		String now = DateUtils.dateTimeNow();
		String fileName = String.format("file%s.%s", now, FileUploadUtils.getExtension(file_data));
		String filePath = FileUploadUtils.upload(basePath, fileName, file_data,
				MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);

		ImageFile imageFile = new ImageFile();
		imageFile.setImageName(fileName);
		imageFile.setImagePath(filePath);
		imageFile.setAbsolutePath(basePath + "/" + fileName);
		imageFile.setCreateBy(ShiroUtils.getLoginName());
		imageFileService.insertImageFile(imageFile);

		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("file", imageFile);
		return ajaxResult;
	}

	/**
	 * Delete image for manga cover
	 * 
	 * @param ids
	 * @param coverId
	 * @return
	 */
	@DeleteMapping("/manga/cover")
	@ResponseBody
	public AjaxResult deleteMangaCoverFileByIds(String ids, Long coverId) {
		if (coverId != null) {
			Manga mangaUpdate = mangaService.selectMangaById(coverId);
			if (mangaUpdate != null && mangaUpdate.getCoverImageId() != null) {
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("nullCoverImage", true);
				mangaUpdate.setParams(params);
				mangaService.updateManga(mangaUpdate);
			}
		}
		imageFileService.deleteImageFileByIds(ids);
		return success();
	}

	/**
	 * Upload image for manga slide
	 * 
	 * @param file_data
	 * @return
	 * @throws IOException
	 * @throws InvalidExtensionException
	 */
	@PostMapping("/manga/slide")
	@ResponseBody
	public AjaxResult saveMangaSlideFile(MultipartFile file_data) throws IOException, InvalidExtensionException {
		String basePath = String.format("%s/%s", SmartMangaConfig.getUploadPath() + "/manga/slide",
				DateUtils.getDate());
		String now = DateUtils.dateTimeNow();
		String fileName = String.format("file%s.%s", now, FileUploadUtils.getExtension(file_data));
		String filePath = FileUploadUtils.upload(basePath, fileName, file_data,
				MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);

		ImageFile imageFile = new ImageFile();
		imageFile.setImageName(fileName);
		imageFile.setImagePath(filePath);
		imageFile.setAbsolutePath(basePath + "/" + fileName);
		imageFile.setCreateBy(ShiroUtils.getLoginName());
		imageFileService.insertImageFile(imageFile);

		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("file", imageFile);
		return ajaxResult;
	}

	/**
	 * Delete image for manga slide
	 * 
	 * @param ids
	 * @param slideId
	 * @return
	 */
	@DeleteMapping("/manga/slide")
	@ResponseBody
	public AjaxResult deleteMangaSlideFileByIds(String ids, Long slideId) {
		if (slideId != null) {
			Manga mangaUpdate = mangaService.selectMangaById(slideId);
			if (mangaUpdate != null && mangaUpdate.getSlideImageId() != null) {
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("nullSlideImage", true);
				mangaUpdate.setParams(params);
				mangaService.updateManga(mangaUpdate);
			}
		}
		imageFileService.deleteImageFileByIds(ids);
		return success();
	}
}
