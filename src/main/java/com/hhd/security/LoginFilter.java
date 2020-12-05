package com.hhd.security;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.hhd.util.StringUtil;

public class LoginFilter implements Filter  {
	
	
	private Set<String> skipValidatePageSet = new HashSet<String>();

	
	private Logger logger=Logger.getLogger(LoginFilter.class);
	


	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * 是否跳过会话验证
	 * @param requestUri
	 * @param contextPath
	 * @return
	 */
	private boolean isSkipValidate(Set<String> skipValidatePageSet,String requestUri, String contextPath) {
		boolean isSkip = false;
		for (Iterator<String> iterator = skipValidatePageSet.iterator(); iterator.hasNext();) {
			String page = iterator.next();
			if(requestUri.indexOf(page) != -1){
				isSkip=true ;
			}
		}
		return isSkip;
	}
	
	/**
	 * 是否跳过会话验证
	 * @param requestUri
	 * @param contextPath
	 * @return
	 */
	private boolean validatePermission(String requestUri, Set<String> set) {
		
		return true;
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filerChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session =request.getSession();
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        
        //String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;  
        //是否跳过页面检查
        String isLogin =(String)session.getAttribute("isLogin");
        boolean isSkip=isSkipValidate(skipValidatePageSet,requestUri,contextPath);
		boolean isPermitted=validatePermission(requestUri,null);

		// 不是跳过检查的请求
		if (!isSkip) {
			// 判断是否登录
			if (!"true".equals(isLogin)) {
				logger.info("requestUri=====>" + requestUri + "===isLogin" + isLogin + "Redirect to /jsp/mainLogin.jsp");
				response.sendRedirect(contextPath + "/jsp/mainLogin.jsp");
				return;
			}
			// 判断是否有权限访问资源
			if (!isPermitted) {
				logger.info("requestUri=====>" + requestUri + "===isPermitted" + isPermitted
						+ "Redirect to /jsp/noPermission.jsp");
				response.sendRedirect(contextPath + "/jsp/noPermission.jsp");
				return;
			}

		}

    	filerChain.doFilter(request, response);//放行。让其走到下个链或目标资源中


		
	}
	
	
	
	

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String skipPrivilegeValidatePage = filterConfig.getInitParameter("IGNORE_URI");
		if(!StringUtil.isNull(skipPrivilegeValidatePage)) {
			String[] urls = skipPrivilegeValidatePage.split(",");
			for (int i = 0; i < urls.length; i++) {
				skipValidatePageSet.add(urls[i].trim());
			}
		}
		//filterConfig.getServletContext().setAttribute("version", "web2");
	}
	
	public static void main(String[] args) {
		String requestUri="/order/jsp/noPermission.jsp";
		System.out.println(requestUri.indexOf("/jsp/login.jsp"));
		System.out.println(requestUri.indexOf("/jsp/index.jsp"));
	}

}
