package com.smanga.framework.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.smanga.common.config.SmartMangaConfig;
import com.smanga.common.constant.Constants;
import com.smanga.framework.interceptor.RepeatSubmitInterceptor;

/**
 * General configuration
 * 
 * @author Trong Hieu
 */
@Configuration
public class ResourcesConfig implements WebMvcConfigurer {
	/**
	 * Home address
	 */
	@Value("${shiro.user.indexUrl}")
	private String indexUrl;

	@Autowired
	private RepeatSubmitInterceptor repeatSubmitInterceptor;

	/**
	 * The default homepage setting, when you enter the domain name, you can automatically jump to the default specified webpage
	 */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("forward:" + indexUrl);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		/** Local file upload path */
		registry.addResourceHandler(Constants.RESOURCE_PREFIX + "/**")
				.addResourceLocations("file:" + SmartMangaConfig.getProfile() + "/");

		/** swagger configuration */
		registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
	}

	/**
	 * Custom blocking rules
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(repeatSubmitInterceptor).addPathPatterns("/**");
	}
}