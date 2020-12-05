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

import com.hhd.mybatis.unit.HdUnit;
import com.hhd.mybatis.unit.HdUnitDao;

@Controller
public class UnitController {
	
	private Logger logger=Logger.getLogger(UnitController.class);
	
	@Resource
	private HdUnitDao hdUnitDao;


	private String jspRoot="";
	
	@RequestMapping(value = "/unit!list.action", method = RequestMethod.GET)
	public String roleManage(HttpSession httpSession,Model model){
		jspRoot=(String)httpSession.getServletContext().getAttribute("version");
		logger.info("JspRoot====="+jspRoot);
		List<HdUnit> unitList=hdUnitDao.selectAll();
        for (Iterator<HdUnit> iterator = unitList.iterator(); iterator.hasNext();) {
        	HdUnit hdUnit = iterator.next();
			logger.info("hdRole====="+hdUnit.getHdUnitCode()+" HdRoleName====>"+hdUnit.getHdUnitName()+" HdUnitNotes====>"+hdUnit.getHdNodes());
		}

		logger.info("GetRoleList====================>"+unitList.size());
		model.addAttribute("RootNode","单位列表");
        model.addAttribute("unitList",unitList);
	    return jspRoot+"/unitmgmt";
	}
	
	@RequestMapping(value = "/unit!save.action", method = RequestMethod.POST)
	public void saveRole(HttpServletResponse response,HdUnit hdUnit) throws IOException{
		logger.info("hdRole====================>"+hdUnit);
		String errorMessage="";
		try {
			hdUnitDao.insert(hdUnit);
			logger.info("Add Role  [UnitCode="+hdUnit.getHdUnitCode()+",UnitName="+hdUnit.getHdUnitName()+"]");
			response.getWriter().write("新增成功");
		} catch (Exception e) {
			errorMessage=e.getMessage();
			response.getWriter().write("新增失败［"+errorMessage+"]");

		}
		response.getWriter().flush();
	}
	
	

}
