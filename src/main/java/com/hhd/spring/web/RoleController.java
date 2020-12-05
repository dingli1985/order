package com.hhd.spring.web;


import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hhd.base.TreeDataHelper;
import com.hhd.mybatis.permission.HdPermission;
import com.hhd.mybatis.permission.HdPermissionDao;
import com.hhd.mybatis.permission.HdRole;
import com.hhd.mybatis.permission.HdRoleDao;

@Controller
public class RoleController {
	
	private Logger logger=Logger.getLogger(RoleController.class);
	
	@Resource
	private HdRoleDao hdRoleDao;
	@Resource
	private HdPermissionDao hdPermissionDao;

	private String jspRoot="";
	
	@RequestMapping(value = "/role!list.action", method = RequestMethod.GET)
	public String roleManage(HttpSession httpSession,Model model){
		jspRoot=(String)httpSession.getServletContext().getAttribute("version");
		logger.info("JspRoot====="+jspRoot);
		List<HdRole> roleList=hdRoleDao.selectAll();
		int roleId=0;
        for (Iterator<HdRole> iterator = roleList.iterator(); iterator.hasNext();) {
        	HdRole hdRole = iterator.next();
        	roleId=hdRole.getRoleId();
			logger.info("hdRole====="+hdRole.getRoleId()+" HdRoleName====>"+hdRole.getRoleName()+" HdRoleName====>"+hdRole.getRoleDesc());
		}
        List<HdPermission> rolePermissionlist=hdPermissionDao.queryPermissionByRoleId(roleId);
        for (Iterator<HdPermission> iterator = rolePermissionlist.iterator(); iterator.hasNext();) {
			HdPermission hdPermission = iterator.next();
			logger.info("hdRole=====hasPermission"+hdPermission.getHdPermissionName());
			
		}
		logger.info("GetRoleList====================>"+roleList.size());
		model.addAttribute("RootNode","角色列表");
        model.addAttribute("roleList",roleList);
	    return jspRoot+"/rolemgmt";
	}
	
	@RequestMapping(value = "/role!ajax.action", method = RequestMethod.GET)
	public void roleManage(HttpServletResponse response,Model model) throws Exception{
		List<HdRole> roleList=hdRoleDao.selectAll();
		String treeJson="";
		try {
			treeJson = TreeDataHelper.getTreeJson(roleList, "roleId", "roleName", "Root", "货主信息", "root");
			logger.info("tt===="+treeJson);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		response.getWriter().write(treeJson);
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/role!save.action", method = RequestMethod.POST)
	public void saveRole(HttpServletResponse response,HdRole hdRole) throws IOException{
		logger.info("hdRole====================>"+hdRole);
		String errorMessage="";
		try {
			hdRoleDao.insert(hdRole);
			logger.info("Add Role  [RoleId="+hdRole.getRoleId()+",RoleName="+hdRole.getRoleName()+"]");
			response.getWriter().write("新增成功");
		} catch (Exception e) {
			errorMessage=e.getMessage();
			response.getWriter().write("新增失败［"+errorMessage+"]");

		}
		response.getWriter().flush();
	}
	
	

}
