package com.smanga.web.core.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.smanga.common.config.SmartMangaConfig;

import io.swagger.annotations.ApiOperation;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger2 interface configuration
 * 
 * @author Trong Hieu
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig
{
    /** Whether to open swagger */
    @Value("${swagger.enabled}")
    private boolean enabled;
    
    /**
     * Create API
     */
    @Bean
    public Docket createRestApi()
    {
        return new Docket(DocumentationType.SWAGGER_2)
                // Whether to enable Swagger
                .enable(enabled)
                // The basic information used to create the API, displayed in the document page (custom display information)
                .apiInfo(apiInfo())
                // Set which interfaces are exposed to Swagger for display
                .select()
                // Scan all annotated apis, this way is more flexible
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                // Scan the swagger annotations in the specified package
                //.apis(RequestHandlerSelectors.basePackage("com.smanga.project.tool.swagger"))
                // Scan all .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build();
    }

    /**
     * Add summary information
     */
    private ApiInfo apiInfo()
    {
        // Customize with ApiInfoBuilder
        return new ApiInfoBuilder()
                // set title
                .title("Title: If According to Management System_Interface Document")
                // description
                .description ("Description: used to manage the personnel information of the group companies, including XXX, XXX modules...")
                // author information
                .contact(new Contact(SmartMangaConfig.getName(), null, null))
                // version
                .version("version number: " + SmartMangaConfig.getVersion())
                .build();
    }
}
