package com.bloodlib.framework.service;

import java.util.List;

import com.bloodlib.framework.model.BloodType;

public interface BloodTypeService {
	
	/**
	 * 获取血型列表
	 * 
	 * @return
	 */
	List<BloodType> getBloodTypeList();
	
	/**
	 * 根据id删除一条血型信息
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteBloodType(long id);
	
	/**
	 * 更新血型信息
	 * 
	 * @param bloodtype
	 * @return
	 */
	boolean updataBloodType(BloodType bloodtype);
	
	/**
	 * 新增血型
	 * 
	 * @param bloodType
	 * @return
	 */
	boolean insertBloodType(BloodType bloodType);
	

	BloodType getBloodTypeInfo(long bloodTypeId);
	
	List<String> getBT1List();
	
	List<String> getBT2List();
	
	List<?> getBT1And2List();
	
	BloodType selectBTByType(String type1,String type2);
	
}
