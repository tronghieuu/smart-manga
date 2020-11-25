package com.smanga.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Global configuration class
 *
 * @author Trong Hieu
 */
@Component
@ConfigurationProperties(prefix = "ruoyi")
public class SmartMangaConfig
{
    /** project name */
    private static String name;

    /** Version */
    private static String version;

    /** Copyright year */
    private static String copyrightYear;

    /** Example demo switch */
    private static boolean demoEnabled;

    /** Upload path */
    private static String profile;

    /** Get address switch */
    private static boolean addressEnabled;

    public static String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        SmartMangaConfig.name = name;
    }

    public static String getVersion()
    {
        return version;
    }

    public void setVersion(String version)
    {
        SmartMangaConfig.version = version;
    }

    public static String getCopyrightYear()
    {
        return copyrightYear;
    }

    public void setCopyrightYear(String copyrightYear)
    {
        SmartMangaConfig.copyrightYear = copyrightYear;
    }

    public static boolean isDemoEnabled()
    {
        return demoEnabled;
    }

    public void setDemoEnabled(boolean demoEnabled)
    {
        SmartMangaConfig.demoEnabled = demoEnabled;
    }

    public static String getProfile()
    {
        return profile;
    }

    public void setProfile(String profile)
    {
        SmartMangaConfig.profile = profile;
    }

    public static boolean isAddressEnabled()
    {
        return addressEnabled;
    }

    public void setAddressEnabled(boolean addressEnabled)
    {
        SmartMangaConfig.addressEnabled = addressEnabled;
    }

    /**
     * Get avatar upload path
     */
    public static String getAvatarPath()
    {
        return getProfile() + "/avatar";
    }

    /**
     * Get download path
     */
    public static String getDownloadPath()
    {
        return getProfile() + "/download/";
    }

    /**
     * Get upload path
     */
    public static String getUploadPath()
    {
        return getProfile() + "/upload";
    }
}
