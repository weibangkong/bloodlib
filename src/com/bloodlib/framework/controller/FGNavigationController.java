package com.bloodlib.framework.controller;
/**
 * 前台跳转控制器
 * 
 * @author WeiBang Kong
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlib.common.utils.RequestHelper;

@Controller
@RequestMapping(value="fgnavi/")
public class FGNavigationController {

	private static String user_prefix="forceground/user/";
	private static String police_prefix="forceground/police/";
	private static String hospital_prefix="forceground/hospital/";
	private static String bloodlib_prefix="forceground/bloodlib/";
	private static String common_error="common/error";
	
	/**
	 * 跳转前台用户界面
	 * @return
	 */
	@RequestMapping(value="user/index")
	public String userIndex(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"index";
			break;
		case 2:   //医院用户
			path+=hospital_prefix+"index";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"index";
			break;
		case 4:  //公安用户
			path+=police_prefix+"index";
			break;
		case 99:  //管理员用户
			path+=user_prefix+"index";
			break;
		case 90:  //临时用户
			path+=user_prefix+"index";
			break;
		}
		return path;
	}
	
	/**
	 * 跳转前台医院界面
	 * @return
	 */
	@RequestMapping(value="hospital/index")
	public String hospitalIndex(){
		return hospital_prefix+"index";
	}
	
	/**
	 * 跳转前台血库界面
	 * @return
	 */
	@RequestMapping(value="bloodlib/index")
	public String bloodlibIndex(){
		return bloodlib_prefix+"index";
	}
	
	/**
	 * 跳转前台公安界面
	 * @return
	 */
	@RequestMapping(value="police/index")
	public String policeIndex(){
		return police_prefix+"index";
	}
	
	/**
	 * 跳转到发布需血信息页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="publishneedblood")
	public String publishNeedbloodindex(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"publishneedblood";
			break;
		case 2:   //医院用户
			path+=hospital_prefix+"publishneedblood";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"publishneedblood";
			break;
		case 99:  //管理员用户
			path+=user_prefix+"publishneedblood";
			break;
		}
		return path;
		
	}
	
	/**
	 * 跳转到用户信息页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="myuserinfo")
	public String showUserInfo(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String roleId=session.getAttribute("status").toString();
		if("1".equals(roleId)){//个人
			return user_prefix+"userinfo";
		}else if("2".equals(roleId)){//医院
			return hospital_prefix+"userinfo";
		}else if("3".equals(roleId)){//血库
			return bloodlib_prefix+"userinfo";
		}else if("4".equals(roleId)){//公安
			return police_prefix+"userinfo";
		}else{
			return common_error;
		}
	}
	
	/**
	 * 跳转到需血信息列表页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="nblist")
	public String showNBList(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"myneedbloodlist";
			break;
		case 2:   //医院用户
			path+=hospital_prefix+"myneedbloodlist";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"myneedbloodlist";
			break;
		case 99:  //管理员用户
			path+=user_prefix+"myneedbloodlist";
			break;
		case 90:  //临时用户
			path+=user_prefix+"myneedbloodlist";
			break;
		}
		return path;
	}
	
	@RequestMapping(value="showstock")
	public String showBloodStock(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 2:   //医院用户
			path+=hospital_prefix+"bloodstock";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"bloodstock";
			break;
		case 99:  //管理员用户
			path+=hospital_prefix+"bloodstock";
			break;
		}
		return path;
	}
	
	/**
	 * 跳转到血液存量修改页面
	 * 
	 */
	@RequestMapping(value="stockedit")
	public String showBloodStockEdit(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 2:   //医院用户
			path+=hospital_prefix+"mystockedit";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"mystockedit";
			break;
		case 99:  //管理员用户
			path+=user_prefix+"mystockedit";
			break;
		}
		return path;
	}
	
	/**
	 * 跳转到血型管理界面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="btmanage")
	public String bloodTypeEdit(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 2:   //医院用户
			path+=hospital_prefix+"bloodtype";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"bloodtype";
			break;
		case 99:  //管理员用户
			path+=hospital_prefix+"mystockedit";
			break;
		}
		return path;
	}
	
	/**
	 * 跳转修改需血信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="updateneedblood")
	public String needBloodEdit(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String str_needBloodId=RequestHelper.getParam(request, "nbid");
		model.addAttribute("needBloodId", str_needBloodId);
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"editneedblood";
			break;
		case 2:   //医院用户
			path+=hospital_prefix+"editneedblood";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"editneedblood";
			break;
		case 4:  //公安用户
			path+=police_prefix+"editneedblood";
			break;
		case 99:  //管理员用户
			path+=user_prefix+"editneedblood";
			break;
		case 90:  //临时用户
			path+=user_prefix+"editneedblood";
			break;
		}
		return path;
	}
	
	/**
	 * 跳转需血信息修改
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="updatepass")
	public String editPass(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String str_needBloodId=RequestHelper.getParam(request, "nbid");
		model.addAttribute("needBloodId", str_needBloodId);
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"updatepassword";
			break;
		case 2:   //医院用户
			path+=hospital_prefix+"updatepassword";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"updatepassword";
			break;
		case 4:  //公安用户
			path+=police_prefix+"updatepassword";
			break;
		case 99:  //管理员用户
			path+=user_prefix+"updatepassword";
			break;
		case 90:  //临时用户
			path+=user_prefix+"updatepassword";
			break;
		}
		return path;
	}
	
	/**
	 * 跳转到创建存量信息页面
	 * 
	 */
	@RequestMapping(value="createstock")
	public String showCreateStock(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 2:   //医院用户
			path+=hospital_prefix+"createstock";
			break;
		case 3:  //血库用户
			path+=bloodlib_prefix+"createstock";
			break;
		case 99:  //管理员用户
			path+=hospital_prefix+"createstock";
			break;
		}
		return path;
	}
	
	/**
	 * 跳转到修改我的血液信息页面
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="updatemybloodType")
	public String updateMyBloodType(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"updatemybtinfo";
			break;
		default :
			path+=common_error;
		}
		return path;
	}
	
	/**
	 * 跳转到附近的医院/血库
	 * @param type
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="shownear/{type}")
	public String showNear(@PathVariable("type") String type,HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		if("2".equals(type)){//附近的医院
			switch (roleId) {
			case 1:   //个人用户
				path+=user_prefix+"nearhospital";
				break;
			case 2:   //个人用户
				path+=hospital_prefix+"nearhospital";
				break;
			case 3:   //个人用户
				path+=bloodlib_prefix+"nearhospital";
				break;
			case 99:   //个人用户
				path+=user_prefix+"nearhospital";
				break;
			default :
				path+=common_error;
			}
		}else if("3".equals(type)){//附近的血库
			switch (roleId) {
			case 1:   //个人用户
				path+=user_prefix+"nearbloodlib";
				break;
			case 2:   //个人用户
				path+=hospital_prefix+"nearbloodlib";
				break;
			case 99:   //个人用户
				path+=user_prefix+"nearbloodlib";
				break;
			default :
				path+=common_error;
			}
		}else{
			path+=common_error;
		}
		return path;
	}
	
	/**
	 * 跳转到附近的医院/血库详细
	 * 
	 * @param type
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="showneardetail/{type}")
	public String showNearDetail(@PathVariable("type") String type,HttpServletRequest request,
			HttpServletResponse response,Model model){
		HttpSession session=request.getSession(false);
		String aimId=RequestHelper.getParam(request, "aimId");
		model.addAttribute("aimId", aimId);
		if(null==session){
			return common_error;
		}
		String str_roleId= session.getAttribute("status").toString();
		Integer roleId= Integer.parseInt(str_roleId);
		String path="";
		
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix;
			break;
		case 2:   //个人用户
			path+=hospital_prefix;
			break;
		case 3:
			path+=bloodlib_prefix;
			break;
		case 99:   //个人用户
			path+=user_prefix;
			break;
		default :
			return common_error;
		}
		if("2".equals(type)){
			path+="hospitaldetail";
		}else if("3".equals(type)){
			path+="bloodlibdetail";
		}
		return path;
	}
	
	@RequestMapping(value="showapplydonate")
	public String showApplyDonate(HttpServletRequest request,
			HttpServletResponse response,Model model){
		//Long roleId=Long.parseLong(request.getAttribute("status").toString());
		Integer roleId= Integer.parseInt(request.getSession(false).getAttribute("status").toString());
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"applydonate";
			break;
		case 2:   //医院、血库
			path+=hospital_prefix+"donatedetail";
			break;
		case 3:
			path+=bloodlib_prefix+"donatedetail";
			break;
		default :
			return common_error;
		}
		return path;
	}
	
	@RequestMapping(value="donatemanage")
	public String showdonateManage(HttpServletRequest request,
			HttpServletResponse response,Model model){
		Integer roleId= Integer.parseInt(request.getSession(false).getAttribute("status").toString());
		String path="";
		switch (roleId) {
		case 1:   //个人用户
			path+=user_prefix+"donatemanage";
			break;
		case 2:   //医院、血库
			path+=hospital_prefix+"donatemanage";
			break;
		case 3:
			path+=bloodlib_prefix+"donatemanage";
			break;
		default :
			return common_error;
		}
		return path;
	}
}
