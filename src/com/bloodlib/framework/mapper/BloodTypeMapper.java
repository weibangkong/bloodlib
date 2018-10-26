package com.bloodlib.framework.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.BloodType;

@Repository("bloodTypeMapper")
public interface BloodTypeMapper {

	int deleteByPrimaryKey(Long bloodTypeId);

    int insert(BloodType record);

    int insertSelective(BloodType record);

    BloodType selectByPrimaryKey(Long bloodTypeId);

    int updateByPrimaryKeySelective(BloodType record);

    int updateByPrimaryKey(BloodType record);
    
    List<BloodType> getBloodTypeList();
    
    String getTypeByID();
    
    List<String> getBT1List();
    
    List<String> getBT2List();
    
    BloodType getBloodTypeInfo(Long bloodTypeId);
    
    List<BloodType> getBloodTypeInfoByInputType(String[] inputtypes);
    
    List<BloodType> getBTByType1(String type1);
    
    BloodType getBTInfoByType(String type1,String type2);
    
    String getOutputById(Long bloodTypeId);
    
}