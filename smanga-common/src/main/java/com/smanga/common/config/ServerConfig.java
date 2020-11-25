package com.smanga.common.config;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;

import com.smanga.common.utils.ServletUtils;

/**
 * Service related configuration
 *
 * @author Trong Hieu
 *
 */
@Component
public class ServerConfig
{
    /**
     * Get the complete request path, including: domain name, port, context access path
     *
     * @return service address
     */
    public String getUrl()
    {
        HttpServletRequest request = ServletUtils.getRequest();
        return getDomain(request);
    }

    public static String getDomain(HttpServletRequest request)
    {
        StringBuffer url = request.getRequestURL();
        String contextPath = request.getServletContext().getContextPath();
        return url.delete(url.length() - request.getRequestURI().length(), url.length()).append(contextPath).toString();
    }
}
