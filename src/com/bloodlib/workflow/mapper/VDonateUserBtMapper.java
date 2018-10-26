package com.bloodlib.workflow.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.workflow.model.VDonateUserBt;

@Repository("detailDonateMapper")
public interface VDonateUserBtMapper {

	/**
	 * 获取献血信息集合
	 * @return
	 */
	List<VDonateUserBt> getList();
	
	List<VDonateUserBt> getListByHosId(Long donateHos);
	//根据献血id获取献血信息
	/**
	 * 根据献血id获取详细献血信息
	 * @param donateId
	 * @return
	 */
	VDonateUserBt getDonateInfoByDonateId(Long donateId);
	/**
	 * 
	 * 根据用户id获取用户献血集合
	 * @param userId
	 * @return
	 */
	List<VDonateUserBt> getUserDonateListByUserId(Long userId);
	/**
	 * 根据用户姓名获取用户献血集合
	 * @param userName
	 * @return
	 */
	List<VDonateUserBt> getUserDonateListByUserName(String userName);
	/**
	 * 根据血型Id获取献血信息集合
	 * @param bloodTypeId
	 * @return
	 */
	List<VDonateUserBt> getUserDonateListByBtId(Long bloodTypeId);
}