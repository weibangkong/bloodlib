package com.bloodlib.framework.controller;
/**
 * 注册控制器
 * 
 *@author WeiBang Kong
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlib.common.utils.RequestHelper;
import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.model.Fsyh;
import com.bloodlib.framework.model.User;
import com.bloodlib.framework.service.FsyhService;
import com.bloodlib.framework.service.UserService;



@Controller
@RequestMapping(value="regist/")
public class RegistController {

	@Autowired
	private UserService userService;
	@Autowired
	private FsyhService fsyhService;
	private static String prefix_regist="framework/regist/";
	
	@RequestMapping(value="index")
	public String registIndex(){
		return prefix_regist+"regist";
	}
	
	@ResponseBody
	@RequestMapping(value="doregist")
	public ResultMessage regist(HttpServletRequest request,HttpServletResponse response){
		
		ResultMessage msg = new ResultMessage();
		
		String username=RequestHelper.getParam(request, "username");
		String loginname=RequestHelper.getParam(request, "loginname");
		if(userService.isExists(loginname)){//如果用户已存在
			msg.setSuccess("false");
			msg.setMsg("登录名已存在，请换一个");
			return msg;
		}
		String password=RequestHelper.getParam(request, "password");
		String tel=RequestHelper.getParam(request, "tel");
		String roleid=RequestHelper.getParam(request, "role");
		long long_roleid=Long.parseLong(roleid);
		System.err.println(username+"  "+loginname+"  "+password+"  "+tel+"  "+roleid);
		
		User user=new User();
		long userId=userService.getNewId();
		user.setUserId(userId);
		user.setUserName(username);
		user.setLoginName(loginname);
		user.setPassword(password);
		user.setTel(tel);
		user.setRoleId(long_roleid);
		
		Fsyh fsyh=new Fsyh();

		fsyh.setUserId(userId);
		
		boolean isInserted_user=false;
		boolean isInserted_fsyh=true;
		if(userService.insert(user)){
			isInserted_user=true;
		}
		if(fsyhService.insert(fsyh)){
			isInserted_fsyh=true;
		}
		if(isInserted_user==true&&isInserted_fsyh==true){
			msg.setMsg("新用户注册成功");
			msg.setSuccess("true");
		}else{
			if(isInserted_user&&!isInserted_fsyh){
				//撤销插入user
			}
			if(isInserted_fsyh&&!isInserted_user){
				//撤销插入fsyh(一般不会运行)
				
			}
			msg.setMsg("注册用户失败");
			msg.setSuccess("flase");
		}
		return msg;
	}
}
