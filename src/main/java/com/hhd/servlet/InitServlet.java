package com.hhd.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class InitServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	@Override
	public void init() throws ServletException {
		super.init();
		String jspRoot=this.getInitParameter("version");
		this.getServletContext().setAttribute("version", jspRoot);
		System.out.println("JspRoot==============="+jspRoot);
	}

}
