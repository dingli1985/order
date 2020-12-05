package com.hhd.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

@SuppressWarnings("serial")   
public class MyDispatcherServlet extends DispatcherServlet {   
   
    @Override   
    protected ModelAndView processHandlerException(HttpServletRequest request, HttpServletResponse response,   
    Object handler, Exception ex) throws Exception {   
        if (ex instanceof HttpRequestMethodNotSupportedException) {   
            return new ModelAndView("errors/405");   
        } else {   
            return super.processHandlerException(request, response, handler, ex);   
        }   
    }   
}   