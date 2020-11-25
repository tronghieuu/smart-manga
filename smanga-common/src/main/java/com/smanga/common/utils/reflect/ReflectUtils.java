package com.smanga.common.utils.reflect;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.apache.poi.ss.usermodel.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.DateUtils;

/**
 * Reflection tool class. Provides tool functions such as calling getter/setter methods, accessing private variables, calling private methods, obtaining generic type Class, and real classes that have been AOP.
 *
 * @author Trong Hieu
 */
@SuppressWarnings("rawtypes")
public class ReflectUtils
{
    private static final String SETTER_PREFIX = "set";

    private static final String GETTER_PREFIX = "get";

    private static final String CGLIB_CLASS_SEPARATOR = "$$";

    private static Logger logger = LoggerFactory.getLogger(ReflectUtils.class);

    /**
     * Call the Getter method.
     * Support multiple levels, such as: object name. object name. method
     */
    @SuppressWarnings("unchecked")
    public static <E> E invokeGetter(Object obj, String propertyName)
    {
        Object object = obj;
        for (String name: StringUtils.split(propertyName, "."))
        {
            String getterMethodName = GETTER_PREFIX + StringUtils.capitalize(name);
            object = invokeMethod(object, getterMethodName, new Class[] {}, new Object[] {});
        }
        return (E) object;
    }

    /**
     * Call Setter method, only match method name.
     * Support multiple levels, such as: object name. object name. method
     */
    public static <E> void invokeSetter(Object obj, String propertyName, E value)
    {
        Object object = obj;
        String[] names = StringUtils.split(propertyName, ".");
        for (int i = 0; i < names.length; i++)
        {
            if (i < names.length - 1)
            {
                String getterMethodName = GETTER_PREFIX + StringUtils.capitalize(names[i]);
                object = invokeMethod(object, getterMethodName, new Class[] {}, new Object[] {});
            }
            else
            {
                String setterMethodName = SETTER_PREFIX + StringUtils.capitalize(names[i]);
                invokeMethodByName(object, setterMethodName, new Object[] { value });
            }
        }
    }

    /**
     * Read object property values ​​directly, ignoring private/protected modifiers, and not passing through getter functions.
     */
    @SuppressWarnings("unchecked")
    public static <E> E getFieldValue(final Object obj, final String fieldName)
    {
        Field field = getAccessibleField(obj, fieldName);
        if (field == null)
        {
            logger.debug("In [" + obj.getClass() + "], [" + fieldName + "] field was not found ");
            return null;
        }
        E result = null;
        try
        {
            result = (E) field.get(obj);
        }
        catch (IllegalAccessException e)
        {
            logger.error("It is impossible to throw exception {}", e.getMessage());
        }
        return result;
    }

    /**
     * Set object property values ​​directly, ignoring private/protected modifiers, and not passing through setter functions.
     */
    public static <E> void setFieldValue(final Object obj, final String fieldName, final E value)
    {
        Field field = getAccessibleField(obj, fieldName);
        if (field == null)
        {
            // throw new IllegalArgumentException("In [" + obj.getClass() + "], the [" + fieldName + "] field was not found ");
            logger.debug("In [" + obj.getClass() + "], [" + fieldName + "] field was not found ");
            return;
        }
        try
        {
            field.set(obj, value);
        }
        catch (IllegalAccessException e)
        {
            logger.error("It is impossible to throw exception: {}", e.getMessage());
        }
    }

    /**
     * Directly call object methods, ignoring private/protected modifiers.
     * Used in the case of a one-time call, otherwise you should use the getAccessibleMethod() function to get the Method and call it repeatedly.
     * Match method name + parameter type at the same time,
     */
    @SuppressWarnings("unchecked")
    public static <E> E invokeMethod(final Object obj, final String methodName, final Class<?>[] parameterTypes,
            final Object[] args)
    {
        if (obj == null || methodName == null)
        {
            return null;
        }
        Method method = getAccessibleMethod(obj, methodName, parameterTypes);
        if (method == null)
        {
            logger.debug("In [" + obj.getClass() + "], [" + methodName + "] method was not found ");
            return null;
        }
        try
        {
            return (E) method.invoke(obj, args);
        }
        catch (Exception e)
        {
            String msg = "method: "+ method + ", obj:" + obj + ", args: "+ args + "";
            throw convertReflectionExceptionToUnchecked(msg, e);
        }
    }

    /**
     * Directly call object methods, ignoring private/protected modifiers,
     * It is used in the case of one-time call, otherwise it should be called repeatedly after obtaining the Method using the getAccessibleMethodByName() function.
     * Only match the function name, if there are multiple functions with the same name, call the first one.
     */
    @SuppressWarnings("unchecked")
    public static <E> E invokeMethodByName(final Object obj, final String methodName, final Object[] args)
    {
        Method method = getAccessibleMethodByName(obj, methodName, args.length);
        if (method == null)
        {
            // If it is empty, no error will be reported, and empty will be returned directly.
            logger.debug("In [" + obj.getClass() + "], [" + methodName + "] method was not found ");
            return null;
        }
        try
        {
            // Type conversion (convert the parameter data type to the target method parameter type)
            Class<?>[] cs = method.getParameterTypes();
            for (int i = 0; i < cs.length; i++)
            {
                if (args[i] != null && !args[i].getClass().equals(cs[i]))
                {
                    if (cs[i] == String.class)
                    {
                        args[i] = Convert.toStr(args[i]);
                        if (StringUtils.endsWith((String) args[i], ".0"))
                        {
                            args[i] = StringUtils.substringBefore((String) args[i], ".0");
                        }
                    }
                    else if (cs[i] == Integer.class)
                    {
                        args[i] = Convert.toInt(args[i]);
                    }
                    else if (cs[i] == Long.class)
                    {
                        args[i] = Convert.toLong(args[i]);
                    }
                    else if (cs[i] == Double.class)
                    {
                        args[i] = Convert.toDouble(args[i]);
                    }
                    else if (cs[i] == Float.class)
                    {
                        args[i] = Convert.toFloat(args[i]);
                    }
                    else if (cs[i] == Date.class)
                    {
                        if (args[i] instanceof String)
                        {
                            args[i] = DateUtils.parseDate(args[i]);
                        }
                        else
                        {
                            args[i] = DateUtil.getJavaDate((Double) args[i]);
                        }
                    }
                }
            }
            return (E) method.invoke(obj, args);
        }
        catch (Exception e)
        {
            String msg = "method: " + method + ", obj: " + obj + ", args: " + args + "";
            throw convertReflectionExceptionToUnchecked(msg, e);
        }
    }

    /**
     * Cycle upward transformation, get the DeclaredField of the object, and force it to be accessible.
     * If you can't find it after upcasting to Object, return null.
     */
    public static Field getAccessibleField(final Object obj, final String fieldName)
    {
        // No error is reported if it is empty. Return null directly
        if (obj == null)
        {
            return null;
        }
        Validate.notBlank(fieldName, "fieldName can't be blank");
        for (Class<?> superClass = obj.getClass(); superClass != Object.class; superClass = superClass.getSuperclass())
        {
            try
            {
                Field field = superClass.getDeclaredField(fieldName);
                makeAccessible(field);
                return field;
            }
            catch (NoSuchFieldException e)
            {
                continue;
            }
        }
        return null;
    }

    /**
     * Cycle upward transformation, get the DeclaredMethod of the object, and force it to be accessible.
     * If you can't find the object after upcasting, return null.
     * Match function name + parameter type.
     * Used when the method needs to be called multiple times. Use this function to get the Method first, and then call Method.invoke(Object obj, Object... args)
     */
    public static Method getAccessibleMethod(final Object obj, final String methodName,
            final Class<?>... parameterTypes)
    {
        // No error is reported if it is empty. Return null directly
        if (obj == null)
        {
            return null;
        }
        Validate.notBlank(methodName, "methodName can't be blank");
        for (Class<?> searchType = obj.getClass(); searchType != Object.class; searchType = searchType.getSuperclass())
        {
            try
            {
                Method method = searchType.getDeclaredMethod(methodName, parameterTypes);
                makeAccessible(method);
                return method;
            }
            catch (NoSuchMethodException e)
            {
                continue;
            }
        }
        return null;
    }

    /**
     * Cycle upward transformation, get the DeclaredMethod of the object and force it to be accessible.
     * If you can't find the object after upcasting, return null.
     * Only match function names.
     * Used when the method needs to be called multiple times. Use this function to get the Method first, and then call Method.invoke(Object obj, Object... args)
     */
    public static Method getAccessibleMethodByName(final Object obj, final String methodName, int argsNum)
    {
        // No error is reported if it is empty. Return null directly
        if (obj == null)
        {
            return null;
        }
        Validate.notBlank(methodName, "methodName can't be blank");
        for (Class<?> searchType = obj.getClass(); searchType != Object.class; searchType = searchType.getSuperclass())
        {
            Method[] methods = searchType.getDeclaredMethods();
            for (Method method: methods)
            {
                if (method.getName().equals(methodName) && method.getParameterTypes().length == argsNum)
                {
                    makeAccessible(method);
                    return method;
                }
            }
        }
        return null;
    }

    /**
     * Change the private/protected method to public, try not to call the actual changed statement, to avoid complaints from JDK SecurityManager.
     */
    public static void makeAccessible(Method method)
    {
        if ((!Modifier.isPublic(method.getModifiers()) || !Modifier.isPublic(method.getDeclaringClass().getModifiers()))
                && !method.isAccessible())
        {
            method.setAccessible(true);
        }
    }

    /**
     * Change the private/protected member variable to public, try not to call the actually changed statement, to avoid complaints from JDK SecurityManager.
     */
    public static void makeAccessible(Field field)
    {
        if ((!Modifier.isPublic(field.getModifiers()) || !Modifier.isPublic(field.getDeclaringClass().getModifiers())
                || Modifier.isFinal(field.getModifiers())) && !field.isAccessible())
        {
            field.setAccessible(true);
        }
    }

    /**
     * Through reflection, obtain the type of the generic parameter declared in the Class definition, note that the generic must be defined at the parent class
     * If not found, return to Object.class.
     */
    @SuppressWarnings("unchecked")
    public static <T> Class<T> getClassGenricType(final Class clazz)
    {
        return getClassGenricType(clazz, 0);
    }

    /**
     * Through reflection, get the type of the generic parameter of the parent class declared in the Class definition.
     * If it cannot be found, return to Object.class.
     */
    public static Class getClassGenricType(final Class clazz, final int index)
    {
        Type genType = clazz.getGenericSuperclass();

        if (!(genType instanceof ParameterizedType))
        {
            logger.debug(clazz.getSimpleName() + "'s superclass not ParameterizedType");
            return Object.class;
        }

        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

        if (index >= params.length || index < 0)
        {
            logger.debug("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: "
                    + params.length);
            return Object.class;
        }
        if (!(params[index] instanceof Class))
        {
            logger.debug(clazz.getSimpleName() + " not set the actual class on superclass generic parameter");
            return Object.class;
        }

        return (Class) params[index];
    }

    public static Class<?> getUserClass(Object instance)
    {
        if (instance == null)
        {
            throw new RuntimeException("Instance must not be null");
        }
        Class clazz = instance.getClass();
        if (clazz != null && clazz.getName().contains(CGLIB_CLASS_SEPARATOR))
        {
            Class<?> superClass = clazz.getSuperclass();
            if (superClass != null && !Object.class.equals(superClass))
            {
                return superClass;
            }
        }
        return clazz;

    }

    /**
     * Convert checked exception during reflection to unchecked exception.
     */
    public static RuntimeException convertReflectionExceptionToUnchecked(String msg, Exception e)
    {
        if (e instanceof IllegalAccessException || e instanceof IllegalArgumentException
                || e instanceof NoSuchMethodException)
        {
            return new IllegalArgumentException(msg, e);
        }
        else if (e instanceof InvocationTargetException)
        {
            return new RuntimeException(msg, ((InvocationTargetException) e).getTargetException());
        }
        return new RuntimeException(msg, e);
    }
}
