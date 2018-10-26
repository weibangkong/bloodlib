package com.bloodlib.workflow.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.workflow.model.VUserFsyhBt;
@Repository("vUserFsyhBtMapper")
public interface VUserFsyhBtMapper {

	/**
	 * 通过用户id获取用户详细信息
	 * 
	 * @param userId
	 * @return
	 */
	VUserFsyhBt getUserInfoByUserId(Long userId);
	
	/**
	 * 通过附属用户ID获取用户详细信息
	 * 
	 * @param fsyhId
	 * @return
	 */
	VUserFsyhBt getUserInfoByFsyhId(Long fsyhId);
	
	/**
	 * 获取附近的医院列表
	 * @param areaId
	 * @return
	 */
	List<VUserFsyhBt> getNearHospitalList(Long areaId);
	
	/**
	 * 获取附近的血库列表
	 * @param areaId
	 * @return
	 */
	List<VUserFsyhBt> getNearBloodlibList(Long areaId);
	/**
	 * 获取附近的列表
	 * @param roleId
	 * @param areaId
	 * @return
	 */
	List<VUserFsyhBt> getNearList(Long roleId,Long areaId);
	
	/**
	 * 获取拥有血库的用户
	 * 
	 * @return
	 */
	List<VUserFsyhBt> getStockUserList();
	
}