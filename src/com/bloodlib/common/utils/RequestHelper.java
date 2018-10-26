package com.bloodlib.common.utils;

import javax.servlet.http.HttpServletRequest;

public class RequestHelper {
public static String getParam(HttpServletRequest request,String parameterName){
	String parameterValue=request.getParameter(parameterName);
	if(!isEmpty(parameterValue)){
		return parameterValue;
	}else{
		System.out.println(parameterName+"的值为空或者不存在");
		return null;
	}
}

private static boolean isEmpty(String str){
	return (str == null || "".equals(str));
};
}
