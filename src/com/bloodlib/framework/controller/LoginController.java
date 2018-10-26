package com.bloodlib.framework.controller;
/**
 * 登陆控制器
 * 
 * @author WeiBang Kong
 */
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bloodlib.common.utils.FileHelper;
import com.bloodlib.common.utils.RequestHelper;
import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.model.User;
import com.bloodlib.framework.service.UserService;
@Controller
@RequestMapping(value="login/")
public class LoginController {
	
	@Autowired
	private UserService userService;
	private static String prefix_login="framework/login/";
	private static String prefix2="workflow/";
	private static String prefix3="common/";
	
	@RequestMapping(value="index")
	public String loginIndex(){
		FileHelper.replacePictureContent("d:\\IOtest\\kwb.pdf", "d:\\IOtest\\outputtest.pdf");
		return prefix_login+"login";
	}
	
	@ResponseBody
	@RequestMapping(value="checklogin",method=RequestMethod.GET)
	public String  login(HttpServletRequest request,HttpServletResponse response){
		String loginname=RequestHelper.getParam(request, "loginname");
		String password=RequestHelper.getParam(request, "password");
		User loginaccunt;
		HttpSession session= request.getSession();
		String path=null;
		if(null!=(loginaccunt=userService.loginQuery(loginname, password))){
//			loginaccunt=userService.loginQuery(loginname, password);
			//return "redirect:/app/main/index/true";
			session.setAttribute("userId", loginaccunt.getUserId());
			session.setAttribute("userName", loginaccunt.getUserName());
			session.setAttribute("status",loginaccunt.getRoleId());
			session.setMaxInactiveInterval(4*60*60);
			if(1l==loginaccunt.getRoleId()){
				path= "/app/fgnavi/user/index";
			}else if(2l==loginaccunt.getRoleId()){
				path= "/app/fgnavi/user/index";
			}else if(3l==loginaccunt.getRoleId()){
				path= "/app/fgnavi/user/index";
			}else if(4l==loginaccunt.getRoleId()){
				path= "/app/fgnavi/user/index";
			}else if(99l==loginaccunt.getRoleId()){
				path= "/app/main/index/true/"+loginaccunt.getRoleId();
			}
//			return prefix_login+"login";
		}else{
			System.err.println("用户不存在");
//			return "/app/main/index/flase";
			return "false";
		}	
		return path;
	}
	
	@ResponseBody
	@RequestMapping(value="loginout")
	public ResultMessage LoginOut(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg= new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("回话超时，已自动退出登录");
		}else{
			session.invalidate();
			resultMsg.setSuccess("true");
			resultMsg.setMsg("已退出登陆");
		}
		return resultMsg;
	}
	
	@RequestMapping(value="checklogin2")
	public String login2(HttpServletRequest request,HttpServletResponse response){
		String loginname=RequestHelper.getParam(request, "loginname");
		String password=RequestHelper.getParam(request, "password");
		//UserRoleMapping loginaccunt =userRoleService.loginQuery(loginname, password);
		//System.err.println(loginaccunt.getUsername());
//		try {
//			 
//			/*response.sendRedirect("/WEB-INF/jsp/framework/main.jsp");*/
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return "forward:/app/main/index/true";
	}
	
	@RequestMapping(value="checklogin3")
	public ModelAndView login3(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		String loginname=RequestHelper.getParam(request, "loginname");
		String password=RequestHelper.getParam(request, "password");
		User loginaccunt =userService.loginQuery(loginname, password);
		System.err.println(loginaccunt.getUserName());
		mv.setViewName("framework:/app//main");
//		return  "forword:/WEB-INF/jsp/framework/main";
		return mv;
	}
}
