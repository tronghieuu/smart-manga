package com.smanga.framework.manager;

import net.sf.ehcache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smanga.framework.shiro.web.session.SpringSessionValidationScheduler;

import javax.annotation.PreDestroy;

/**
 * Ensure that the background thread can be closed when the application exits
 *
 * @author Trong Hieu
 */
@Component
public class ShutdownManager
{
    private static final Logger logger = LoggerFactory.getLogger("sys-user");

    @Autowired(required = false)
    private SpringSessionValidationScheduler springSessionValidationScheduler;

    @Autowired(required = false)
    private EhCacheManager ehCacheManager;

    @PreDestroy
    public void destroy()
    {
        shutdownSpringSessionValidationScheduler();
        shutdownAsyncManager();
        shutdownEhCacheManager();
    }

    /**
     * Stop Seesion session check
     */
    private void shutdownSpringSessionValidationScheduler()
    {
        if (springSessionValidationScheduler != null && springSessionValidationScheduler.isEnabled())
        {
            try
            {
                logger.info("====Close the session verification task====");
                springSessionValidationScheduler.disableSessionValidation();
            }
            catch (Exception e)
            {
                logger.error(e.getMessage(), e);
            }
        }
    }

    /**
     * Stop executing tasks asynchronously
     */
    private void shutdownAsyncManager()
    {
        try
        {
            logger.info("====Close the background task task thread pool====");
            AsyncManager.me().shutdown();
        }
        catch (Exception e)
        {
            logger.error(e.getMessage(), e);
        }
    }

    private void shutdownEhCacheManager()
    {
        try
        {
            logger.info("====Turn off the cache ====");
            if (ehCacheManager != null)
            {
                CacheManager cacheManager = ehCacheManager.getCacheManager();
                cacheManager.shutdown();
            }
        }
        catch (Exception e)
        {
            logger.error(e.getMessage(), e);
        }
    }
}
