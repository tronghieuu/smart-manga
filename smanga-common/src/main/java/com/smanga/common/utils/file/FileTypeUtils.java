package com.smanga.common.utils.file;

import java.io.File;
import org.apache.commons.lang3.StringUtils;

/**
 * File type tools
 *
 * @author Trong Hieu
 */
public class FileTypeUtils
{
    /**
     * Get file type
     * <p>
     * For example: smanga.txt, return: txt
     *
     * @param file file name
     * @return suffix (without ".")
     */
    public static String getFileType(File file)
    {
        if (null == file)
        {
            return StringUtils.EMPTY;
        }
        return getFileType(file.getName());
    }

    /**
     * Get file type
     * <p>
     * For example: smanga.txt, return: txt
     *
     * @param fileName file name
     * @return suffix (without ".")
     */
    public static String getFileType(String fileName)
    {
        int separatorIndex = fileName.lastIndexOf(".");
        if (separatorIndex < 0)
        {
            return "";
        }
        return fileName.substring(separatorIndex + 1).toLowerCase();
    }
}