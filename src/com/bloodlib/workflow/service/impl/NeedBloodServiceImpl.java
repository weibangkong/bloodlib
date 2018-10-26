package com.bloodlib.workflow.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.mapper.BloodTypeMapper;
import com.bloodlib.framework.mapper.FsyhMapper;
import com.bloodlib.framework.mapper.UserMapper;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.model.Fsyh;
import com.bloodlib.framework.model.User;
import com.bloodlib.workflow.handler.PublishHandler;
import com.bloodlib.workflow.mapper.NeedBloodMapper;
import com.bloodlib.workflow.mapper.VNbUserBtMapper;
import com.bloodlib.workflow.model.NeedBlood;
import com.bloodlib.workflow.model.VNbUserBt;
import com.bloodlib.workflow.service.NeedBloodService;

@Service("needBloodService")
public class NeedBloodServiceImpl implements NeedBloodService{

	@Autowired
	private NeedBloodMapper needBloodMapper;
	@Autowired
	private VNbUserBtMapper vNbuserBtMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private BloodTypeMapper bloodTypeMapper;
	@Autowired
	private FsyhMapper fsyhMapper;
	
	PublishHandler publishHandler = new PublishHandler();
	
	@Override
	public boolean insertNeedBlood(NeedBlood needBlood) {
		if(needBloodMapper.insert(needBlood)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public ResultMessage updateNeedBlood(NeedBlood needBlood,BloodType bloodType,User user) {
		//修改不允许修改用户，用户信息出错，只能删除重新发布，只可以修改血型,需求量，备注，地区
		ResultMessage resultMsg= new ResultMessage();
		
		BloodType bt=bloodTypeMapper.getBTInfoByType(bloodType.getType1(), bloodType.getType2());
		needBlood.setBloodTypeId(bt.getBloodTypeId());
		
		User old_user=userMapper.selectByPrimaryKey(user.getUserId());
		if(-1!=old_user.getRoleId()){
			if(needBloodMapper.updateByPrimaryKey(needBlood)>0){
				resultMsg.setMsg("因为您的用户为正式用户，为了您的信息安全,您需要的血液信息已经更改,但您个人的信息不可更改,抱歉");
				resultMsg.setSuccess("true");
			}else{
				resultMsg.setMsg("需血信息修改失败,请重新尝试或联系管理员");
				resultMsg.setSuccess("false");
			}
		}else{
			old_user.setUserName(user.getUserName());
			old_user.setTel(user.getTel());
			if(userMapper.updateByPrimaryKey(old_user)>0){
				if(needBloodMapper.updateByPrimaryKey(needBlood)>0){
					resultMsg.setMsg("需血信息修改成功");
					resultMsg.setSuccess("true");
				}else{
					resultMsg.setMsg("需血信息修改失败,请重新尝试或联系管理员");
					resultMsg.setSuccess("false");
				}
			}else{
				resultMsg.setMsg("临时用户信息修改失败,请重新尝试或联系管理员");
				resultMsg.setSuccess("false");
			}
		}
		return resultMsg;
	}

	/**
	 * 修改需血信息(医院/血库)
	 * 
	 * @param needBlood
	 * @return
	 */
	public boolean updateNeedBloodForHospital(NeedBlood needBlood){
		if(needBloodMapper.updateByPrimaryKey(needBlood)>0){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public boolean deleteNeedBlood(long needBloodId) {
		if(needBloodMapper.deleteByPrimaryKey(needBloodId)>0){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public List<VNbUserBt> getNeedBloodList(boolean isReceived) {
		if(isReceived){
			return vNbuserBtMapper.getNeedBloodListHasReceived();
		}else{
			return vNbuserBtMapper.getNeedBloodListNoReceived();
		}
	}

	@Override
	public ResultMessage getNeedBloodListForUser(User user) {
		ResultMessage resultMsg= new ResultMessage();
		//获取用户所在区域id
		Long areaId=user.getAreaId();
		//获取附属用户信息
		Fsyh fsyh=fsyhMapper.getFsyhInfoByUserId(user.getUserId());
		//获取血型id
		Long btid=fsyh.getBloodTypeId();
		String outputType=bloodTypeMapper.getOutputById(btid);
		String[] type_array = outputType.split(",");
		//可输出血型结合
		List<String> type_list=new ArrayList<String>();
		for (String str_type : type_array) {
			type_list.add(str_type);
		}
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("areaId", areaId);
		params.put("typelist", type_list);
		List<VNbUserBt> nb_list=vNbuserBtMapper.getNeedBloodListByBTtypeAndAreaId(params);
		resultMsg.setRows(nb_list);
		resultMsg.setTotal(nb_list.size());
		return resultMsg;
	}

	@Override
	public ResultMessage publishNeedBlood(NeedBlood needBlood, User user,BloodType bloodType){
		return new ResultMessage();
	}

	@Override
	public ResultMessage publishNeedBlood(NeedBlood needBlood, User user) {
		
		return null;
	}

	@Override
	public ResultMessage publishNeedBlood(NeedBlood needBlood, User user,
			BloodType bloodType, boolean isFormalUser) {
		ResultMessage resultMsg =new ResultMessage();
		//查找需血者血型id
		BloodType bt=bloodTypeMapper.getBTInfoByType(bloodType.getType1(), bloodType.getType2());
		if(null!=bt){
			if(null!=bt.getBloodTypeId()){
				needBlood.setBloodTypeId(bt.getBloodTypeId());
			}else{
				resultMsg.setSuccess("false");
				resultMsg.setMsg("所选血型不存在，如确认血型无误，请至血型管理模块查看是否存在该血型记录");
			}
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("发布失败，所选血型不存在，如确认血型无误，请至血型管理模块查看是否存在该血型记录");
		}
		//正式用户直接向needblood表中插入数据
		if(isFormalUser){
			if(needBloodMapper.insert(needBlood)>0){
				resultMsg.setSuccess("true");
				resultMsg.setMsg("消息发布成功");
			}else{
				resultMsg.setSuccess("false");
				resultMsg.setMsg("发布失败，请重新尝试，多次失败请联系管理员");
			}
		}else{//非正式用户，通过管理员发布，创建一个临时用户，并通过userid将needblood数据和临时用户数据绑定在一起
			Long userId=userMapper.getMaxID()+1l;
			String loginname_ls="linshi"+userId.toString();
			String password_ls="123456"+userId.toString();
			user.setUserId(userId);
			user.setLoginName(loginname_ls);
			user.setPassword(password_ls);
			user.setRoleId(-1l);
			if(userMapper.insert(user)>0){
				needBlood.setUserId(userId);
				if(needBloodMapper.insert(needBlood)>0){
					resultMsg.setSuccess("true");
					resultMsg.setMsg("消息发布成功，临时用户账号:"+loginname_ls+"  临时用户密码为:"+password_ls+" 请牢记您的临时账号和密码，如遗忘，请联系管理员");
				}else{
					resultMsg.setSuccess("false");
					resultMsg.setMsg("发布失败，请重新尝试,多次失败请联系管理员");
				}
			}else{
				resultMsg.setSuccess("false");
				resultMsg.setMsg("发布失败，创建非正式用户失败");
			}
		}
		return resultMsg;
	}

	@Override
	public VNbUserBt selectNeedBlood(Long needBloodId) {
		return vNbuserBtMapper.selectNeedBloodInfoByNBID(needBloodId);
	}

	@Override
	public List<VNbUserBt> getListHasReceivedByUserId(long userId) {
		return vNbuserBtMapper.getMyNeedBloodListHasReceived(userId);
	}

	@Override
	public List<VNbUserBt> getListNOReceivedByUserId(long userId) {
		return vNbuserBtMapper.getMyNeedBloodListNoReceived(userId);
	}

	@Override
	public List<VNbUserBt> getlistOrderByReceived(Long userId) {
		return vNbuserBtMapper.getlistOrderByReceived(userId);
	}

	@Override
	public NeedBlood getNeedBlood(Long needBloodId) {
		return needBloodMapper.selectByPrimaryKey(needBloodId);
		 
	}

	@Override
	public boolean isExists(Long userId, Long bloodTypeId) {
		if(vNbuserBtMapper.getCountByUserIdAndBTId(userId, bloodTypeId)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean resovle(Long needBloodId) {
		try {
			if(needBloodMapper.updateIsReceived(needBloodId)>0){
				return true;	
			}else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
