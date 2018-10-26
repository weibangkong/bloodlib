package com.bloodlib.workflow.controller;

import java.math.BigDecimal;
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

import com.bloodlib.common.utils.RequestHelper;
import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.service.BloodTypeService;
import com.bloodlib.workflow.model.BloodStock;
import com.bloodlib.workflow.model.VStockUser;
import com.bloodlib.workflow.service.BloodStockService;

@Controller
@RequestMapping(value="bloodstock")
public class BloodStockController {

	
	@Autowired
	private BloodStockService bloodStockService;
	@Autowired
	private BloodTypeService bloodTypeService;
	
	@ResponseBody
	@RequestMapping(value="/getlist")
	public ResultMessage getDataList(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(false);
		if(null==session){
			ResultMessage resultMsg=new ResultMessage();
			resultMsg.setSuccess("false");
			resultMsg.setMsg("登陆超时，请重新登陆后再使用该功能");
			return resultMsg;
		}else{
			//管理员身份
			String roleId=session.getAttribute("status").toString();
			if("99".equals(roleId)){
				return bloodStockService.getList();
			}else if("2".equals(roleId)){//医院
				String str_userId=session.getAttribute("userId").toString();
				Long userId=Long.parseLong(str_userId);
				return bloodStockService.getHospitalStockByUserId(userId);
			}else if("3".equals(roleId)){//血库
				String str_userId=session.getAttribute("userId").toString();
				Long userId=Long.parseLong(str_userId);
				return bloodStockService.getBloodLibStockByUserId(userId);
			}else{//其他不具有该功能的身份
				ResultMessage resultMsg=new ResultMessage();
				resultMsg.setSuccess("false");
				resultMsg.setMsg("用户身份不正确，无法使用该功能");
				return resultMsg;
			}
		}
	}
	/**
	 * 修改
	 * 
	 * @param bloodStock
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/update")
	public ResultMessage update(BloodStock bloodStock,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("登陆超时，请重新登陆后再使用该功能");
			return resultMsg;
		}else{
			Long bloodStockId=bloodStock.getBloodStockId();
			BloodStock old_bloodStock=bloodStockService.getByBloodStockId(bloodStockId);
			if(null==old_bloodStock){
				resultMsg.setSuccess("false");
				resultMsg.setMsg("未查询到该记录,请重新尝试或者联系管理员");
				return resultMsg;
			}else{//查到，将改变的值放入
				old_bloodStock.setStockQuantity(bloodStock.getStockQuantity());
				old_bloodStock.setSafeStock(bloodStock.getSafeStock());
				old_bloodStock.setMaxStock(bloodStock.getMaxStock());
				boolean isAcess=false;
				try {
					isAcess=bloodStockService.updateBloodStock(old_bloodStock);
				} catch (Exception e) {
					resultMsg.setSuccess("false");
					resultMsg.setMsg("修改失败，请重新尝试");
					return resultMsg;
				}
				if(isAcess){
					resultMsg.setSuccess("true");
					resultMsg.setMsg("修改成功");
					return resultMsg;
				}else{
					resultMsg.setSuccess("false");
					resultMsg.setMsg("修改失败，请重新尝试");
					return resultMsg;
				}	
			}
		}
	}
	
	/**
	 * 
	 * 根据存量id获取详细信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getinfobybsid")
	public ResultMessage getinfo(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("登陆超时，请重新登陆后再使用该功能");
			return resultMsg;
		}else{
			String str_bsid=RequestHelper.getParam(request, "bloodStockId");
			Long bloodStockId=Long.parseLong(str_bsid);
			BloodStock bloodStock=bloodStockService.getByBloodStockId(bloodStockId);
			if(null==bloodStock){
				resultMsg.setSuccess("false");
				resultMsg.setMsg("未查询到记录,请重新尝试或者联系管理员");
				return resultMsg;
			}else{
				List<BloodStock> list=new ArrayList<BloodStock>();
				list.add(bloodStock);
				resultMsg.setSuccess("true");
				resultMsg.setRows(list);
				resultMsg.setTotal(list.size());
				return resultMsg;
			}
		}
	}
	
	/**
	 * 创建血液存量记录，适用于普通用户
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="createstockforuser")
	public ResultMessage createBloodStockForUser(BloodType bloodType,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("登陆超时，请重新登陆后再使用该功能");
			return resultMsg;
		}else{
			Long userId=(Long)session.getAttribute("userId");
			BloodType temp_bloodType=bloodTypeService.selectBTByType(bloodType.getType1(), bloodType.getType2());
			if(bloodStockService.isExsits(userId, temp_bloodType.getBloodTypeId())){
				resultMsg.setSuccess("false");
				resultMsg.setMsg("系统中已存在该用户下的血液存量记录，无法再次添加");
				return resultMsg;
			}else{
				if(bloodStockService.createBlooStockByUserIdAndBTId(userId, temp_bloodType.getBloodTypeId())){
					resultMsg.setSuccess("true");
					resultMsg.setMsg("血量信息创建成功");
				}else{
					resultMsg.setSuccess("false");
					resultMsg.setMsg("血液类型为"+temp_bloodType.getType1()+" "+temp_bloodType.getType2()+" 的血液存量信息创建失败,已停止创建");
					return resultMsg;
				}
			}
		}
		return resultMsg;
	}
	
	@ResponseBody
	@RequestMapping(value="getsimplestock")
	public ResultMessage getSimpleStock(HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		HttpSession session=request.getSession(false);
		if(null==session){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("登陆超时，请重新登陆后再使用该功能");
			return resultMsg;
		}else{
			Long userId=(Long)session.getAttribute("userId");
			String roleId=session.getAttribute("status").toString();
			ResultMessage temp_result =new ResultMessage();
			List<?> temp_list;
			List<Map> result_list =new ArrayList<Map>();
			if("2".equals(roleId)){
				temp_result=bloodStockService.getHospitalStockByUserId(userId);
			}else if("3".equals(roleId)){
				temp_result=bloodStockService.getBloodLibStockByUserId(userId);
			}else if("99".equals(roleId)){
				
			}else{
				resultMsg.setSuccess("false");
				resultMsg.setMsg("身份不正确，不具有该权限");
				return resultMsg;
			}
			temp_list=temp_result.getRows();
			//初始化A
			Map<String,Object> a_map=new HashMap<String,Object>();
			BigDecimal a_yang=BigDecimal.valueOf(0l);
			BigDecimal a_safe=BigDecimal.valueOf(0l);
			BigDecimal a_yin=BigDecimal.valueOf(0l);
			BigDecimal a_max=BigDecimal.valueOf(0l);
			//初始化B
			Map<String,Object> b_map=new HashMap<String,Object>();
			BigDecimal b_yang=BigDecimal.valueOf(0l);
			BigDecimal b_safe=BigDecimal.valueOf(0l);
			BigDecimal b_yin=BigDecimal.valueOf(0l);
			BigDecimal b_max=BigDecimal.valueOf(0l);
			//初始化AB
			Map<String,Object> ab_map=new HashMap<String,Object>();
			BigDecimal ab_yang=BigDecimal.valueOf(0l);
			BigDecimal ab_safe=BigDecimal.valueOf(0l);
			BigDecimal ab_yin=BigDecimal.valueOf(0l);
			BigDecimal ab_max=BigDecimal.valueOf(0l);
			//初始化O
			Map<String,Object> o_map=new HashMap<String,Object>();
			BigDecimal o_yang=BigDecimal.valueOf(0l);
			BigDecimal o_safe=BigDecimal.valueOf(0l);
			BigDecimal o_yin=BigDecimal.valueOf(0l);
			BigDecimal o_max=BigDecimal.valueOf(0l);
			for (Object object : temp_list) {
				VStockUser vStockUser=(VStockUser)object;
				if("A".equals(vStockUser.getType1())){
					if("Rh+".equals(vStockUser.getType2())){
						a_yang=vStockUser.getStockQuantity();
						a_safe=a_safe.add(vStockUser.getSafeStock());
						a_max=a_max.add(vStockUser.getMaxStock());
					}else if("Rh-".equals(vStockUser.getType2())){
						a_yin=vStockUser.getStockQuantity();
						a_safe=a_safe.add(vStockUser.getSafeStock());
						a_max=a_max.add(vStockUser.getMaxStock());
					}
				}else if("B".equals(vStockUser.getType1())){
					if("Rh+".equals(vStockUser.getType2())){
						b_yang=vStockUser.getStockQuantity();
						b_safe=b_safe.add(vStockUser.getSafeStock());
						b_max=b_max.add(vStockUser.getMaxStock());
					}else if("Rh-".equals(vStockUser.getType2())){
						b_yin=vStockUser.getStockQuantity();
						b_safe=b_safe.add(vStockUser.getSafeStock());
						b_max=b_max.add(vStockUser.getMaxStock());
					}
				}else if("AB".equals(vStockUser.getType1())){
					if("Rh+".equals(vStockUser.getType2())){
						ab_yang=vStockUser.getStockQuantity();
						ab_safe=ab_safe.add(vStockUser.getSafeStock());
						ab_max=ab_max.add(vStockUser.getMaxStock());
					}else if("Rh-".equals(vStockUser.getType2())){
						ab_yin=vStockUser.getStockQuantity();
						ab_safe=ab_safe.add(vStockUser.getSafeStock());
						ab_max=ab_max.add(vStockUser.getMaxStock());
					}
				}else if("O".equals(vStockUser.getType1())){
					if("Rh+".equals(vStockUser.getType2())){
						o_yang=vStockUser.getStockQuantity();
						o_safe=o_safe.add(vStockUser.getSafeStock());
						o_max=o_max.add(vStockUser.getMaxStock());
					}else if("Rh-".equals(vStockUser.getType2())){
						o_yin=vStockUser.getStockQuantity();
						o_safe=o_safe.add(vStockUser.getSafeStock());
						o_max=o_max.add(vStockUser.getMaxStock());
					}
				}
			}
			a_map.put("type","A");
			a_map.put("yang", a_yang);
			a_map.put("yin", a_yin);
			a_map.put("safe", a_safe);
			a_map.put("max", a_max);
			
			b_map.put("type","B");
			b_map.put("yang", b_yang);
			b_map.put("yin", b_yin);
			b_map.put("safe", b_safe);
			b_map.put("max", b_max);
			
			ab_map.put("type","AB");
			ab_map.put("yang", ab_yang);
			ab_map.put("yin", ab_yin);
			ab_map.put("safe", ab_safe);
			ab_map.put("max", ab_max);
			
			o_map.put("type","O");
			o_map.put("yang", o_yang);
			o_map.put("yin", o_yin);
			o_map.put("safe", o_safe);
			o_map.put("max", o_max);
			
			result_list.add(a_map);
			result_list.add(b_map);
			result_list.add(ab_map);
			result_list.add(o_map);
			
			resultMsg.setSuccess("true");
			resultMsg.setRows(result_list);
			return resultMsg;
		}
	}
	
	/**
	 * 获取全部血型信息
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getstocklistforadmin")
	public ResultMessage getStockListForAdmin(){
		return bloodStockService.getList();
	}
	
	/**
	 * 获取全部血型信息
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getuserstocklistforadmin")
	public ResultMessage getStockListByUserId(HttpServletRequest request,HttpServletResponse response){
		String str_userId=RequestHelper.getParam(request, "userId");
		Long userId=Long.parseLong(str_userId);
		return bloodStockService.getStockListByUserId(userId);
	}
	
	@ResponseBody
	@RequestMapping(value="getstockinfo/{bloodStockId}")
	public VStockUser getStockDetailByPk(@PathVariable("bloodStockId") Long bloodStockId){
		return bloodStockService.getStockDetailByBSId(bloodStockId);
	}
	
	/**
	 * 创建信息的血液存量信息（管理员）
	 * 
	 * @param bloodStock
	 * @param bloodType
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="addstock")
	public ResultMessage createStockForAdmin(BloodStock bloodStock,BloodType bloodType,HttpServletRequest request,HttpServletResponse response){
		ResultMessage resultMsg=new ResultMessage();
		BloodType temp_bloodType=bloodTypeService.selectBTByType(bloodType.getType1(), bloodType.getType2());
		if(bloodStockService.isExsits(bloodStock.getUserId(), temp_bloodType.getBloodTypeId())){
			resultMsg.setSuccess("false");
			resultMsg.setMsg("系统中已存在该用户下的血液存量记录，无法再次添加");
			return resultMsg;
		}else{
			boolean isFinashed=false;
			bloodStock.setBloodTypeId(temp_bloodType.getBloodTypeId());
			try {
				isFinashed=bloodStockService.insertBloodStock(bloodStock);
			} catch (Exception e) {
				resultMsg.setSuccess("false");
				resultMsg.setMsg("血液类型为"+temp_bloodType.getType1()+" "+temp_bloodType.getType2()+" 的血液存量信息创建失败,已停止创建");
				return resultMsg;
			}
			if(isFinashed){
				resultMsg.setSuccess("true");
				resultMsg.setMsg("新的血液存量信息创建成功");
				return resultMsg;
			}
		}
		return resultMsg;
	}
}
