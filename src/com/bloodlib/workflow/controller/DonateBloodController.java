package com.bloodlib.workflow.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlib.common.utils.LayuiMessage;
import com.bloodlib.common.utils.Message;
import com.bloodlib.common.utils.MessageHelper;
import com.bloodlib.common.utils.RequestHelper;
import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.service.BloodTypeService;
import com.bloodlib.framework.service.UserService;
import com.bloodlib.workflow.model.DonateBlood;
import com.bloodlib.workflow.model.VDonateUserBt;
import com.bloodlib.workflow.model.VUserFsyhBt;
import com.bloodlib.workflow.service.DonateBloodService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value="donate/")
public class DonateBloodController {
	
	@Autowired
	private DonateBloodService donatebloodService;
	
	@Autowired
	private BloodTypeService bloodTypeService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 获取简单献血集合（外键以id形式）
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getsimplelist")
	public LayuiMessage getSimpleDonateList(){
		List<?> list=donatebloodService.getSimpleDonateList();
		return listToLayuiMsg(list);
	}
	
	/**
	 * 获取详细献血集合（外键以具体信息形式）
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getdetaillist")
	public LayuiMessage getDetailDonateList(Integer page,Integer limit
			,HttpServletRequest request,HttpServletResponse response){
		PageHelper.startPage(page, limit);
		List<VDonateUserBt> list =donatebloodService.getDetailDonateList();
		PageInfo<VDonateUserBt> info = new PageInfo<VDonateUserBt>(list);
		return MessageHelper.formatToLayuiMsg(list, info.getTotal());
	}
	
	/**
	 * 获取详细献血集合（外键以具体信息形式）
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getdetaillistforuser")
	public LayuiMessage getDetailDonateListForUser(/*Integer page,Integer limit*/
			HttpServletRequest request,HttpServletResponse response){
/*		PageHelper.startPage(page, limit);*/
		Long donateHos=Long.parseLong(request.getSession(false).getAttribute("userId").toString());
		List<VDonateUserBt> list =donatebloodService.getDetailDonateListByHosId(donateHos);
//		PageInfo<VDonateUserBt> info = new PageInfo<VDonateUserBt>(list);
		return MessageHelper.formatToLayuiMsg(list, list.size());
	}
	
	/**
	 * 将list封装成LayuiMessage
	 * @param list
	 * @return
	 */
	public LayuiMessage listToLayuiMsg(List<?> list){
		LayuiMessage resultMsg=new LayuiMessage();
		resultMsg.setCode(0);
		resultMsg.setMsg("");
		resultMsg.setData(list);
		resultMsg.setCount((long)list.size());
		return resultMsg;
	}
	
	/**
	 * 将list封装成ResultMessage
	 * @param list
	 * @return
	 */
	public ResultMessage listToResultMsg(List<?> list){
		ResultMessage resultMsg=new ResultMessage();
		resultMsg.setSuccess("success");
		resultMsg.setMsg("查询成功");
		resultMsg.setRows(list);
		resultMsg.setTotal((long)list.size());
		return resultMsg;
	}
	
	/**
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="setaccepted")
	public ResultMessage setHasAccepted(Long donateId){
		ResultMessage resultMsg=new ResultMessage();
		if(donatebloodService.acceptDonate(donateId, null)){
			resultMsg.setSuccess("true");
			resultMsg.setMsg("入库成功");
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("入库失败");
		}
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="ifaccepted")
	public ResultMessage setIfAccepted(Long donateId,HttpServletRequest request,HttpServletResponse response){
		String str_opera=request.getParameter("opera");
		Integer opera=Integer.parseInt(str_opera);
		
		ResultMessage resultMsg=new ResultMessage();
		if(1==opera){
			if(donatebloodService.acceptDonate(donateId, null)){
				resultMsg.setSuccess("true");
				resultMsg.setMsg("入库成功");
			}else{
				resultMsg.setSuccess("false");
				resultMsg.setMsg("入库失败");
			}
		}else if(2==opera){
			if(donatebloodService.destoryDonate(donateId)){
				resultMsg.setSuccess("true");
				resultMsg.setMsg("销毁成功");
			}else{
				resultMsg.setSuccess("false");
				resultMsg.setMsg("销毁失败");
			}
		}
		
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="delete")
	public ResultMessage deleteDonate(Long donateId){
		ResultMessage resultMsg=new ResultMessage();
		if(donatebloodService.deleteDonate(donateId)){
			resultMsg.setSuccess("true");
			resultMsg.setMsg("删除献血信息成功");
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("删除献血信息失败");
		}
		return resultMsg;
	}
	
	/**
	 * 加载详细信息
	 * @param donateId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getinfo")
	public VDonateUserBt getDetailInfoByDonateId(Long donateId){
		VDonateUserBt info= donatebloodService.loadDonateDetailInfoByDonateId(donateId);
		if(null!=info){
			return info;
		}
		return null;
	}
	
	
	/**
	 * 修改献血信息
	 * 
	 * @param donateBlood
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="editforadmin")
	public ResultMessage editDoanteForAdmin(DonateBlood donateBlood,BloodType bloodType,
			HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		DonateBlood old_donate =donatebloodService.loadDonateInfoByDonateId(donateBlood.getDonateId());
		HttpSession session =request.getSession(false);
		Long roleId;
		try {
			roleId=Long.parseLong(session.getAttribute("status").toString());
		} catch (Exception e) {
			resultMsg.setSuccess("false");
			resultMsg.setMsg("用户身份异常");
			return resultMsg;
		}
		
		BloodType temp_bt=bloodTypeService.selectBTByType(bloodType.getType1(), bloodType.getType2());
		if(1l==roleId){//geren
			old_donate.setBloodTypeId(temp_bt.getBloodTypeId());
			old_donate.setQuantity(donateBlood.getQuantity());
			old_donate.setDonateHos(donateBlood.getDonateHos());
			
		}else if(3l==roleId||2l==roleId){//血库.医院，仅可更改献血量和血型
			old_donate.setQuantity(donateBlood.getQuantity());
			old_donate.setBloodTypeId(temp_bt.getBloodTypeId());
			old_donate.setDonateer(donateBlood.getDonateer());
			//添加血型
		}else if(99l==roleId){//管理员
			old_donate.setDonateer(donateBlood.getDonateer());
			old_donate.setCertificateCode(donateBlood.getCertificateCode());
			old_donate.setTel(donateBlood.getTel());
			old_donate.setDonateHos(donateBlood.getDonateHos());
			old_donate.setQuantity(donateBlood.getQuantity());
			old_donate.setDonateDate(donateBlood.getDonateDate());
			old_donate.setBloodTypeId(temp_bt.getBloodTypeId());
			//添加血型，添加姓名，证件号，
		}else if(90l==roleId){//临时
			old_donate.setQuantity(donateBlood.getQuantity());
			old_donate.setDonateHos(donateBlood.getDonateHos());
			old_donate.setBloodTypeId(temp_bt.getBloodTypeId());
		}
//		if(null!=old_donate){
//			old_donate.setDonateHos(donateBlood.getDonateHos());
//			old_donate.setQuantity(donateBlood.getQuantity());
//		}
		
		try {
			donatebloodService.updateDonate(old_donate);
		} catch (Exception e) {
			resultMsg.setSuccess("false");
			resultMsg.setMsg("修改失败，请重新尝试");
			return resultMsg;
		}
		resultMsg.setSuccess("true");
		resultMsg.setMsg("修改成功");
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="applydonate")
	public ResultMessage applyDonate(DonateBlood donateBlood,BloodType bloodType,
			HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		Long roleId=Long.parseLong(request.getSession(false).getAttribute("status").toString());
		BloodType temp_bt=bloodTypeService.selectBTByType(bloodType.getType1(), bloodType.getType2());
		DonateBlood new_donate=new DonateBlood();
		Long userId=Long.parseLong(request.getSession(false).getAttribute("userId").toString());
		boolean isAccess=false;
		String str_donateDate=RequestHelper.getParam(request, "donateDate");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(1l==roleId){
			//姓名，身份证号，联系方式，血型
			VUserFsyhBt user =userService.getUserDetailInfoByUserId(userId);
			new_donate.setUserId(userId);
			new_donate.setDonateer(user.getUserName());
			new_donate.setTel(user.getTel());
			new_donate.setQuantity(donateBlood.getQuantity());
			new_donate.setBloodTypeId(user.getBloodTypeId());
			new_donate.setDonateHos(donateBlood.getDonateHos());
			new_donate.setCertificateCode(user.getCertificateCode());
			new_donate.setDonateDate(donateBlood.getDonateDate());
			try {
				isAccess=donatebloodService.addDonate(new_donate);
				if(isAccess){
					resultMsg.setSuccess("true");
					resultMsg.setMsg("申请成功");
				}else{
					resultMsg.setSuccess("false");
					resultMsg.setMsg("申请失败");
				}
			} catch (Exception e) {
				resultMsg.setSuccess("false");
				resultMsg.setMsg("申请失败");
			}
		}else if(3l==roleId||2l==roleId){//血库.医院
			//献血者姓名
			donateBlood.setDonateHos(userId);
			donateBlood.setBloodTypeId(temp_bt.getBloodTypeId());
			//donateBlood.setDonateDate(new Date());
			//添加血型
			try {
				isAccess=donatebloodService.addDonate(donateBlood);
				if(isAccess){
					resultMsg.setSuccess("true");
					resultMsg.setMsg("申请成功");
				}else{
					resultMsg.setSuccess("false");
					resultMsg.setMsg("申请失败");
				}
			} catch (Exception e) {
				resultMsg.setSuccess("false");
				resultMsg.setMsg("申请失败");
			}
		}else if(99l==roleId){//管理员
			donateBlood.setBloodTypeId(temp_bt.getBloodTypeId());
			//donateBlood.setDonateDate(new Date());
			//添加血型，添加姓名，证件号，
			try {
				isAccess=donatebloodService.addDonate(donateBlood);
				if(isAccess){
					resultMsg.setSuccess("true");
					resultMsg.setMsg("申请成功");
				}else{
					resultMsg.setSuccess("false");
					resultMsg.setMsg("申请失败");
				}
			} catch (Exception e) {
				resultMsg.setSuccess("false");
				resultMsg.setMsg("申请失败");
			}
		}else if(90l==roleId){//临时
			donateBlood.setDonateDate(new Date());
		}
		return resultMsg;
	}
}
