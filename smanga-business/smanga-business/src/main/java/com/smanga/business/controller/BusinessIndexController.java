package com.smanga.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Trong Hieu
 *
 */
@Controller
public class BusinessIndexController extends BusinessBaseController {

	@GetMapping("/index")
	public String getHomePage() {
		return "index";
	}
}
