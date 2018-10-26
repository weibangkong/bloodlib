package com.bloodlib.framework.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.framework.mapper.BloodTypeMapper;
import com.bloodlib.framework.model.BloodType;
import com.bloodlib.framework.service.BloodTypeService;

@Service("bloodTypeService")
public class BloodTypeServiceImpl implements BloodTypeService{

	@Autowired
	private BloodTypeMapper bloodTypeMapper;
	
	@Override
	public List<BloodType> getBloodTypeList() {
		return bloodTypeMapper.getBloodTypeList();
	}

	@Override
	public boolean deleteBloodType(long id) {
		if(bloodTypeMapper.deleteByPrimaryKey(id)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updataBloodType(BloodType bloodtype) {
		if(bloodTypeMapper.updateByPrimaryKey(bloodtype)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertBloodType(BloodType bloodType) {
		if(bloodTypeMapper.insert(bloodType)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public BloodType getBloodTypeInfo(long bloodTypeId) {
		return bloodTypeMapper.selectByPrimaryKey(bloodTypeId);
	}

	@Override
	public List<String> getBT1List() {
		return bloodTypeMapper.getBT1List();
	}

	@Override
	public List<String> getBT2List() {
		return bloodTypeMapper.getBT2List();
	}

	@Override
	public List<?> getBT1And2List() {
		@SuppressWarnings("rawtypes")
		List<List> list=new ArrayList<List>();
		List<String> bt1_list=bloodTypeMapper.getBT1List();
		List<String> bt2_list=bloodTypeMapper.getBT2List();
		list.add(bt1_list);
		list.add(bt2_list);
		return list;
	}

	@Override
	public BloodType selectBTByType(String type1, String type2) {
		return bloodTypeMapper.getBTInfoByType(type1, type2);
	}

	

}
