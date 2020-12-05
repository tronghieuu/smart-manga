package com.smanga.web.controller.business;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smanga.business.domain.ImageFile;
import com.smanga.business.domain.Manga;
import com.smanga.business.domain.MangaCategory;
import com.smanga.business.domain.MangaChapter;
import com.smanga.business.service.IImageFileService;
import com.smanga.business.service.IMangaCategoryService;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.business.service.IMangaService;
import com.smanga.common.config.SmartMangaConfig;
import com.smanga.common.constant.SmangaConstants;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.exception.file.InvalidExtensionException;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.StringUtils;
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

	@Autowired
	private IMangaChapterService chapterService;

	/**
	 * Get image information
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/{id}")
	@ResponseBody
	public AjaxResult getImageInfo(@PathVariable("id") Long id) {
		ImageFile imageFile = imageFileService.selectImageFileById(id);
		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("file", imageFile);
		return ajaxResult;
	}

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

	/**
	 * Save image for chapter
	 * 
	 * @param chapterId
	 * @param file_data
	 * @return
	 * @throws IOException
	 * @throws InvalidExtensionException
	 */
	@PostMapping("/chapter/{id}")
	@ResponseBody
	public AjaxResult saveImageForChapter(@PathVariable("id") Long chapterId, MultipartFile fileBlob,
			Integer chunkIndex, String fileName, String key) throws IOException, InvalidExtensionException {
		if (StringUtils.isNotEmpty(key)) {
			return deleteImageChapter(key, chapterId);
		}

		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("chunkIndex", chunkIndex);

		String basePath = String.format("%s/%s", SmartMangaConfig.getUploadPath() + "/chapter/" + chapterId,
				DateUtils.getDate());
		String now = DateUtils.dateTimeNow();
		fileName = String.format("file%s.%s", now, "_" + fileName).replaceAll("[^a-zA-Z0-9.]", "");
		String filePath = FileUploadUtils.upload(basePath, fileName, fileBlob, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);

		String absolutePath = basePath + "/" + fileName;
		ajaxResult.put("size", Files.size(new File(absolutePath).toPath()));

		ImageFile imageFile = new ImageFile();
		imageFile.setImageName(fileName);
		imageFile.setUsedStatus(SmangaConstants.FILE_USED);
		imageFile.setImagePath(filePath);
		imageFile.setAbsolutePath(absolutePath);
		imageFile.setCreateBy(ShiroUtils.getLoginName());
		imageFileService.insertImageFile(imageFile);

		// Get chapter
		MangaChapter mangaChapter = chapterService.selectMangaChapterById(chapterId);
		if (mangaChapter != null) {
			String chapterImages = "";
			String chapterImageIds = "";
			if (StringUtils.isNotEmpty(mangaChapter.getChapterImageIds())) {
				chapterImages = mangaChapter.getChapterImages() + "," + imageFile.getImagePath();
				chapterImageIds = mangaChapter.getChapterImageIds() + "," + imageFile.getId();
			} else {
				chapterImages = imageFile.getImagePath();
				chapterImageIds = imageFile.getId().toString();
			}
			mangaChapter.setChapterImages(chapterImages);
			mangaChapter.setChapterImageIds(chapterImageIds);
			chapterService.updateMangaChapter(mangaChapter);
		}

		ajaxResult.put("file", imageFile);
		return ajaxResult;
	}

	/**
	 * Delete image chapter
	 * 
	 * @param ids
	 * @param chapterId
	 * @return
	 */
	@DeleteMapping("/chapter/{id}")
	@ResponseBody
	public AjaxResult deleteImageChapter(String ids, @PathVariable("id") Long chapterId) {
		MangaChapter mangaChapter = chapterService.selectMangaChapterById(chapterId);
		if (mangaChapter != null) {
			if (StringUtils.isNotEmpty(mangaChapter.getChapterImageIds())) {
				List<String> chapterImageIds = new LinkedList<String>(
						Arrays.asList(mangaChapter.getChapterImageIds().split(",")));
				List<String> chapterImages = new LinkedList<String>(
						Arrays.asList(mangaChapter.getChapterImages().split(",")));
				List<String> imageIds = Arrays.asList(ids.split(","));
				for (String imageId : imageIds) {
					if (chapterImageIds.contains(imageId)) {
						int index = chapterImageIds.indexOf(imageId);
						chapterImageIds.remove(index);
						chapterImages.remove(index);
					}
				}
				mangaChapter.setChapterImageIds(String.join(",", chapterImageIds));
				mangaChapter.setChapterImages(String.join(",", chapterImages));
				chapterService.updateMangaChapter(mangaChapter);
			}
		}
		imageFileService.deleteImageFileByIds(ids);
		return success();
	}

	@PostMapping("/scan")
	@ResponseBody
	public AjaxResult scanImage(Long id) throws IOException {
		ImageFile imageFile = imageFileService.selectImageFileById(id);

		AjaxResult ajaxResult = AjaxResult.success();
		ajaxResult.put("file", imageFile);
		return ajaxResult;
	}
}
