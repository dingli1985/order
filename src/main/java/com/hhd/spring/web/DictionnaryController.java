package com.hhd.spring.web;


import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hhd.mybatis.dict.HdDictionary;
import com.hhd.mybatis.dict.HdDictionaryNote;
import com.hhd.mybatis.dict.HdDictionaryDao;
import com.hhd.mybatis.dict.HdDictionaryNoteDao;

@Controller
public class DictionnaryController {
	
	private Logger logger=Logger.getLogger(DictionnaryController.class);
	
	@Resource
	private HdDictionaryDao hdDictionaryDao;
	@Resource
	private HdDictionaryNoteDao hdDictionaryNoteDao;


	private String jspRoot="";
	
	@RequestMapping(value = "/dictionary!list.action", method = RequestMethod.GET)
	public String ajaxDictionNote(HttpSession httpSession,Model model){
		jspRoot=(String)httpSession.getServletContext().getAttribute("version");
	   List<HdDictionaryNote> noteList=hdDictionaryNoteDao.selectAll();
		model.addAttribute("RootNode","字典列表");
		model.addAttribute("noteList",noteList);
		logger.info("load dictionary note size===="+noteList.size());
		return jspRoot+"/dictionary";

	}
	
	@RequestMapping(value = "/dictionary!ajax.action", method = RequestMethod.GET)
	public void ajaxDictTree(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException{
	   List<HdDictionaryNote> noteList=hdDictionaryNoteDao.selectAll();
		logger.info("load dictionary note size===="+noteList.size());
		JSONObject tree=new JSONObject();
	    tree.put("id", "Root");
	    tree.put("text","字典设置");
	    JSONObject li_attr=new JSONObject();
	    li_attr.put("dict_id", "note");
	    JSONArray children=new JSONArray();
	    String typeCode="";
	    List dictList=null;
	    for (Iterator<HdDictionaryNote> iterator = noteList.iterator(); iterator.hasNext();) {
	    	HdDictionaryNote hdDictionaryNote = iterator.next();
			 JSONObject child=new JSONObject();
			 typeCode=hdDictionaryNote.getTypeCode();
			 child.put("id", hdDictionaryNote.getDictId());
			 child.put("text",hdDictionaryNote.getTypeNote());
			 dictList=hdDictionaryDao.queryByCode(typeCode);
			 JSONArray dictChildren=new JSONArray();
			 for (Iterator<HdDictionary> iterator2 = dictList.iterator(); iterator2.hasNext();) {
				 HdDictionary dict = iterator2.next();
				 JSONObject dictChild=new JSONObject();
				 dictChild.put("id", dict.getDictId());
				 dictChild.put("text",dict.getTypeName());
				 System.out.println(dict.getTypeName());
				 dictChildren.add(dictChild);
				
			}
			 child.put("children", dictChildren);
			 children.add(child);
			
		}
	   
	    tree.put("children", children);
		logger.info("System Date====================>"+tree);
		response.getWriter().write(JSONValue.toJSONString(tree));
		response.getWriter().flush();

	}
	  
	
	@RequestMapping(value = "/dictionnary!save.action", method = RequestMethod.POST)
	public String saveRole(HttpServletResponse response,HdDictionary hdDictionary) throws IOException{
		logger.info("hdRole====================>"+hdDictionary);
		hdDictionaryDao.insert(hdDictionary);
		return "/dictionary!list.action";
		
	}
	
	

}
