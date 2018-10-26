package com.bloodlib.workflow.service;

import java.util.List;

import com.bloodlib.workflow.model.DonateBlood;
import com.bloodlib.workflow.model.VDonateUserBt;
import com.github.pagehelper.PageInfo;

public interface DonateBloodService {
	
	/**
	 * 根据DonateId加载献血信息
	 * 
	 * @return
	 */
	DonateBlood loadDonateInfoByDonateId(Long donateId);
	
	VDonateUserBt loadDonateDetailInfoByDonateId(Long donateId);
	/**
	 * 获取详细献血信息集合
	 * 
	 * @return
	 */
	List<VDonateUserBt> getDetailDonateList();
	
	List<VDonateUserBt> getDetailDonateListByHosId(Long donateHos);
	
	/**
	 * 获取简易献血集合
	 * 
	 * @return
	 */
	List<DonateBlood> getSimpleDonateList();
	
	/**
	 * 根据用户id获取该用户献血集合
	 * 
	 * @param userId
	 * @return
	 */
	List<VDonateUserBt> getDonateListByUserId(Long userId);
	
	/**
	 * 根据用户名获取该用户献血集合
	 * @param userName
	 * @return
	 */
	List<VDonateUserBt> getDonateListByUserName(String userName);
	
	/**
	 * 根据血型Id获取献血集合
	 * 
	 * @param bloodTypeId
	 * @return
	 */
	List<VDonateUserBt> getDonateListByBloodTypeId(Long bloodTypeId);
	
	/**
	 * 更新献血信息
	 * 
	 * @param donateBlood
	 * @return
	 */
	boolean updateDonate(DonateBlood donateBlood);
	
	/**
	 * 删除献血信息
	 * 
	 * @param donateBloodId
	 * @return
	 */
	boolean deleteDonate(Long donateBloodId);
	
	/**
	 * 献血入库
	 * @param donateId
	 * @param donateHos
	 * @return
	 */
	boolean acceptDonate(Long donateId,Long donateHos);
	
	boolean destoryDonate(Long donateId);
	
	/**
	 * 新增献血信息
	 * @param donateBlood
	 * @return
	 */
	boolean addDonate(DonateBlood donateBlood);
}
