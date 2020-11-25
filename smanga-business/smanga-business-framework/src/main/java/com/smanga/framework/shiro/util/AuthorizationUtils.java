package com.smanga.framework.shiro.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;

import com.smanga.framework.shiro.realm.UserRealm;

/**
 * User authorization information
 *
 * @author Trong Hieu
 */
public class AuthorizationUtils
{
    /**
     * Clean up all user authorization information cache
     */
    public static void clearAllCachedAuthorizationInfo()
    {
        getUserRealm().clearAllCachedAuthorizationInfo();
    }

    /**
     * Get a custom Realm
     */
    public static UserRealm getUserRealm()
    {
        RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
        return (UserRealm) rsm.getRealms().iterator().next();
    }
}
