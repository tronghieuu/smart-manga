package com.smanga.framework.google.cloud.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gcp.vision.CloudVisionTemplate;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import com.smanga.common.exception.BusinessException;
import com.smanga.framework.config.GoogleCloudConfig;

@Service
public class GoogleCloudService {

	@Autowired
	private GoogleCloudConfig googleCloudConfig;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private CloudVisionTemplate cloudVisionTemplate;

	public List<EntityAnnotation> getTextFromImage(String imagePath) throws IOException {
		Resource imageResource = resourceLoader.getResource("file:" + imagePath);
		AnnotateImageResponse response = cloudVisionTemplate.analyzeImage(imageResource,
				Feature.Type.DOCUMENT_TEXT_DETECTION);
		return response.getTextAnnotationsList();
	}

	public List<AnnotateImageResponse> getTextFromImageApi(String absolutePath) throws IOException {
		try (ImageAnnotatorClient vision = googleCloudConfig.getImageAnnotatorClient()) {
			// Reads the image file into memory
			Path path = Paths.get(absolutePath);
			byte[] data = Files.readAllBytes(path);
			ByteString imgBytes = ByteString.copyFrom(data);

			// Builds the image annotation request
			List<AnnotateImageRequest> requests = new ArrayList<>();
			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
			AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			requests.add(request);

			// Performs label detection on the image file
			BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					throw new BusinessException(String.format("Error: %s%n", res.getError().getMessage()));
				}

				for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					annotation.getAllFields().forEach((k, v) -> System.out.format("%s : %s%n", k, v.toString()));
				}
			}
			return responses;
		}
	}
}
