package com.bloodlib.framework.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlib.common.utils.LayuiMessage;
import com.bloodlib.common.utils.RequestHelper;
import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.common.utils.SuperHelper;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.service.BloodTypeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value="bloodtype/")
public class BloodTypeController {
	
	@Autowired
	private BloodTypeService bloodTypeService;
	
	@ResponseBody
	@RequestMapping("getlist")
	public LayuiMessage getBloodtypeList2(Integer page,Integer limit){
		LayuiMessage layMsg = new LayuiMessage();
		PageHelper.startPage(page, limit);
		List<BloodType> bloodtype_list=bloodTypeService.getBloodTypeList();
		PageInfo<BloodType> info=new PageInfo<BloodType>(bloodtype_list);
		layMsg.setCode(0);
		layMsg.setMsg("");
		layMsg.setCount((long)info.getTotal());
		layMsg.setData(bloodtype_list);
		return layMsg;
	}
	
	/**
	 * 根据id删除血型
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="delete")
	public ResultMessage deleteBloodType(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		String btid=RequestHelper.getParam(request, "btid");
		long long_btid=Long.parseLong(btid);
		if(bloodTypeService.deleteBloodType(long_btid)){
			resultMsg.setMsg("删除血型成功");
			resultMsg.setSuccess("true");
		}else{
			resultMsg.setMsg("删除血型失败");
			resultMsg.setSuccess("false");
		}
		return resultMsg;
	}
	
	/**
	 * 更新血型信息
	 * 
	 * @param bloodtype
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="update")
	public ResultMessage updateBloodType(BloodType bloodtype,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		if(bloodTypeService.updataBloodType(bloodtype)){
			resultMsg.setSuccess("true");
			resultMsg.setMsg("修改血型信息成功");
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("修改血型信息失败");
		}
		return resultMsg;
	}
	
	/**
	 * 新增
	 * 
	 * @param bloodtype
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insert")
	public ResultMessage insertBloodType(BloodType bloodtype,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		if(bloodTypeService.insertBloodType(bloodtype)){
			resultMsg.setSuccess("true");
			resultMsg.setMsg("新增血型信息成功");
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("新增血型信息失败");
		}
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="getinfo")
	public BloodType getBloodTypeInfo(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		String btid=RequestHelper.getParam(request, "btid");
		long long_btid=Long.parseLong(btid);
		return bloodTypeService.getBloodTypeInfo(long_btid);
	}
	
	@ResponseBody
	@RequestMapping(value="getBT")
	public List<?> getBT1And2(){
		List<?> list=bloodTypeService.getBT1And2List();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("getlistforfg")
	public ResultMessage getBloodtypeList(){

		ResultMessage resultMsg= new ResultMessage();
		List<BloodType> bloodtype_list=bloodTypeService.getBloodTypeList();
		if(null==bloodtype_list){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("未查询到数据");
		}else{
			resultMsg.setSuccess("true");
			resultMsg.setRows(bloodtype_list);
			resultMsg.setTotal(bloodtype_list.size());
		}
		return resultMsg;
	}
}
