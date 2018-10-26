package com.bloodlib.workflow.controller;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

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
import com.bloodlib.framework.mapper.BloodTypeMapper;
import com.bloodlib.framework.mapper.UserMapper;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.model.User;
import com.bloodlib.framework.service.BloodTypeService;
import com.bloodlib.framework.service.UserService;
import com.bloodlib.workflow.model.NeedBlood;
import com.bloodlib.workflow.model.VNbUserBt;
import com.bloodlib.workflow.service.NeedBloodService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value="needblood/")
public class NeedBloodController {

	@Autowired
	private NeedBloodService needBloodService;
	@Autowired
	private BloodTypeService bloodTypeService;
	@Autowired
	private UserService userService;
	
	//修改用于后台（管理员）
	@ResponseBody
	@RequestMapping(value="update")
	public ResultMessage updateNeedBlood(NeedBlood needBlood,BloodType bloodType,User user,HttpServletRequest request,HttpServletResponse response){
		return needBloodService.updateNeedBlood(needBlood, bloodType, user);
	}
	
	@ResponseBody
	@RequestMapping(value="updateforuser")
	public ResultMessage updateNeedBloodForUser(NeedBlood needBlood,BloodType bloodType,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		try {
			Long nbid=needBlood.getNeedBloodId();
		} catch (Exception e) {
			resultMsg.setSuccess("false");
			resultMsg.setMsg("程序出错，请联系管理员");
			return resultMsg;
		}
		//根据type1 和 type2 获取 完整血型信息
		BloodType temp_bloodType = bloodTypeService.selectBTByType(bloodType.getType1(), bloodType.getType2());
		//检查数据库中是否存在本人发布相同血型的需血信息
/*		if(needBloodService.isExists(userId, temp_bloodType.getBloodTypeId())){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("存在本人发布的未得到解决的同类型的需血信息，无法修改");
			return resultMsg;
		}*/
		//根据needBloodId加载出精简需血信息
		NeedBlood old_needBlood= needBloodService.getNeedBlood(needBlood.getNeedBloodId());
		old_needBlood.setBloodTypeId(temp_bloodType.getBloodTypeId());
		old_needBlood.setQuantity(needBlood.getQuantity());
		old_needBlood.setRemark(needBlood.getRemark());
		if(needBloodService.updateNeedBloodForHospital(old_needBlood)){
			resultMsg.setSuccess("true");
			resultMsg.setMsg("修改成功");
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("修改失败，请重新尝试");
		}
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="delete")
	public ResultMessage deleteNeedBlood(HttpServletRequest request,HttpServletResponse response){
		String str_needBloodId=RequestHelper.getParam(request, "nbid");
		Long long_needBloodId=Long.parseLong(str_needBloodId);
		ResultMessage resultMsg=new ResultMessage();
		if(needBloodService.deleteNeedBlood(long_needBloodId)){
			resultMsg.setMsg("删除需血信息成功");
			resultMsg.setSuccess("true");
		}else{
			resultMsg.setMsg("删除需血信息失败");
			resultMsg.setSuccess("false");
		}
		return resultMsg;
	}
	
	/**
	 * 
	 * 
	 * @param isFormal(是否正式用户)/已存在用户发布时为
	 * @param user
	 * @param bloodType
	 * @param needBlood
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insert/{isformal}")
	public ResultMessage insertNeedBlood(@PathVariable("isformal") String isformal,
			User user,BloodType bloodType,NeedBlood needBlood,
			HttpServletRequest request,HttpServletResponse response){
		//获取当前用户id
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		String str_userId=session.getAttribute("userId").toString();
		Long userId=Long.parseLong(str_userId);
		//获取当前用户信息
		User real_user=userService.getUserInfo(userId);
		String str_roleId=session.getAttribute("status").toString();
		needBlood.setIsreceived(0);
		needBlood.setCreateDate(new Date());
		if("unformal".equals(isformal)){
			needBlood.setNeedBloodPerson(user.getUserName());
			return needBloodService.publishNeedBlood(needBlood, user,bloodType,false);
		}else{
			needBlood.setUserId(real_user.getUserId());
			if("1".equals(str_roleId)){
				return needBloodService.publishNeedBlood(needBlood, real_user,bloodType,true);
			}else if("2".equals(str_roleId)||"3".equals(str_roleId)){//医院或血库用户自动获取所在区域ID放进需血信息区域id中
				needBlood.setAreaId(real_user.getAreaId());
				return needBloodService.publishNeedBlood(needBlood, real_user,bloodType,true);
			}else{
				resultMsg.setMsg("用户身份不正确");
				resultMsg.setSuccess("false");
				return resultMsg;
			}
		}
		}
		
	
	@ResponseBody
	@RequestMapping(value="getlist")
	public LayuiMessage getNeedBloodListForBG(Integer page,Integer limit,HttpServletRequest request,HttpServletResponse response){
		LayuiMessage resultMsg=new LayuiMessage();
		Object obj_isReceived2=request.getAttribute("isReceived");
		String str_isReceived=RequestHelper.getParam(request, "isReceived");
		Integer int_isReceived2=(Integer)obj_isReceived2;
		Integer int_isReceived=Integer.parseInt(str_isReceived);
		PageHelper.startPage(page, limit);
		List<VNbUserBt> needBlood_list =needBloodService.getNeedBloodList(int_isReceived>0);
		PageInfo<VNbUserBt> info=new PageInfo<VNbUserBt>(needBlood_list);
		
		resultMsg.setCode(0);
		resultMsg.setCount((long)info.getTotal());
		resultMsg.setData(needBlood_list);
		resultMsg.setMsg("");
		return resultMsg;
	}
	
	
	public ResultMessage getNbListByUser(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		String  str_userId=RequestHelper.getParam(request, "userId");
		Long userId=Long.parseLong(str_userId);
		User user= userService.getUserInfo(userId);
		
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="getinfo")
	public VNbUserBt getNeedBloodInfo(HttpServletRequest request,HttpServletResponse response){
		LayuiMessage resultMsg=new LayuiMessage();
		String str_nbid=RequestHelper.getParam(request, "nbid");
		Long nbid=Long.parseLong(str_nbid);
		VNbUserBt info= needBloodService.selectNeedBlood(nbid);
		/*resultMsg.setData(info);
		resultMsg.setCode(0);
		resultMsg.setCount(1l);
		resultMsg.setMsg("");
		return resultMsg;*/
		return info;
		
	}
	
	/**
	 * 获取本用户发布的需血信息（普遍适用）
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getmylist")
	public ResultMessage getMyNeedBloodList(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg= new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setMsg("登录超时，请重新登录后再修改信息");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
		Long userId=(Long)session.getAttribute("userId");
		String isHasReceived=RequestHelper.getParam(request, "isReceived");
		List<VNbUserBt> needBlood_list = new ArrayList<VNbUserBt>();
		if("0".equals(isHasReceived)){//0为未接收到血液
			needBlood_list = needBloodService.getListNOReceivedByUserId(userId);
		}else{//1或大于0 为接收到血液
			needBlood_list = needBloodService.getListHasReceivedByUserId(userId);
		}
		if(needBlood_list.size()>0){
			resultMsg.setSuccess("true");
			resultMsg.setTotal(needBlood_list.size());
			resultMsg.setRows(needBlood_list);
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("信息获取失败");
		}
		return resultMsg;
	}
	
	
	/**
	 * 获取该用户发布的所有需血信息通过是否解决排序
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getmynblistwithorder")
	public ResultMessage getNBListByUserId(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg= new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setMsg("登录超时，请重新登录后再修改信息");
			resultMsg.setSuccess("false");
			return resultMsg;
		}
		Long userId=(Long)session.getAttribute("userId");
		List<VNbUserBt> needBlood_list = new ArrayList<VNbUserBt>();
		needBlood_list = needBloodService.getlistOrderByReceived(userId);
		if(needBlood_list.size()>0){
			resultMsg.setSuccess("true");
			resultMsg.setTotal(needBlood_list.size());
			resultMsg.setRows(needBlood_list);
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("信息获取失败");
		}
		return resultMsg;
		
	}
	
	/**
	 * 获取制定用户发布的需血信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getaimnblist")
	public ResultMessage getAimNBList(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg= new ResultMessage();
		String str_aimId=RequestHelper.getParam(request, "aimId");
		Long userId=Long.parseLong(str_aimId);
		List<VNbUserBt> needBlood_list = new ArrayList<VNbUserBt>();
		needBlood_list = needBloodService.getlistOrderByReceived(userId);
		if(needBlood_list.size()>0){
			resultMsg.setSuccess("true");
			resultMsg.setTotal(needBlood_list.size());
			resultMsg.setRows(needBlood_list);
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("信息获取失败");
		}
		return resultMsg;
		
	}
/*	@ResponseBody
	@RequestMapping(value="queryforuser")
	public LayuiMessage getNeedBloodListForUser(HttpServletRequest request,HttpServletResponse response){
		LayuiMessage resultMsg=new LayuiMessage();
		List<NeedBlood> needBlood_list=needBloodService.getNeedBloodListForUser(bloodTypeId, areaId);
		resultMsg.setCode(0);
		resultMsg.setCount((long)needBlood_list.size());
		resultMsg.setData(needBlood_list);
		resultMsg.setMsg("");
		return resultMsg;
	}*/
	
	
	/**
	 * 标记需血信息为已解决
	 * @param needBloodId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="resolve")
	public ResultMessage resolveNeedBlood(Long needBloodId){
		ResultMessage resultMsg=new ResultMessage();
		if(needBloodService.resovle(needBloodId)){
			resultMsg.setSuccess("true");
			resultMsg.setMsg("已解决");
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("解决失败");
		}
		return resultMsg;
	}
}
