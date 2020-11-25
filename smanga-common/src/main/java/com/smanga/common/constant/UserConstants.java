package com.smanga.common.constant;

/**
 * User constant information
 *
 * @author Trong Hieu
 */
public class UserConstants
{
    /**
     * The only sign of system users in the platform
     */
    public static final String SYS_USER = "SYS_USER";

    /** normal status */
    public static final String NORMAL = "0";

    /** Abnormal state */
    public static final String EXCEPTION = "1";

    /** User ban status */
    public static final String USER_DISABLE = "1";

    /** Character ban status */
    public static final String ROLE_DISABLE = "1";

    /** Department normal state */
    public static final String DEPT_NORMAL = "0";

    /** Department disabled status */
    public static final String DEPT_DISABLE = "1";

    /** The normal state of the dictionary */
    public static final String DICT_NORMAL = "0";

    /** Is it the system default (yes) */
    public static final String YES = "Y";

    /**
     * User name length limitation
     */
    public static final int USERNAME_MIN_LENGTH = 2;
    public static final int USERNAME_MAX_LENGTH = 20;

    /** Whether the login name is the only return result code */
    public final static String USER_NAME_UNIQUE = "0";
    public final static String USER_NAME_NOT_UNIQUE = "1";

    /** Is the mobile phone number unique? */
    public final static String USER_PHONE_UNIQUE = "0";
    public final static String USER_PHONE_NOT_UNIQUE = "1";

    /** Is e-mail the only return result */
    public final static String USER_EMAIL_UNIQUE = "0";
    public final static String USER_EMAIL_NOT_UNIQUE = "1";

    /** Whether the department name is the only return result code */
    public final static String DEPT_NAME_UNIQUE = "0";
    public final static String DEPT_NAME_NOT_UNIQUE = "1";

    /** Whether the role name is the only return result code */
    public final static String ROLE_NAME_UNIQUE = "0";
    public final static String ROLE_NAME_NOT_UNIQUE = "1";

    /** Whether the job name is the only return result code */
    public final static String POST_NAME_UNIQUE = "0";
    public final static String POST_NAME_NOT_UNIQUE = "1";

    /** Is the role permission unique return result code */
    public final static String ROLE_KEY_UNIQUE = "0";
    public final static String ROLE_KEY_NOT_UNIQUE = "1";

    /** Is the post code the only return result code */
    public final static String POST_CODE_UNIQUE = "0";
    public final static String POST_CODE_NOT_UNIQUE = "1";

    /** Whether the menu name is the only return result code */
    public final static String MENU_NAME_UNIQUE = "0";
    public final static String MENU_NAME_NOT_UNIQUE = "1";

    /** Whether the dictionary type is the only return result code */
    public final static String DICT_TYPE_UNIQUE = "0";
    public final static String DICT_TYPE_NOT_UNIQUE = "1";

    /** Whether the parameter key name is the only return result code */
    public final static String CONFIG_KEY_UNIQUE = "0";
    public final static String CONFIG_KEY_NOT_UNIQUE = "1";

    /**
     * Password length limit
     */
    public static final int PASSWORD_MIN_LENGTH = 5;
    public static final int PASSWORD_MAX_LENGTH = 20;

    /**
     * user type
     */
    public static final String SYSTEM_USER_TYPE = "00";
    public static final String REGISTER_USER_TYPE = "01";

    /**
     * Mobile phone number format restrictions
     */
    public static final String MOBILE_PHONE_NUMBER_PATTERN = "^0{0,1}(13[0-9]|15[0-9]|14[0-9]|18[0-9])[0-9]{8 }$";

    /**
     * Email format restrictions
     */
    public static final String EMAIL_PATTERN = "^((([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+(\\.([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+)*)|((\\x22)((((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(([\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f]|\\x21|[\\x23-\\x5b]|[\\x5d-\\x7e]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(\\\\([\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]))))*(((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?(\\x22)))@((([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|\\d|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.)+(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])|(([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])([a-z]|\\d|-|\\.|_|~|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])*([a-z]|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])))\\.?";
}
