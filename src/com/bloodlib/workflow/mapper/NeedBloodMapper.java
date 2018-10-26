package com.bloodlib.workflow.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.workflow.model.NeedBlood;
@Repository("needBloodMapper")
public interface NeedBloodMapper {

	int deleteByPrimaryKey(Long needBloodId);

    int insert(NeedBlood record);

    int insertSelective(NeedBlood record);

    NeedBlood selectByPrimaryKey(Long needBloodId);

    int updateByPrimaryKeySelective(NeedBlood record);

    int updateByPrimaryKey(NeedBlood record);
    
    /**
     * 暂不可用，用起来太繁�?     * 
     * @return
     */
    List<NeedBlood> getNeedBloodList();
    
    /**
     * 暂不可用，用起来太繁�?     * 
     * @return
     */
    List<NeedBlood> getNeedBloodListForUser(long bloodTypeId,long areaId);
    
    int updateIsReceived(Long needBloodId);
}