package com.smanga.common.utils.security;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smanga.common.constant.PermissionConstants;
import com.smanga.common.utils.MessageUtils;

/**
 * permission tools
 *
 * @author Trong Hieu
 */
public class PermissionUtils
{
    private static final Logger log = LoggerFactory.getLogger(PermissionUtils.class);

    /**
     * Permission to view data
     */
    public static final String VIEW_PERMISSION = "no.view.permission";

    /**
     * Permission to create data
     */
    public static final String CREATE_PERMISSION = "no.create.permission";

    /**
     * Permission to modify data
     */
    public static final String UPDATE_PERMISSION = "no.update.permission";

    /**
     * Permission to delete data
     */
    public static final String DELETE_PERMISSION = "no.delete.permission";

    /**
     * Permission to export data
     */
    public static final String EXPORT_PERMISSION = "no.export.permission";

    /**
     * Other data permissions
     */
    public static final String PERMISSION = "no.permission";

    /**
     * Permission error message reminder
     *
     * @param permissionsStr error message
     * @return prompt message
     */
    public static String getMsg(String permissionsStr)
    {
        String permission = StringUtils.substringBetween(permissionsStr, "[", "]");
        String msg = MessageUtils.message(PERMISSION, permission);
        if (StringUtils.endsWithIgnoreCase(permission, PermissionConstants.ADD_PERMISSION))
        {
            msg = MessageUtils.message(CREATE_PERMISSION, permission);
        }
        else if (StringUtils.endsWithIgnoreCase(permission, PermissionConstants.EDIT_PERMISSION))
        {
            msg = MessageUtils.message(UPDATE_PERMISSION, permission);
        }
        else if (StringUtils.endsWithIgnoreCase(permission, PermissionConstants.REMOVE_PERMISSION))
        {
            msg = MessageUtils.message(DELETE_PERMISSION, permission);
        }
        else if (StringUtils.endsWithIgnoreCase(permission, PermissionConstants.EXPORT_PERMISSION))
        {
            msg = MessageUtils.message(EXPORT_PERMISSION, permission);
        }
        else if (StringUtils.endsWithAny(permission,
                new String[] { PermissionConstants.VIEW_PERMISSION, PermissionConstants.LIST_PERMISSION }))
        {
            msg = MessageUtils.message(VIEW_PERMISSION, permission);
        }
        return msg;
    }

    /**
     * Return user attribute value
     *
     * @param property property name
     * @return user attribute value
     */
    public static Object getPrincipalProperty(String property)
    {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null)
        {
            Object principal = subject.getPrincipal();
            try
            {
                BeanInfo bi = Introspector.getBeanInfo(principal.getClass());
                for (PropertyDescriptor pd : bi.getPropertyDescriptors())
                {
                    if (pd.getName().equals(property) == true)
                    {
                        return pd.getReadMethod().invoke(principal, (Object[]) null);
                    }
                }
            }
            catch (Exception e)
            {
                log.error("Error reading property [{}] from principal of type [{}]", property,
                        principal.getClass().getName());
            }
        }
        return null;
    }
}
