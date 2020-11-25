package com.smanga.common.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Cookie tools
 *
 * @author Trong Hieu
 */
public class CookieUtils
{
    /**
     * Set Cookie (Generation time is 1 day)
     *
     * @param name name
     * @param value
     */
    public static void setCookie(HttpServletResponse response, String name, String value)
    {
        setCookie(response, name, value, 60 * 60 * 24);
    }

    /**
     * Set cookies
     *
     * @param name name
     * @param value
     * @param maxAge survival time (in seconds)
     * @param uri path
     */
    public static void setCookie(HttpServletResponse response, String name, String value, String path)
    {
        setCookie(response, name, value, path, 60 * 60 * 24);
    }

    /**
     * Set cookies
     *
     * @param name name
     * @param value
     * @param maxAge survival time (in seconds)
     * @param uri path
     */
    public static void setCookie(HttpServletResponse response, String name, String value, int maxAge)
    {
        setCookie(response, name, value, "/", maxAge);
    }

    /**
     * Set cookies
     *
     * @param name name
     * @param value
     * @param maxAge survival time (in seconds)
     * @param uri path
     */
    public static void setCookie(HttpServletResponse response, String name, String value, String path, int maxAge)
    {
        Cookie cookie = new Cookie(name, null);
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        try
        {
            cookie.setValue(URLEncoder.encode(value, "utf-8"));
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        response.addCookie(cookie);
    }

    /**
     * Get the value of the specified cookie
     *
     * @param name name
     * @return value
     */
    public static String getCookie(HttpServletRequest request, String name)
    {
        return getCookie(request, null, name, false);
    }

    /**
     * Obtain the value of the specified cookie and delete it.
     *
     * @param name name
     * @return value
     */
    public static String getCookie(HttpServletRequest request, HttpServletResponse response, String name)
    {
        return getCookie(request, response, name, true);
    }

    /**
     * Get the value of the specified cookie
     *
     * @param request request object
     * @param response response object
     * @param name name
     * @param isRemove whether to remove
     * @return value
     */
    public static String getCookie(HttpServletRequest request, HttpServletResponse response, String name,
            boolean isRemove)
    {
        String value = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
        {
            for (Cookie cookie : cookies)
            {
                if (cookie.getName().equals(name))
                {
                    try
                    {
                        value = URLDecoder.decode(cookie.getValue(), "utf-8");
                    }
                    catch (UnsupportedEncodingException e)
                    {
                        e.printStackTrace();
                    }
                    if (isRemove)
                    {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
        }
        return value;
    }
}
