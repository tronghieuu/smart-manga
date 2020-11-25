package com.smanga.common.utils;

import java.util.List;
import org.springframework.stereotype.Component;

import com.smanga.common.constant.Constants;
import com.smanga.common.core.domain.entity.SysDictData;

/**
 * Dictionary tools
 *
 * @author Trong Hieu
 */
@Component
public class DictUtils
{
    /**
     * Separator
     */
    public static final String SEPARATOR = ",";

    /**
     * Set dictionary cache
     *
     * @param key parameter key
     * @param dictDatas dictionary data list
     */
    public static void setDictCache(String key, List<SysDictData> dictDatas)
    {
        CacheUtils.put(getCacheName(), getCacheKey(key), dictDatas);
    }

    /**
     * Get dictionary cache
     *
     * @param key parameter key
     * @return dictDatas dictionary data list
     */
    public static List<SysDictData> getDictCache(String key)
    {
        Object cacheObj = CacheUtils.get(getCacheName(), getCacheKey(key));
        if (StringUtils.isNotNull(cacheObj))
        {
            List<SysDictData> DictDatas = StringUtils.cast(cacheObj);
            return DictDatas;
        }
        return null;
    }

    /**
     * Get dictionary tags according to dictionary type and dictionary value
     *
     * @param dictType dictionary type
     * @param dictValue dictionary value
     * @return dictionary tag
     */
    public static String getDictLabel(String dictType, String dictValue)
    {
        return getDictLabel(dictType, dictValue, SEPARATOR);
    }

    /**
     * Get dictionary value according to dictionary type and dictionary tag
     *
     * @param dictType dictionary type
     * @param dictLabel dictionary label
     * @return dictionary value
     */
    public static String getDictValue(String dictType, String dictLabel)
    {
        return getDictValue(dictType, dictLabel, SEPARATOR);
    }

    /**
     * Get dictionary tags according to dictionary type and dictionary value
     *
     * @param dictType dictionary type
     * @param dictValue dictionary value
     * @param separator separator
     * @return dictionary tag
     */
    public static String getDictLabel(String dictType, String dictValue, String separator)
    {
        StringBuilder propertyString = new StringBuilder();
        List<SysDictData> datas = getDictCache(dictType);

        if (StringUtils.containsAny(separator, dictValue) && StringUtils.isNotEmpty(datas))
        {
            for (SysDictData dict : datas)
            {
                for (String value : dictValue.split(separator))
                {
                    if (value.equals(dict.getDictValue()))
                    {
                        propertyString.append(dict.getDictLabel() + separator);
                        break;
                    }
                }
            }
        }
        else
        {
            for (SysDictData dict : datas)
            {
                if (dictValue.equals(dict.getDictValue()))
                {
                    return dict.getDictLabel();
                }
            }
        }
        return StringUtils.stripEnd(propertyString.toString(), separator);
    }

    /**
     * Get dictionary value according to dictionary type and dictionary tag
     *
     * @param dictType dictionary type
     * @param dictLabel dictionary label
     * @param separator separator
     * @return dictionary value
     */
    public static String getDictValue(String dictType, String dictLabel, String separator)
    {
        StringBuilder propertyString = new StringBuilder();
        List<SysDictData> datas = getDictCache(dictType);

        if (StringUtils.containsAny(separator, dictLabel) && StringUtils.isNotEmpty(datas))
        {
            for (SysDictData dict: datas)
            {
                for (String label: dictLabel.split(separator))
                {
                    if (label.equals(dict.getDictLabel()))
                    {
                        propertyString.append(dict.getDictValue() + separator);
                        break;
                    }
                }
            }
        }
        else
        {
            for (SysDictData dict: datas)
            {
                if (dictLabel.equals(dict.getDictLabel()))
                {
                    return dict.getDictValue();
                }
            }
        }
        return StringUtils.stripEnd(propertyString.toString(), separator);
    }

    /**
     * Clear dictionary cache
     */
    public static void clearDictCache()
    {
        CacheUtils.removeAll(getCacheName());
    }

    /**
     * Get cache name
     *
     * @return cache name
     */
    public static String getCacheName()
    {
        return Constants.SYS_DICT_CACHE;
    }

    /**
     * Set the cache key
     *
     * @param configKey parameter key
     * @return cache key key
     */
    public static String getCacheKey(String configKey)
    {
        return Constants.SYS_DICT_KEY + configKey;
    }
}
