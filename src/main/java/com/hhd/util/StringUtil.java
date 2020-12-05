package com.hhd.util;

public class StringUtil {
	
	public static boolean isNull(String str){
		if(null==str||"".equals(str)){
			return true;
		}
		return false;
	}

}
