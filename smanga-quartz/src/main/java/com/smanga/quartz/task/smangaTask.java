package com.smanga.quartz.task;

import org.springframework.stereotype.Component;

import com.smanga.common.utils.StringUtils;

/**
 * Timed task scheduling test
 * 
 * @author Trong Hieu
 */
@Component("smangaTask")
public class smangaTask
{
	public void smangaMultipleParams(String s, Boolean b, Long l, Double d, Integer i)
    {
        System.out.println(StringUtils.format("Implementation of multi-parameter methods: string type {}, boolean type {}, long integer type {}, floating point type {}, integer {}", s, b, l, d, i));
    }

	public void smangaParams(String params)
    {
        System.out.println("Execute method with parameters: " + params);
    }

	public void smangaNoParams()
    {
        System.out.println("Execute no parameter method");
    }
}
