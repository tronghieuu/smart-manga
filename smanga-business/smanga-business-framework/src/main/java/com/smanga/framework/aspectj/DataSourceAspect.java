package com.smanga.framework.aspectj;

import java.util.Objects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.smanga.common.annotation.DataSource;
import com.smanga.common.config.datasource.DynamicDataSourceContextHolder;
import com.smanga.common.utils.StringUtils;

/**
 * Multi-data source processing
 * 
 * @author Trong Hieu
 */
@Aspect
@Order(1)
@Component
public class DataSourceAspect {
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Pointcut("@annotation(com.smanga.common.annotation.DataSource)"
			+ "|| @within(com.smanga.common.annotation.DataSource)")
	public void dsPointCut() {

	}

	@Around("dsPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		DataSource dataSource = getDataSource(point);

		if (StringUtils.isNotNull(dataSource)) {
			DynamicDataSourceContextHolder.setDataSourceType(dataSource.value().name());
		}

		try {
			return point.proceed();
		} finally {
			// Destroy the data source after executing the method
			DynamicDataSourceContextHolder.clearDataSourceType();
		}
	}

	/**
	 * Get the data source that needs to be switched
	 */
	public DataSource getDataSource(ProceedingJoinPoint point) {
		MethodSignature signature = (MethodSignature) point.getSignature();
		DataSource dataSource = AnnotationUtils.findAnnotation(signature.getMethod(), DataSource.class);
		if (Objects.nonNull(dataSource)) {
			return dataSource;
		}

		return AnnotationUtils.findAnnotation(signature.getDeclaringType(), DataSource.class);
	}
}
