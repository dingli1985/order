package com.hhd.spring.web;


import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hhd.base.ContextHelper;
import com.hhd.base.TreeDataHelper;
import com.hhd.mybatis.operator.HdOperator;
import com.hhd.mybatis.operator.HdOperatorDao;
import com.hhd.mybatis.permission.HdPermission;
import com.hhd.mybatis.permission.HdPermissionDao;
import com.hhd.spring.jdbc.CommonSpringCrudService;

@Controller
public class OperatorController {
	
	private Logger logger=Logger.getLogger(OperatorController.class);
	
	@Resource
	private HdOperatorDao hdUsersDao;
	@Resource
	private HdPermissionDao hdPermissionDao;
	private String userName;
	private String passWord;
	private String vertifyCode;
	private String jspRoot="";

	@RequestMapping(value = "/operator!toLogin.action", method = RequestMethod.POST)
	public String toLogin(){
		logger.info("toLogin===================================");
		return "loginSuccess";
	}
	
	@RequestMapping(value = "/operator!list.action", method = RequestMethod.GET)
	public String listUser(HttpSession httpSession,Model model){
		jspRoot=(String)httpSession.getServletContext().getAttribute("version");
		logger.info("JspRoot====="+jspRoot);
		List<HdOperator> hdUserList=hdUsersDao.selectAll();
		logger.info("listUserAll==================================="+hdUserList);
		model.addAttribute("RootNode","用户列表");
		model.addAttribute("userList",hdUserList);
		return jspRoot+"/usermgmt";
	}
	
	@RequestMapping(value = "/operator!ajax.action", method = RequestMethod.GET)
	public void roleManage(HttpServletResponse response,Model model) throws Exception{
		List<HdOperator> hdUserList=hdUsersDao.selectAll();
		String treeJson="";
		try {
			treeJson = TreeDataHelper.getTreeJson(hdUserList, "operatorId", "operatorName", "Root", "货主信息", "root");
			logger.info("tt===="+treeJson);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		response.getWriter().write(treeJson);
		response.getWriter().flush();
	}
	
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder)
	{
		dataBinder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
		    @Override
			public void setAsText(String value) {
		        try {
		            setValue(new SimpleDateFormat("yyyy-MM-dd Hh:mm:ss").parse(value));
		        } catch(ParseException e) {
		            setValue(new Date());
		        }
		    }
		    @Override
			public String getAsText() {
		        return new SimpleDateFormat("yyyy-MM-dd Hh:mm:ss").format((Date) getValue());
		    }        

		});
	}

	
	@RequestMapping(value = "/operator!save.action", method = RequestMethod.POST)
	public void saveOperator(HttpServletResponse response,HdOperator hdUser) throws IOException{
		String errorMessage="";
		try {
			logger.info("Add Role  [OperatorId="+hdUser.getOperatorCode()+",OperatorName="+hdUser.getOperatorName()+"]");
			//hdUsersDao.insert(hdUser);
			hdUsersDao.insertOperator(hdUser);
			response.getWriter().write("新增成功");
		} catch (Exception e) {
			errorMessage=e.getMessage();
			e.printStackTrace();
			response.getWriter().write("新增失败［"+errorMessage+"]");
		}
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/operator!queryById.action", method = RequestMethod.POST)
	public void queryById(HttpServletResponse response,String id) throws IOException{
		logger.info("queryById==================================="+id);
		String errorMessage="";
		try {
			HdOperator operator= hdUsersDao.queryByOperatorId(Integer.parseInt(id));
			response.getWriter().write(operator.getOperatorName());
		} catch (Exception e) {
			errorMessage=e.getMessage();
			e.printStackTrace();
			response.getWriter().write("新增失败［"+errorMessage+"]");
		}
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/operator!listUserPage.action", method = RequestMethod.GET)
	public String listUserPage(Model model){
		logger.info("listUserAll===================================");
		List<HdOperator> hdUserList=hdUsersDao.selectAll();
		logger.info("listUserAll==================================="+hdUserList);

		
		model.addAttribute("userList",hdUserList);
		return jspRoot+"／usermgmt";
	}
	
	
	@RequestMapping(value = "/operator!login.action", method = RequestMethod.POST)
	public String login(HttpSession httpSession,String userName,String passWord,String vertifyCode,Model model){
		logger.info("Sombody Login in");
		logger.info("userName====="+userName);
		logger.info("passWord====="+passWord);
		logger.info("vertifyCode====="+vertifyCode);
		jspRoot=(String)httpSession.getServletContext().getAttribute("version");
		String sessionCode=(String)httpSession.getAttribute("randomString");
		logger.info("JspRoot====="+jspRoot);
		if(!sessionCode.equals(vertifyCode)){
			logger.info("验证码错误====="+vertifyCode);
			model.addAttribute("errorMsg","验证码错误");
			return "/mainLogin";
		}
		HdOperator user=hdUsersDao.queryOperatorByAccAndPwd(userName, passWord);
        if(null==user){
			model.addAttribute("errorMsg","用户名或密码错误");
			return "/mainLogin";
		}
        List<HdPermission> permissionListAll= hdPermissionDao.queryPermissionByUserId(user.getOperatorId());
        Map<Integer,List<HdPermission>> userPermissinMap =new LinkedHashMap<Integer,List<HdPermission>>();
        int _permissionId=-1;//临时变量
        List<HdPermission> permissionList;
        for (Iterator<HdPermission> iterator = permissionListAll.iterator(); iterator.hasNext();) {
			HdPermission hdPermission = iterator.next();
			logger.info("hdPermission====="+hdPermission.getHdPermissionName()+" Url====>"+hdPermission.getHdPermissionUrl());
            //一级菜单
			logger.info("_permissionId"+_permissionId);
			if(hdPermission.getHdParentId()!=99){
				_permissionId=hdPermission.getHdPermissionId();
				userPermissinMap.get(hdPermission.getHdParentId()).add(hdPermission);
            }else{
            	permissionList=new ArrayList<HdPermission>();
            	permissionList.add(hdPermission);
            	userPermissinMap.put(hdPermission.getHdPermissionId(), permissionList);
            }
			
		}
        
        httpSession.setAttribute("isLogin", "true");
        httpSession.setAttribute("userName", user.getOperatorName());
        model.addAttribute("userPermissinMap",userPermissinMap);
		logger.info("user====="+user.getOperatorName());
	    return jspRoot+"/index";
	}
	@RequestMapping(value = "/operator!logout.action", method = RequestMethod.GET)
	public String logout(HttpServletRequest httpServletRequest){
		logger.info("Sombody Login out");
		HttpSession httpSession=httpServletRequest.getSession();
		 if (httpSession.getAttribute("isLogin") != null) {
		      System.out.println("用户注销.....");
		      httpSession.invalidate();
		    }
		 return "redirect:/jsp/mainLogin.jsp";
	}
	
	/**
	 * Spring 通用接口
	 * @param session
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/sysdate", method = RequestMethod.GET)
	public void getSysDate(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{
		CommonSpringCrudService curdService=ContextHelper.getBean("crudService");
		String dbDate=curdService.getDbTime("yyyy-MM-dd HH:mm:ss");
		logger.info("System Date====================>"+dbDate);
		response.getWriter().write("当前系统时间:=========="+dbDate);
		response.getWriter().flush();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getVertifyCode() {
		return vertifyCode;
	}

	public void setVertifyCode(String vertifyCode) {
		this.vertifyCode = vertifyCode;
	}
	
	

}
