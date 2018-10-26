package com.bloodlib.workflow.handler;

import org.springframework.beans.factory.annotation.Autowired;

import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.model.User;
import com.bloodlib.framework.service.BloodTypeService;
import com.bloodlib.framework.service.UserService;
import com.bloodlib.workflow.model.NeedBlood;
import com.bloodlib.workflow.service.NeedBloodService;

public class PublishHandler {

	@Autowired
	private UserService userService;
	
	@Autowired
	private NeedBloodService needBloodService;
	
	@Autowired
	private BloodTypeService bloodTypeService;
	
	private NeedBlood needblood;
	private User user;
	private BloodType bloodType;
	
	
	public void setNeedblood(NeedBlood needblood) {
		this.needblood = needblood;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public void setBloodType(BloodType bloodType) {
		this.bloodType = bloodType;
	}

	
	
	public PublishHandler() {
		super();
	}


	public PublishHandler(NeedBlood needblood, User user, BloodType bloodType) {
		super();
		this.needblood = needblood;
		this.user = user;
		this.bloodType = bloodType;
	}
	
	/**
	 * 创建一个发布Handler
	 * 
	 * @author WeiBang Kong
	 * @param needBlood
	 * @param user
	 * @param bloodType
	 * @return
	 */
	public PublishHandler createPublishHandler(NeedBlood needBlood,User user,BloodType bloodType){
		return new PublishHandler (needBlood,user,bloodType);
	}
	
	public ResultMessage publishNeedBloodMessage(NeedBlood needBlood,User user,BloodType bloodType){
		ResultMessage resultMsg=new ResultMessage();
		//BloodType bt=bloodTypeService
		//未加事务处理
		if(userService.insert(user)){
			if(needBloodService.insertNeedBlood(needBlood)){
				resultMsg.setSuccess("true");
				resultMsg.setMsg("需血信息发布成功");
			}else{
				resultMsg.setSuccess("false");
				resultMsg.setMsg("需血信息发布失败,原因:创建消息失败");
			}
		}else{
			resultMsg.setSuccess("false");
			resultMsg.setMsg("需血信息发布失败,原因:创建非正式用户失败");
		}
		return resultMsg;
	}
	




}
