package com.bloodlib.framework.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlib.common.utils.LayuiMessage;
import com.bloodlib.common.utils.RequestHelper;
import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.common.utils.StringHelper;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.model.Fsyh;
import com.bloodlib.framework.model.User;
import com.bloodlib.framework.service.BloodTypeService;
import com.bloodlib.framework.service.FsyhService;
import com.bloodlib.framework.service.UserService;
import com.bloodlib.workflow.model.VStockUser;
import com.bloodlib.workflow.model.VUserFsyhBt;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value="user/")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FsyhService fsyhService;
	
	@Autowired
	private BloodTypeService bloodTypeService;
	
	@ResponseBody
	@RequestMapping(value="getlist")
	public LayuiMessage getlist(Integer page,Integer limit,HttpServletRequest request,HttpServletResponse response){
		LayuiMessage resultMsg=new LayuiMessage();
		String username=RequestHelper.getParam(request, "username");
		String roleid=RequestHelper.getParam(request, "roleid");
		//创建条件集合
		Map<String,Object> map_condition =new HashMap<String,Object>();
		if(!StringHelper.isEmpty(username)){
			map_condition.put("userName", username);
		}
		if(!StringHelper.isEmpty(roleid)){
			map_condition.put("roleId", roleid);
		}
		PageHelper.startPage(page, limit);
		List<User> userlist=userService.getUserList(map_condition);
		PageInfo<User> info = new PageInfo<User>(userlist);
		
		resultMsg.setCode(0);
		resultMsg.setCount((long)info.getTotal());
		resultMsg.setData(userlist);
		resultMsg.setMsg("");
		return resultMsg;

	}
	
	
	/**
	 * 根据用户id获取用户信息（管理员）
	 * 
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getuserinfo/{userId}")
	public User getUserInfo(@PathVariable("userId") String userId){
		long long_userId=Long.parseLong(userId);
		return userService.getUserInfo(long_userId);
	}
	
	/**
	 * 获取用户信息（个人，医院，血库，公安用户）
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getmyuserinfo")
	public ResultMessage getUserInfo(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setMsg("登录超时，请重新登录后再修改信息");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
		
		Long userId=(Long)session.getAttribute("userId");
		User user=userService.getUserInfo(userId);
		ArrayList<User> user_list=new ArrayList<User>();
		user_list.add(user);
		resultMsg.setSuccess("true");
		resultMsg.setRows(user_list);
		return resultMsg;
	}
	
	/**
	 * 修改用户信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updatainfo")
	public ResultMessage updataUserInfo(User new_user,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		User old_user=userService.getUserInfo(new_user.getUserId());
		if(old_user==null){
			resultMsg.setMsg("修改用户失败,用户不存在");
			resultMsg.setSuccess("false");
		}else{
			//将页面的值赋给user实例
				if(!StringHelper.emptyDeal(old_user.getUserName()).equals(StringHelper.emptyDeal(new_user.getUserName()))){
					old_user.setUserName(new_user.getUserName());
				}
				if(!StringHelper.emptyDeal(old_user.getHomeAddress()).equals(StringHelper.emptyDeal(new_user.getHomeAddress()))){
					old_user.setHomeAddress(new_user.getHomeAddress());
				}
				if(!StringHelper.emptyDeal(old_user.getTel()).equals(StringHelper.emptyDeal(new_user.getTel()))){
					old_user.setTel(new_user.getTel());
				}
				if(!StringHelper.emptyDeal(old_user.getEmail()).equals(StringHelper.emptyDeal(new_user.getEmail()))){
					old_user.setEmail(new_user.getEmail());
				}
			//执行修改
			if(userService.updataUser(old_user)){
				//成功
				resultMsg.setMsg("修改用户成功");
				resultMsg.setSuccess("true");
			}else{
				//失败
				resultMsg.setMsg("修改用户失败");
				resultMsg.setSuccess("false");
			}
		}
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="updatemyuserinfo")
	public ResultMessage updataMyUserInfo(User new_user,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		Long userId=(Long)session.getAttribute("userId");
		User old_user=userService.getUserInfo(userId);
		if(old_user==null){
			resultMsg.setMsg("修改用户失败,用户不存在");
			resultMsg.setSuccess("false");
			return resultMsg;
		}else{
			//将页面的值赋给user实例
				if(!StringHelper.emptyDeal(old_user.getUserName()).equals(StringHelper.emptyDeal(new_user.getUserName()))){
					old_user.setUserName(new_user.getUserName());
				}
				if(!StringHelper.emptyDeal(old_user.getHomeAddress()).equals(StringHelper.emptyDeal(new_user.getHomeAddress()))){
					old_user.setHomeAddress(new_user.getHomeAddress());
				}
				if(!StringHelper.emptyDeal(old_user.getTel()).equals(StringHelper.emptyDeal(new_user.getTel()))){
					old_user.setTel(new_user.getTel());
				}
				if(!StringHelper.emptyDeal(old_user.getEmail()).equals(StringHelper.emptyDeal(new_user.getEmail()))){
					old_user.setEmail(new_user.getEmail());
				}
				if("1".equals(session.getAttribute("status"))){//只有个人用户才需要处理性别
					if(!StringHelper.isEmpty(new_user.getSex().toString())){//性别处理
						old_user.setSex(new_user.getSex());
					}
				}
				if(!StringHelper.isEmpty(new_user.getCertificateType().toString())){//证件类型处理
					old_user.setCertificateType(new_user.getCertificateType());
				}
				if(!StringHelper.emptyDeal(old_user.getCertificateCode()).equals(StringHelper.emptyDeal(new_user.getCertificateCode()))){//证件号码处理
					old_user.setCertificateCode(new_user.getCertificateCode());
				}
				if(!StringHelper.isEmpty(new_user.getAreaId().toString())){//区域id处理
					old_user.setAreaId(new_user.getAreaId());
				}
			//执行修改
			if(userService.updataUser(old_user)){
				//成功
				resultMsg.setMsg("修改个人信息成功");
				resultMsg.setSuccess("true");
			}else{
				//失败
				resultMsg.setMsg("修改个人信息失败");
				resultMsg.setSuccess("false");
			}
		}
		return resultMsg;
	}
	
	/**
	 * 根据id删除用户
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="delete")
	public ResultMessage deleteUser(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		String userId=RequestHelper.getParam(request, "userId");
		long long_userId=Long.parseLong(userId);
		if(!StringHelper.isEmpty(userId)){
			if(userService.deleteUser(long_userId)){
				resultMsg.setMsg("删除用户成功");
				resultMsg.setSuccess("true");
			}else{
				resultMsg.setMsg("删除用户失败");
				resultMsg.setSuccess("false");
			}
		}else{
			resultMsg.setMsg("删除用户失败,检索用户的条件不足");
			resultMsg.setSuccess("false");
		}
		
		return resultMsg;
	}
	
	/**
	 * 批量删除用户
	 * 
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="massdelete")
	public ResultMessage deleteUsers(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		return resultMsg;
	}
	
	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updatepassword")
	public ResultMessage updataPassword(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		String userid=RequestHelper.getParam(request, "userId");
		String new_password=RequestHelper.getParam(request, "new_password");
		long long_userId=Long.parseLong(userid);
		User user=userService.getUserInfo(long_userId);
		if(new_password.equals(user.getPassword())){
			resultMsg.setMsg("新密码不能与旧密码相同");
			resultMsg.setSuccess("false");
		}else{
			resultMsg.setMsg("密码修改成功,请重新登陆");
			resultMsg.setSuccess("true");
		}
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="updatepassforuser")
	public ResultMessage updataPasswordForUser(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setMsg("登录超时，请重新登录后再修改信息");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
		
		Long userId=(Long)session.getAttribute("userId");
		String new_password=RequestHelper.getParam(request, "new_password");
		String old_password=RequestHelper.getParam(request, "old_password");
		User user=userService.getUserInfo(userId);
		if(old_password.equals(user.getPassword())){//如果密码正确
			if(new_password.equals(user.getPassword())){
				resultMsg.setMsg("新密码不能与旧密码相同");
				resultMsg.setSuccess("false");
				return resultMsg;
			}else{
				user.setPassword(new_password);
				if(userService.updataUser(user)){
					resultMsg.setMsg("密码修改成功,请重新登陆");
					resultMsg.setSuccess("true");
					session.invalidate();
					return resultMsg;
				}else{
					resultMsg.setMsg("密码修改失败，请重新修改");
					resultMsg.setSuccess("false");
					return resultMsg;
				}

			}
		}else{//如果旧密码不正确
			resultMsg.setMsg("旧密码不正确，请重新输入");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="massupdatapassword")
	public ResultMessage massUpdataPassword(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		
		return resultMsg;
	}
	
	/**
	 * 修改个人用户血型信息
	 * @param bloodType
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updatebtinfoforuser")
	public ResultMessage updateBtInfo(BloodType bloodType,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		Long userId=(Long)session.getAttribute("userId");
		BloodType temp_bloodType= bloodTypeService.selectBTByType(bloodType.getType1(), bloodType.getType2());
		Fsyh old_fsyh=fsyhService.getFsyhByUserId(userId);
		if(null==old_fsyh){
			resultMsg.setMsg("不存在关联关系，请联系管理员");
			resultMsg.setSuccess("false");
			return resultMsg;
		}else{//应该加判断
			old_fsyh.setBloodTypeId(temp_bloodType.getBloodTypeId());
			boolean isAcess=false;
			try {
				isAcess=fsyhService.update(old_fsyh);
			} catch (Exception e) {
				resultMsg.setMsg("修改血型信息失败");
				resultMsg.setSuccess("false");
				return resultMsg;
			}
			if(isAcess){
				resultMsg.setMsg("修改血型信息成功");
				resultMsg.setSuccess("true");
//				return resultMsg;
			}
		}
		return resultMsg;
	}
	
	/**
	 * 获取用户详细信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getmydetailinfo")
	public ResultMessage getMyDetailInfo(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setMsg("登录超时，请重新登录后再修改信息");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
		Long userId=(Long)session.getAttribute("userId");
		VUserFsyhBt userInfo=userService.getUserDetailInfoByUserId(userId);
		if(null==userInfo){
			resultMsg.setMsg("未查询到数据");
			resultMsg.setSuccess("false");
			return resultMsg;
		}else{
			if(StringHelper.isEmpty(userInfo.getType1())){
				resultMsg.setMsg("未检查到您设置您的血型信息");
				resultMsg.setSuccess("false");
				return resultMsg;
			}
			List<VUserFsyhBt> list =new ArrayList<VUserFsyhBt>();
			list.add(userInfo);
			resultMsg.setSuccess("true");
			resultMsg.setRows(list);
			resultMsg.setTotal(list.size());
			return resultMsg;
		}
	}
	
	/**
	 * 获取就近的医院或者血库
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getnear/{type}")
	public ResultMessage getNearList(@PathVariable("type") Long roleId,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setMsg("登录超时，请重新登录后再使用相应功能");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
		Long userId=(Long)session.getAttribute("userId");
		User user=userService.getUserInfo(userId);
		if(StringHelper.isEmpty(user.getAreaId().toString())){
			resultMsg.setMsg("未检查到您未设置的区域信息");
			resultMsg.setSuccess("false");
			return resultMsg;
		}else{
			List<VUserFsyhBt> list=userService.getNearList(roleId, user.getAreaId());
			resultMsg.setSuccess("false");
			resultMsg.setRows(list);
			resultMsg.setTotal(list.size());
			return resultMsg;
		}
	}
	
	/**
	 * 获取制定id的详细信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getaimdetailinfo")
	public ResultMessage getAimDetailInfo(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
/*		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setMsg("登录超时，请重新登录后再修改信息");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
		Long userId=(Long)session.getAttribute("userId");*/
		String str_aimId=RequestHelper.getParam(request, "aimId");
		Long userId=Long.parseLong(str_aimId.toString());
		VUserFsyhBt userInfo=userService.getUserDetailInfoByUserId(userId);
		if(null==userInfo){
			resultMsg.setMsg("未查询到数据");
			resultMsg.setSuccess("false");
			return resultMsg;
		}else{
			List<VUserFsyhBt> list =new ArrayList<VUserFsyhBt>();
			list.add(userInfo);
			resultMsg.setSuccess("true");
			resultMsg.setRows(list);
			resultMsg.setTotal(list.size());
			return resultMsg;
		}
	}
	
	/**
	 * 获取有血库的用户
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getstockuser")
	public ResultMessage getstockuserlist(){
		ResultMessage resultMsg=new ResultMessage();
		List<VUserFsyhBt> list=userService.getStockUserList();
		resultMsg.setRows(list);
		resultMsg.setTotal(list.size());
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="getunformaluser")
	public LayuiMessage getUnformalUser(Integer page,Integer limit){
		LayuiMessage resultMsg=new LayuiMessage();
		//resultMsg.setTotal(userService.getCountByRoleId(-1l));
		PageHelper.startPage(page, limit);
		List<User> list=userService.getUnformalUserList();
		PageInfo<User> info=new PageInfo<User>(list);
		
		resultMsg.setCode(0);
		resultMsg.setCount((long)info.getTotal());
		resultMsg.setData(list);
		resultMsg.setMsg("");
		return resultMsg;
	}
	
	@RequestMapping(value="gethospital")
	public ResultMessage getHospitalList(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		Long areaId=Long.parseLong(RequestHelper.getParam(request, "areaId").toString());
		List<User> list=userService.getHospitalList(areaId);
		if(list.size()>0){
			resultMsg.setSuccess("true");
			resultMsg.setRows(list);
			resultMsg.setTotal(list.size());
		}else{
			resultMsg.setSuccess("false");
		}
		return resultMsg;
	}
}
