package com.hhd.servlet.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HdTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public int doStartTag() throws JspException {
		String jspRoot=(String)pageContext.getServletContext().getAttribute("JspRoot");
		try {
			pageContext.getOut().print(jspRoot);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	
}
