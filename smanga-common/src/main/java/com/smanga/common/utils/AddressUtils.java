package com.smanga.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.JSONObject;
import com.smanga.common.config.SmartMangaConfig;
import com.smanga.common.constant.Constants;
import com.smanga.common.utils.http.HttpUtils;

/**
 * Get address class
 *
 * @author Trong Hieu
 */
public class AddressUtils
{
    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);

    // IP address query
    public static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";

    // unknown address
    public static final String UNKNOWN = "XX XX";

    public static String getRealAddressByIP(String ip)
    {
        String address = UNKNOWN;
        // Intranet does not query
        if (IpUtils.internalIp(ip))
        {
            return "Intranet IP";
        }
        if (SmartMangaConfig.isAddressEnabled())
        {
            try
            {
                String rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", Constants.GBK);
                if (StringUtils.isEmpty(rspStr))
                {
                    log.error("Access to geographic location exception {}", ip);
                    return UNKNOWN;
                }
                JSONObject obj = JSONObject.parseObject(rspStr);
                String region = obj.getString("pro");
                String city = obj.getString("city");
                return String.format("%s %s", region, city);
            }
            catch (Exception e)
            {
                log.error("Access to geographic location exception {}", e);
            }
        }
        return address;
    }
}
