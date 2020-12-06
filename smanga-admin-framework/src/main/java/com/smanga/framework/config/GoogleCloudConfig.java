package com.smanga.framework.config;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageAnnotatorSettings;
import com.smanga.framework.web.service.ConfigService;

@Service
public class GoogleCloudConfig {

	@Autowired
	private ConfigService configService;

	public ImageAnnotatorClient getImageAnnotatorClient() throws IOException {
		String serviceAccoutKey = configService.getKey("google.service.account");
		InputStream inputStream = new ByteArrayInputStream(serviceAccoutKey.getBytes("UTF-8"));
		GoogleCredentials credentials = GoogleCredentials.fromStream(inputStream);
		return ImageAnnotatorClient.create(ImageAnnotatorSettings.newBuilder()
				.setCredentialsProvider(FixedCredentialsProvider.create(credentials)).build());
	}
}
