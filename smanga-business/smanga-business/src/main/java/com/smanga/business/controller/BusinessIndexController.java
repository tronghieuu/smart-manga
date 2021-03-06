package com.smanga.business.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smanga.business.domain.BusinessUser;
import com.smanga.business.domain.Manga;
import com.smanga.business.domain.MangaChapter;
import com.smanga.business.service.IMangaChapterService;
import com.smanga.business.service.IMangaService;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.utils.StringUtils;
import com.smanga.framework.shiro.util.ShiroUtils;

/**
 * @author Trong Hieu
 *
 */
@Controller
public class BusinessIndexController extends BusinessBaseController {

	private String prefix = "user";

	@Autowired
	private IMangaService mangaService;

	@Autowired
	private IMangaChapterService mangaChapterService;

	@GetMapping("/index")
	public String getHomePage(ModelMap mmap) {
		mmap.put("user", getUserInfo());
		mmap.put("popularManga", mangaService.selectMostPopularMangaList(new Manga()));
		mmap.put("popularChapter", mangaChapterService.selectMostPopularChapter(new MangaChapter()));
		return "index";
	}

	@GetMapping("/login")
	public String getLoginPage() {
		return "login";
	}

	@GetMapping("/register")
	public String getRegisterPage() {
		return "register";
	}

	@PostMapping("/login")
	@ResponseBody
	public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe) {
		UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
			return success();
		} catch (AuthenticationException e) {
			String msg = "User or password is wrong";
			if (StringUtils.isNotEmpty(e.getMessage())) {
				msg = e.getMessage();
			}
			return error(msg);
		}
	}

	/**
	 * Personal information
	 */
	@GetMapping("/user/profile")
	public String profile(ModelMap mmap) {
		BusinessUser user = getUserInfo();
		mmap.put("user", user);
		return prefix + "/profile";
	}

	@GetMapping("/logout")
	public String logout() {
		ShiroUtils.logout();
		return "index";
	}
}
