package com.smanga.framework.manager;

import java.util.TimerTask;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.smanga.common.utils.Threads;
import com.smanga.common.utils.spring.SpringUtils;

/**
 * Asynchronous Task Manager
 * 
 * @author Trong Hieu
 */
public class AsyncManager
{
    /**
     * Operation delay 10 milliseconds
     */
    private final int OPERATE_DELAY_TIME = 10;

    /**
     * Asynchronous operation task scheduling thread pool
     */
    private ScheduledExecutorService executor = SpringUtils.getBean("scheduledExecutorService");

    /**
     * Singleton mode
     */
    private AsyncManager(){}

    private static AsyncManager me = new AsyncManager();

    public static AsyncManager me()
    {
        return me;
    }

    /**
     * Perform task
     * 
     * @param task task
     */
    public void execute(TimerTask task)
    {
        executor.schedule(task, OPERATE_DELAY_TIME, TimeUnit.MILLISECONDS);
    }

    /**
     * Stop task thread pool
     */
    public void shutdown()
    {
        Threads.shutdownAndAwaitTermination(executor);
    }
}
