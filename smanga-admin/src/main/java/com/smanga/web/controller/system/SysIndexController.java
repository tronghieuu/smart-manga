package com.smanga.web.controller.system;

import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.smanga.common.config.SmartMangaConfig;
import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.entity.SysMenu;
import com.smanga.common.core.domain.entity.SysUser;
import com.smanga.common.core.text.Convert;
import com.smanga.common.utils.CookieUtils;
import com.smanga.common.utils.DateUtils;
import com.smanga.common.utils.ServletUtils;
import com.smanga.common.utils.ShiroUtils;
import com.smanga.common.utils.StringUtils;
import com.smanga.system.service.ISysConfigService;
import com.smanga.system.service.ISysMenuService;

/**
 * Home Business Processing
 * 
 * @author Trong Hieu
 */
@Controller
public class SysIndexController extends BaseController
{
    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private ISysConfigService configService;

    // System Home
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // Get identity information
        SysUser user = ShiroUtils.getSysUser();
        // Take out the menu according to the user id
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("sideTheme", configService.selectConfigByKey("sys.index.sideTheme"));
        mmap.put("skinName", configService.selectConfigByKey("sys.index.skinName"));
        mmap.put("ignoreFooter", configService.selectConfigByKey("sys.index.ignoreFooter"));
        mmap.put("copyrightYear", SmartMangaConfig.getCopyrightYear());
        mmap.put("demoEnabled", SmartMangaConfig.isDemoEnabled());
        mmap.put("isDefaultModifyPwd", initPasswordIsModify(user.getPwdUpdateDate()));
        mmap.put("isPasswordExpired", passwordIsExpiration(user.getPwdUpdateDate()));

        // Menu navigation display style
        String menuStyle = configService.selectConfigByKey("sys.index.menuStyle");
        // On the mobile terminal, the left navigation menu is used by default, otherwise the default configuration
        String indexStyle = ServletUtils.checkAgentIsMobile(ServletUtils.getRequest().getHeader("User-Agent"))? "Index": menuStyle;

        // Priority Cookie configuration navigation menu
        Cookie[] cookies = ServletUtils.getRequest().getCookies();
        for (Cookie cookie: cookies)
        {
            if (StringUtils.isNotEmpty(cookie.getName()) && "nav-style".equalsIgnoreCase(cookie.getName()))
            {
                indexStyle = cookie.getValue();
                break;
            }
        }
        String webIndex = "topnav".equalsIgnoreCase(indexStyle)? "Index-topnav": "index";
        return webIndex;
    }

    // switch theme
    @GetMapping("/system/switchSkin")
    public String switchSkin()
    {
        return "skin";
    }

    // switch menu
    @GetMapping("/system/menuStyle/{style}")
    public void menuStyle(@PathVariable String style, HttpServletResponse response)
    {
        CookieUtils.setCookie(response, "nav-style", style);
    }

    // system introduction
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        mmap.put("version", SmartMangaConfig.getVersion());
        return "main";
    }

    // Check whether the initial password is reminded to change
    public boolean initPasswordIsModify(Date pwdUpdateDate)
    {
        int initPasswordModify = Convert.toInt(configService.selectConfigByKey("sys.account.initPasswordModify"));
        return initPasswordModify == 1 && pwdUpdateDate == null;
    }

    // Check if the password has expired
    public boolean passwordIsExpiration(Date pwdUpdateDate)
    {
        int passwordValidateDays = Convert.toInt(configService.selectConfigByKey("sys.account.passwordValidateDays"));
        if (passwordValidateDays> 0)
        {
            if (StringUtils.isNull(pwdUpdateDate))
            {
                // If the initial password has never been changed, directly remind it to expire
                return true;
            }
            Date nowDate = DateUtils.getNowDate();
            return DateUtils.differentDaysByMillisecond(nowDate, pwdUpdateDate) > passwordValidateDays;
        }
        return false;
    }
}
