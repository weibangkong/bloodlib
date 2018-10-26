package com.bloodlib.workflow.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.workflow.model.DonateBlood;

@Repository("donateBloodMapper")
public interface DonateBloodMapper {
    int deleteByPrimaryKey(Long donateId);

    int insert(DonateBlood record);

    int insertSelective(DonateBlood record);

    DonateBlood selectByPrimaryKey(Long donateId);

    int updateByPrimaryKeySelective(DonateBlood record);

    int updateByPrimaryKey(DonateBlood record);
    
    List<DonateBlood> getList();
    
    int updateIsAccept(Long donateId);
    
    int updateNoAccept(Long donateId);
}