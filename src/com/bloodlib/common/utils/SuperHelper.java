package com.bloodlib.common.utils;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.bloodlib.framework.service.BloodTypeService;
import com.bloodlib.framework.service.UserService;

public class SuperHelper {

	@Autowired
	private static UserService userService;
	@Autowired
	private static BloodTypeService bloodtypeService;
	/**
	 * 生成Bloodtype_ID(内码)
	 * 
	 * @return
	 */
	public static String getBTID(){
		return "bt-"+getUUID();
		
	}
	
	
	/**
	 * 生成User_ID(内码)
	 * 
	 * @return
	 */
	public static String  getUserID(){
		return "user-"+getUUID();
	}
	

	/**
	 * 生成UUID
	 * 
	 * @return
	 */
	private static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-","");
	}
	
}
