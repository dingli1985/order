package com.hhd.base;

import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class TreeDataHelper {
	private static Logger logger = Logger.getLogger(TreeDataHelper.class);
	
	public static String translateNull(Object obj){
		if(null==obj){
			return "";
		}
		return obj.toString();
	}

	public static String getTreeJson(List<?> list, String id, String text, String rootId, String rootText, String arrtRoot) throws IllegalArgumentException, IllegalAccessException {
		logger.info("load data size====" + list.size());
		JSONObject tree = new JSONObject();
		tree.put("id", rootId);
		tree.put("text", rootText);
		JSONObject liAttrRoot = new JSONObject();
		liAttrRoot.put("arrtRoot", arrtRoot);
		JSONArray children = new JSONArray();
		String typeCode = "";
		List dictList = null;
		String value="";
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object obj = iterator.next();
			Class clz = obj.getClass();
			JSONObject child = new JSONObject();
			Field[] fileds = clz.getDeclaredFields();
			JSONObject li_attr = new JSONObject();
			for (Field field : fileds) {
				field.setAccessible(true);
				value=translateNull(field.get(obj));
				if (field.getName().equals(id)) {
					if(field.get(obj)==null){
						
					}
					child.put("id", value);
					System.out.println(field.get(obj));
				}
				if (field.getName().equals(text)) {
					child.put("text", value);
					System.out.println(field.get(obj));
				}
				li_attr.put(field.getName(),  value);
			}
			child.put("li_attr", li_attr);
			children.add(child);

		}

		tree.put("children", children);
		logger.info("System Date====================>" + tree);
		return JSONValue.toJSONString(tree);
	}

}
