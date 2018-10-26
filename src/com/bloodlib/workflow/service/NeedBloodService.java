package com.bloodlib.workflow.service;

import java.util.List;

import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.model.User;
import com.bloodlib.workflow.model.NeedBlood;
import com.bloodlib.workflow.model.VNbUserBt;

public interface NeedBloodService {

	boolean insertNeedBlood(NeedBlood needBlood);

	ResultMessage updateNeedBlood(NeedBlood needBlood,BloodType bloodType,User user);

	/**
	 * 修改需血信息(医院/血库)
	 * 
	 * @param needBlood
	 * @return
	 */
	boolean updateNeedBloodForHospital(NeedBlood needBlood);
	
	/**
	 * 根据用户和血型判断是否有未解决的，如果有返回true
	 * 
	 * @param userId
	 * @param bloodTypeId
	 * @return
	 */
	boolean isExists(Long userId,Long bloodTypeId);
	
	boolean deleteNeedBlood(long needBloodId);
	
	/**
	 * 根据需血信息id查找完整需血信息
	 * 
	 * @param needBloodId
	 * @return
	 */
	VNbUserBt selectNeedBlood(Long needBloodId);
	
	/**
	 * 根据需血信息id查找精简需血信息
	 * 
	 * @param needBloodId
	 * @return
	 */
	NeedBlood getNeedBlood(Long needBloodId);
	
	/**
	 * 获取需血信息集合
	 * true：已解决
	 * false：为解决
	 * @param isReceived
	 * @return
	 */
	List<VNbUserBt> getNeedBloodList(boolean isReceived);

	ResultMessage getNeedBloodListForUser(User user);
	
	ResultMessage publishNeedBlood(NeedBlood needblood,User user,BloodType bloodType);

	ResultMessage publishNeedBlood(NeedBlood needBlood, User user);

	/**
	 * 
	 * @param needBlood
	 * @param user
	 * @param bloodType
	 * @param isFormalUser(是否为正式用户)
	 * @return
	 */
	ResultMessage publishNeedBlood(NeedBlood needBlood, User user,
			BloodType bloodType, boolean isFormalUser);
	
	/**
	 * 获取用户发布的已解决需血信息
	 * 
	 * @param userId
	 * @return
	 */
	List<VNbUserBt> getListHasReceivedByUserId(long userId);
	
	
	/**
	 * 获取用户发布的未解决需血信息
	 * 
	 * @param userId
	 * @return
	 */
	List<VNbUserBt> getListNOReceivedByUserId(long userId);
	
	List<VNbUserBt> getlistOrderByReceived(Long userId);
	
	boolean resovle(Long needBloodId);
	
}
