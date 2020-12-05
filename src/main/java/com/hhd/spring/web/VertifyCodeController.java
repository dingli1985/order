package com.hhd.spring.web;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hhd.security.CaptchaUtil;

@Controller
public class VertifyCodeController {
	
	private Logger logger=Logger.getLogger(VertifyCodeController.class);
	
	
	@RequestMapping(value = "/vertify!getCode.action", method = RequestMethod.GET)
    @ResponseBody
    public void captcha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
		logger.info("Genrator===========>vertifyCode");
        CaptchaUtil.outputCaptcha(request, response);
    }

}
