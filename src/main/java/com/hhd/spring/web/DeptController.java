package com.hhd.spring.web;


import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hhd.base.TreeDataHelper;
import com.hhd.mybatis.dept.HdDept;
import com.hhd.mybatis.dept.HdDeptDao;

@Controller
public class DeptController {
	
	private Logger logger=Logger.getLogger(DeptController.class);
	
	@Resource
	private HdDeptDao hdDeptDao;


	private String jspRoot="";
	
	@RequestMapping(value = "/dept!ajax.action", method = RequestMethod.GET)
	public void roleManage(HttpServletResponse response,Model model) throws Exception{
		List<HdDept> deptList=hdDeptDao.selectAll();
		String treeJson="";
		try {
			treeJson = TreeDataHelper.getTreeJson(deptList, "deptId", "deptName", "Root", "货主信息", "root");
			logger.info("tt===="+treeJson);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		response.getWriter().write(treeJson);
		response.getWriter().flush();
	}
	
	@RequestMapping(value = "/dept!save.action", method = RequestMethod.POST)
	public void saveRole(HttpServletResponse response,HdDept hdDept) throws IOException{
		logger.info("hdRole====================>"+hdDept);
		String errorMessage="";
		try {
			Date date =new Date();
			hdDept.setCreateOpId(100);
			hdDept.setUpdateOpId(100);
			hdDept.setCreateTime(date);
			hdDept.setUpdateTime(date);
			hdDept.setNodeType(1);
			hdDept.setCorpId(0);
			hdDeptDao.insertDept(hdDept);
			logger.info("Add Role  [DeptCode="+hdDept.getDeptCode()+",DeptName="+hdDept.getDeptName()+"]");
			response.getWriter().write("新增成功");
		} catch (Exception e) {
			errorMessage=e.getMessage();
			response.getWriter().write("新增失败［"+errorMessage+"]");

		}
		response.getWriter().flush();
	}
	
	

}
