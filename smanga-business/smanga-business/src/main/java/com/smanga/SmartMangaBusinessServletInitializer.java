package com.smanga;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * Deploy in a web container
 * 
 * @author Trong Hieu
 */
public class SmartMangaBusinessServletInitializer extends SpringBootServletInitializer
{
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application)
    {
        return application.sources(SmartMangaBusinessApplication.class);
    }
}
