package com.smanga.common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.smanga.common.enums.DataSourceType;

/**
 * Custom multi-data source switch annotation
 *
 * Priority: method first, class later, if the method covers the data source type on the class, the method shall prevail, otherwise the method shall prevail
 *
 * @author Trong Hieu
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface DataSource
{
    /**
     * Switch data source name
     */
    public DataSourceType value() default DataSourceType.MASTER;
}
