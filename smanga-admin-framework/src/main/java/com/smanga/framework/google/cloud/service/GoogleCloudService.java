package com.smanga.framework.google.cloud.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gcp.vision.CloudVisionTemplate;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.smanga.framework.web.service.ConfigService;

@Service
public class GoogleCloudService {

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private CloudVisionTemplate cloudVisionTemplate;

	@Autowired
	private ConfigService configService;

	private void getImageAnnotatorClient() throws IOException {
		String serviceAccoutKey = configService.getKey("google.service.account");
		InputStream inputStream = new ByteArrayInputStream(serviceAccoutKey.getBytes("UTF-8"));
		ServiceAccountCredentials credentials = ServiceAccountCredentials.fromStream(inputStream);
		// CredentialsProvider credentialsProvider =
		// FixedCredentialsProvider.create(credentials);

//		ImageAnnotatorClient.create(ImageAnnotatorSettings.newBuilder()
//				.setCredentialsProvider(FixedCredentialsProvider.create(credentials)).build());
//		CredentialsProvider credentialsProvider = FixedCredentialsProvider.create(credentials);
//		return ImageAnnotatorClient.create(ImageAnnotatorSettings.newBuilder()
//				.setCredentialsProvider(credentialsProvider).build());
	}

	public List<EntityAnnotation> getTextFromImage(String imagePath) throws IOException {
		Resource imageResource = resourceLoader.getResource(imagePath);
		AnnotateImageResponse response = cloudVisionTemplate.analyzeImage(imageResource,
				Feature.Type.DOCUMENT_TEXT_DETECTION);
		return response.getTextAnnotationsList();
	}
}
