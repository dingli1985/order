package com.hhd.spring.web;


import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hhd.mybatis.dept.HdDept;
import com.hhd.mybatis.material.HdMaterial;
import com.hhd.mybatis.material.HdMaterialDao;

@Controller
public class MaterialController {
	
	private Logger logger=Logger.getLogger(MaterialController.class);
	
	@Resource
	private HdMaterialDao hdMaterialDao;


	private String jspRoot="";
	
	@RequestMapping(value = "/material!ajax.action", method = RequestMethod.GET)
	public void roleManage(HttpServletResponse response) throws IOException{
		 List<HdMaterial> noteList=hdMaterialDao.selectAll();
			logger.info("load dictionary note size===="+noteList.size());
			JSONObject tree=new JSONObject();
		    tree.put("id", "Root");
		    tree.put("text","物料设置");
		    JSONObject li_attr=new JSONObject();
		    li_attr.put("dict_id", "note");
		    JSONArray children=new JSONArray();
		    String typeCode="";
		    List dictList=null;
		    for (Iterator<HdMaterial> iterator = noteList.iterator(); iterator.hasNext();) {
		    	HdMaterial hdDictionaryNote = iterator.next();
				 JSONObject child=new JSONObject();
				 child.put("id", hdDictionaryNote.getMaterialId());
				 child.put("text",hdDictionaryNote.getMaterialName());
				 children.add(child);
				
			}
		   
		    tree.put("children", children);
			logger.info("System Date====================>"+tree);
			response.getWriter().write(JSONValue.toJSONString(tree));
			response.getWriter().flush();
	}
	
	@RequestMapping(value = "/material!save.action", method = RequestMethod.POST)
	public void saveRole(HttpServletResponse response,HdDept hdDept) throws IOException{
		logger.info("hdRole====================>"+hdDept);
		String errorMessage="";
		try {
			response.getWriter().write("新增成功");
		} catch (Exception e) {
			errorMessage=e.getMessage();
			response.getWriter().write("新增失败［"+errorMessage+"]");

		}
		response.getWriter().flush();
	}
	
	

}
