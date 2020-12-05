package com.hhd.spring.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	protected static Logger logger = Logger.getLogger(MainController.class);

	/**
	 * 跳转到commonpage页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/main/common.action", method = RequestMethod.GET)
	public String getCommonPage() {
		logger.debug("Received request to show common page");
		return "commonpage";
	}

	/**
	 * 跳转到adminpage页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/main!admin.action", method = RequestMethod.GET)
	public String getAadminPage() {
		logger.debug("Received request to show admin page");
		return "adminpage";

	}
	

}