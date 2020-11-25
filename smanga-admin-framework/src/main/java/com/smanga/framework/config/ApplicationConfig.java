package com.smanga.framework.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * Program annotation configuration
 *
 * @author Trong Hieu
 */
@Configuration
// Indicates that the proxy object is exposed through the aop framework, and AopContext can access
@EnableAspectJAutoProxy(exposeProxy = true)
// Specify the path of the package of the Mapper class to be scanned
@MapperScan("com.smanga.**.mapper")
public class ApplicationConfig
{

}
