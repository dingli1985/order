package com.hhd.spring.web;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hhd.base.TreeDataHelper;
import com.hhd.mybatis.cargo.HdCargoOwner;
import com.hhd.mybatis.cargo.HdCargoOwnerDao;
import com.hhd.mybatis.dept.HdDept;

@Controller
public class CargoController {
	
	private Logger logger=Logger.getLogger(CargoController.class);
	
	@Resource
	private HdCargoOwnerDao hdCargoOwnerDao;


	private String jspRoot="";
	
	@RequestMapping(value = "/cargo!ajax.action", method = RequestMethod.GET)
	public void roleManage(HttpServletResponse response) throws Exception{
		 List<HdCargoOwner> noteList=hdCargoOwnerDao.selectAll();
			String treeJson="";
			try {
				treeJson = TreeDataHelper.getTreeJson(noteList, "cargoId", "cargoName", "Root", "货主信息", "root");
				logger.info("tt===="+treeJson);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}

			response.getWriter().write(treeJson);
			response.getWriter().flush();
	}
	
	@RequestMapping(value = "/cargo!save.action", method = RequestMethod.POST)
	public void saveRole(HttpServletResponse response,HdDept hdDept) throws IOException{
		logger.info("hdRole====================>"+hdDept);
		String errorMessage="";
		try {
			
			logger.info("Add Role  [DeptCode="+hdDept.getDeptCode()+",DeptName="+hdDept.getDeptName()+"]");
			response.getWriter().write("新增成功");
		} catch (Exception e) {
			errorMessage=e.getMessage();
			response.getWriter().write("新增失败［"+errorMessage+"]");

		}
		response.getWriter().flush();
	}
	
	

}
