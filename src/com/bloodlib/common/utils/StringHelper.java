package com.bloodlib.common.utils;

public class StringHelper {
	
public static boolean isEmpty(String str){
	return (str == null || "".equals(str));
}
/**
 * 空字符处理方法(当为空或不存在是返回" ",否则原字符返回)
 * 
 * @param str
 * @return
 */
public static String emptyDeal(String str){
	if(StringHelper.isEmpty(str)){
		return " ";
	}else{
		return str;
	}
}

/**
 * 将新值赋给指定对象的制定属性
 * @param object  对象实例
 * @param File_Name   被赋值属性
 * @param old_str	老的值
 * @param new_str   新的值
 * @return
 */
@SuppressWarnings("unused")
private static boolean changeValue(Object object,String File_Name,String old_str,String new_str){
	Object obj=object.getClass();
	return true;
}
}
