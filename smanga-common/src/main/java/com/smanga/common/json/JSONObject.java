package com.smanga.common.json;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smanga.common.utils.StringUtils;

/**
 * General message object, a nestable data structure based on Map implementation. Support JSON data structure.
 *
 * @author Trong Hieu
 */
public class JSONObject extends LinkedHashMap<String, Object>
{
    private static final long serialVersionUID = 1L;
    private static final Pattern arrayNamePattern = Pattern.compile("(\\w+)((\\[\\d+\\])+)");
    private static final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * Array structure.
     */
    public static class JSONArray extends ArrayList<Object>
    {
        private static final long serialVersionUID = 1L;

        public JSONArray()
        {
            super();
        }

        public JSONArray(int size)
        {
            super(size);
        }

        @Override
        public String toString()
        {
            try
            {
                return JSON.marshal(this);
            }
            catch (Exception e)
            {
                throw new RuntimeException(e);
            }
        }

        @Override
        public Object set(int index, Object element)
        {
            return super.set(index, transfer(element));
        }

        @Override
        public boolean add(Object element)
        {
            return super.add(transfer(element));
        }

        @Override
        public void add(int index, Object element)
        {
            super.add(index, transfer(element));
        }
    }

    public JSONObject()
    {
        super();
    }

    public JSONObject(final JSONObject other)
    {
        super(other);
    }

    @Override
    public String toString()
    {
        try
        {
            return JSON.marshal(this);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * A string converted to compact format.
     *
     * @return returns the compact format string of this object.
     */
    public String toCompactString()
    {
        try
        {
            return objectMapper.writeValueAsString(this);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * Get the integer value of the specified field. If the field does not exist or cannot be converted to an integer, null is returned.
     *
     * @param name field name, supports multiple levels.
     * @return returns the specified integer value, or null.
     */
    public Integer intValue(final String name)
    {
        return valueAsInt(value(name));
    }

    /**
     * Get the integer value of the specified field. If the field does not exist or cannot be converted to an integer, the defaultValue is returned.
     *
     * @param name field name, supports multiple levels.
     * @param defaultValue The value returned when the query fails.
     * @return returns the specified integer value, or defaultValue.
     */
    public Integer intValue(final String name, final Integer defaultValue)
    {
        return StringUtils.nvl(intValue(name), defaultValue);
    }

    /**
     * Get the long integer value of the specified field. If the field does not exist or cannot be converted to a long integer, null is returned.
     *
     * @param name field name, supports multiple levels.
     * @return returns the specified long integer value, or null.
     */
    public Long longValue(final String name)
    {
        return valueAsLong(value(name));
    }

    /**
     * Get the long integer value of the specified field. If the field does not exist or cannot be converted to a long integer, the defaultValue is returned.
     *
     * @param name field name, supports multiple levels.
     * @param defaultValue The value returned when the query fails.
     * @return returns the specified long integer value, or defaultValue.
     */
    public Long longValue(final String name, final Long defaultValue)
    {
        return StringUtils.nvl(longValue(name), defaultValue);
    }

    /**
     * Get the Boolean value of the specified field. If the field does not exist or cannot be converted to boolean, null is returned.
     *
     * @param name field name, supports multiple levels.
     * @return returns the specified Boolean value, or null.
     */
    public Boolean boolValue(final String name)
    {
        return valueAsBool(value(name));
    }

    /**
     * Get the boolean value of the specified field. If the field does not exist or cannot be converted to a boolean, the defaultValue is returned.
     *
     * @param name field name, supports multiple levels.
     * @param defaultValue The value returned when the query fails.
     * @return returns the specified Boolean value, or defaultValue.
     */
    public Boolean boolValue(final String name, final Boolean defaultValue)
    {
        return StringUtils.nvl(boolValue(name), defaultValue);
    }

    /**
     * Get the string value of the specified field. If the field does not exist, return null.
     *
     * @param name field name, supports multiple levels.
     * @return returns the specified string value, or null.
     */
    public String strValue(final String name)
    {
        return valueAsStr(value(name));
    }

    /**
     * Get the string value of the specified field. If the field does not exist, the defaultValue is returned.
     *
     * @param name field name, supports multiple levels.
     * @param defaultValue The value returned when the query fails.
     * @return returns the specified string value, or defaultValue.
     */
    public String strValue(final String name, final String defaultValue)
    {
        return StringUtils.nvl(strValue(name), defaultValue);
    }

    /**
     * Get the value of the specified field.
     *
     * @param name field name, supports multi-level, supports array subscript.
     * @return returns the value of the specified field.
     */
    public Object value(final String name)
    {
        final int indexDot = name.indexOf('.');
        if (indexDot >= 0)
        {
            return obj(name.substring(0, indexDot)).value(name.substring(indexDot + 1));
        }
        else
        {
            final Matcher matcher = arrayNamePattern.matcher(name);
            if (matcher.find())
            {
                return endArray(matcher.group(1), matcher.group(2), new EndArrayCallback<Object>()
                {
                    @Override
                    public Object callback(JSONArray arr, int index)
                    {
                        return elementAt(arr, index);
                    }
                });
            }
            else
            {
                return get(name);
            }
        }
    }

    /**
     * Set the value of the specified field.
     *
     * @param name field name, supports multi-level, supports array subscript.
     * @param value field value.
     * @return returns this object.
     */
    public JSONObject value(final String name, final Object value)
    {
        final int indexDot = name.indexOf('.');
        if (indexDot >= 0)
        {
            obj(name.substring(0, indexDot)).value(name.substring(indexDot + 1), value);
        }
        else
        {
            final Matcher matcher = arrayNamePattern.matcher(name);
            if (matcher.find())
            {
                endArray(matcher.group(1), matcher.group(2), new EndArrayCallback<Void>()
                {
                    @Override
                    public Void callback(JSONArray arr, int index)
                    {
                        elementAt(arr, index, value);
                        return null;
                    }
                });
            }
            else
            {
                set(name, value);
            }
        }
        return this;
    }

    /**
     * Get the object (non-scalar type) field. The returned data is a structure. When the specified object does not exist, an empty MessageObject object is created for the specified name.
     *
     * @param name field name. Multi-level names are not supported, and array subscripts are supported.
     * @return returns the specified object. If the object does not exist, an empty MessageObject object is created for the specified name.
     */
    public JSONObject obj(final String name)
    {
        final Matcher matcher = arrayNamePattern.matcher(name);
        if (matcher.find())
        {
            return endArray(matcher.group(1), matcher.group(2), new EndArrayCallback<JSONObject>()
            {
                @Override
                public JSONObject callback(JSONArray arr, int index)
                {
                    return objAt(arr, index);
                }
            });
        }
        else
        {
            JSONObject obj = getObj(name);
            if (obj == null)
            {
                obj = new JSONObject();
                put(name, obj);
            }
            return obj;
        }
    }

    /**
     * Get the array field. Return the object corresponding to the name as an array object. When the specified field does not exist, create an empty array.
     *
     * @param name field name. Multi-level names and subscripts are not supported.
     * @return returns an array (List).
     */
    public JSONArray arr(final String name)
    {
        JSONArray arr = getArr(name);
        if (arr == null)
        {
            arr = new JSONArray();
            put(name, arr);
        }
        return arr;
    }

    /**
     * Get the object (non-scalar type) field. The returned data is a structure.
     *
     * @param name field name.
     * @return returns the specified object field.
     */
    public JSONObject getObj(final String name)
    {
        return (JSONObject) get(name);
    }

    /**
     * Get the array type field.
     *
     * @param name field name.
     * @return returns an array type field.
     */
    public JSONArray getArr(final String name)
    {
        return (JSONArray) get(name);
    }

    /**
     * Returns the integer value of the field. If it does not exist, return null.
     *
     * @param name field name.
     * @return returns the integer value of the specified field.
     */
    public Integer getInt(final String name)
    {
        return valueAsInt(get(name));
    }

    /**
     * Returns the integer value of the field. If it does not exist, the defaultValue is returned.
     *
     * @param name field name.
     * @param defaultValue The value returned when the field does not exist.
     * @return returns the integer value of the specified field.
     */
    public Integer getInt(final String name, Integer defaultValue)
    {
        return StringUtils.nvl(getInt(name), defaultValue);
    }

    /**
     * Returns the long integer value of the field. If it does not exist, return null.
     *
     * @param name field name.
     * @return returns the long integer value of the specified field.
     */
    public Long getLong(final String name)
    {
        return valueAsLong(get(name));
    }

    /**
     * Returns the long integer value of the field. If it does not exist, the defaultValue is returned.
     *
     * @param name field name.
     * @param defaultValue The value returned when the field does not exist.
     * @return returns the long integer value of the specified field.
     */
    public Long getLong(final String name, Long defaultValue)
    {
        return StringUtils.nvl(getLong(name), defaultValue);
    }

    /**
     * Return the field string value. If it does not exist, return null.
     *
     * @param name field name.
     * @return returns the string value of the specified field.
     */
    public String getStr(final String name)
    {
        return valueAsStr(get(name));
    }

    /**
     * Return the field string value. If it does not exist, the defaultValue is returned.
     *
     * @param name field name.
     * @param defaultValue The value returned when the field does not exist.
     * @return returns the string value of the specified field.
     */
    public String getStr(final String name, final String defaultValue)
    {
        return StringUtils.nvl(getStr(name), defaultValue);
    }

    /**
     * The field value is returned in Boolean type. If it does not exist, return null.
     *
     * @param name field name.
     * @return field value.
     */
    public Boolean getBool(final String name)
    {
        return valueAsBool(get(name));
    }

    /**
     * The field value is returned in Boolean type. If it does not exist, the defaultValue is returned.
     *
     * @param name field name.
     * @param defaultValue The value returned when the field does not exist.
     * @return field value.
     */
    public Boolean getBool(final String name, final Boolean defaultValue)
    {
        return StringUtils.nvl(getBool(name), defaultValue);
    }

    /**
     * Set field value
     *
     * @param name field name
     * @param value Field value (scalar: number, string, boolean; structure: MessageObject). If it is Map type and not MessageObject type, it will be automatically converted to MessageObject type and then stored
     * (At this time, if you modify the data in the Map, it will not be reflected in this object).
     * @return returns this object
     */
    public JSONObject set(final String name, final Object value)
    {
        put(name, value);
        return this;
    }

    /**
     * Convert this object to Java Bean.
     *
     * @param beanClass Java Bean class object.
     * @return returns the converted Java Bean.
     */
    public <T> T asBean(Class<T> beanClass)
    {
        try
        {
            return JSON.unmarshal(JSON.marshal(this), beanClass);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    /**
     * Overload the methods of the base class. If the value is of type Map but not of type MessageObject, create a MessageObject that contains the same content as the original Map as the value (Note: If you change the content of the Map later, it will not be reflected
     * MessageObject). The purpose of overloading this method is to enable JSON to be correctly parsed into MessageObject objects. It is not recommended to call this method directly, please use the set(name, value) method to set the field value.
     */
    @Override
    public Object put(String key, Object value)
    {
        return super.put(key, transfer(value));
    }

    public static Integer valueAsInt(Object value)
    {
        if (value instanceof Integer)
        {
            return (Integer) value;
        }
        else if (value instanceof Number)
        {
            return ((Number) value).intValue();
        }
        else if (value instanceof String)
        {
            return Integer.valueOf((String) value);
        }
        else if (value instanceof Boolean)
        {
            return ((Boolean) value) ? 1 : 0;
        }
        else
        {
            return null;
        }
    }

    public static Long valueAsLong(Object value)
    {
        if (value instanceof Long)
        {
            return (Long) value;
        }
        else if (value instanceof Number)
        {
            return ((Number) value).longValue();
        }
        else if (value instanceof String)
        {
            return Long.valueOf((String) value);
        }
        else if (value instanceof Boolean)
        {
            return ((Boolean) value) ? 1L : 0L;
        }
        else
        {
            return null;
        }
    }

    public static String valueAsStr(Object value)
    {
        if (value instanceof String)
        {
            return (String) value;
        }
        else if (value != null)
        {
            return value.toString();
        }
        else
        {
            return null;
        }
    }

    public static Boolean valueAsBool(Object value)
    {
        if (value instanceof Boolean)
        {
            return (Boolean) value;
        }
        else if (value instanceof Number)
        {
            return ((Number) value).doubleValue() != 0.0;
        }
        else if (value instanceof String)
        {
            return Boolean.valueOf((String) value);
        }
        else
        {
            return null;
        }
    }

    /**
     * Convert all types of Map that are not MessageObject at the same time to MessageObject.
     *
     * @param value value.
     * @return returns the converted value.
     */
    @SuppressWarnings("unchecked")
    private static Object transfer(final Object value)
    {
        if (!(value instanceof JSONObject) && value instanceof Map)
        {
            return toObj((Map<String, Object>) value);
        }
        else if (!(value instanceof JSONArray) && value instanceof Collection)
        {
            return toArr((Collection<Object>) value);
        }
        else
        {
            return value;
        }
    }

    private static JSONArray toArr(final Collection<Object> list)
    {
        final JSONArray arr = new JSONArray(list.size());
        for (final Object element : list)
        {
            arr.add(element);
        }
        return arr;
    }

    private static JSONObject toObj(final Map<String, Object> map)
    {
        final JSONObject obj = new JSONObject();
        for (final Map.Entry<String, Object> ent : map.entrySet())
        {
            obj.put(ent.getKey(), transfer(ent.getValue()));
        }
        return obj;
    }

    /**
     * Return the specified subscript element as an array, if it does not exist, create an empty array at that position.
     *
     * @param arr The current array.
     * @param index subscript.
     * @return returns the element of the specified subscript of the current array, which should be an array.
     */
    private static JSONArray arrayAt(JSONArray arr, int index)
    {
        expand(arr, index);
        if (arr.get(index) == null)
        {
            arr.set(index, new JSONArray());
        }
        return (JSONArray) arr.get(index);
    }

    /**
     * Return the specified subscript element as a structure. If it does not exist, create an empty structure at that position.
     *
     * @param arr The current array.
     * @param index subscript.
     * @return returns the specified subscript element of the current array, which is a structure.
     */
    private static JSONObject objAt(final JSONArray arr, int index)
    {
        expand(arr, index);
        if (arr.get(index) == null)
        {
            arr.set(index, new JSONObject());
        }
        return (JSONObject) arr.get(index);
    }

    /**
     * Set the value of the specified subscript position of the array.
     *
     * @param arr array.
     * @param index subscript.
     * @param value value.
     */
    private static void elementAt(final JSONArray arr, final int index, final Object value)
    {
        expand(arr, index).set(index, value);
    }

    /**
     * Get the value of the specified subscript element of the array.
     *
     * @param arr array.
     * @param index subscript.
     * @return value.
     */
    private static Object elementAt(final JSONArray arr, final int index)
    {
        return expand(arr, index).get(index);
    }

    /**
     * Extend the array to the specified subscript to prevent the subscript from crossing the boundary during access.
     *
     * @param arr array
     * @param index subscript
     * @return returns the passed array
     */
    private static JSONArray expand(final JSONArray arr, final int index)
    {
        while (arr.size() <= index)
        {
            arr.add(null);
        }
        return arr;
    }

    /**
     * Last array callback.
     *
     * @author Mike
     *
     * @param <T> The callback returns the data type.
     */
    private interface EndArrayCallback<T>
    {
        /**
         * When locating to the last level of the array, this method will be called.
         *
         * @param arr The last level array object.
         * @param index The last level index.
         * @return returns the return value of the callback.
         */
        T callback(JSONArray arr, int index);
    }

    /**
     * Tool functions for handling multi-dimensional arrays (including one-dimensional arrays). The name of the multi-dimensional array is like: arrary[1][2][3], then name=array, indexStr=[1][2][3], in the callback, endArr will be
     * The object specified by array[1][2], indexe=3.
     *
     * @param name The name without subscript, and multi-level names are not supported.
     * @param indexesStr The string of the index part, such as: [1][2][3]
     * @param callback callback function.
     * @return returns the return value of the callback function.
     */
    private <T> T endArray(final String name, final String indexesStr, final EndArrayCallback<T> callback)
    {
        JSONArray endArr = arr(name);
        final int[] indexes = parseIndexes(indexesStr);
        int i = 0;
        while (i < indexes.length - 1)
        {
            endArr = arrayAt(endArr, indexes[i++]);
        }
        return callback.callback(endArr, indexes[i]);
    }

    private static int[] parseIndexes(final String s)
    {
        int[] indexes = null;
        List<Integer> list = new ArrayList<Integer>();

        final StringTokenizer st = new StringTokenizer(s, "[]");
        while (st.hasMoreTokens())
        {
            final int index = Integer.valueOf(st.nextToken());
            if (index < 0)
            {
                throw new RuntimeException(String.format("Illegal index %1$d in \"%2$s\"", index, s));
            }

            list.add(index);
        }

        indexes = new int[list.size()];
        int i = 0;
        for (Integer tmp : list.toArray(new Integer[list.size()]))
        {
            indexes[i++] = tmp;
        }

        return indexes;
    }
}
