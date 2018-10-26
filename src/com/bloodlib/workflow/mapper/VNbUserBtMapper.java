package com.bloodlib.workflow.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bloodlib.workflow.model.VNbUserBt;

@Repository("vNbuserBtMapper")
public interface VNbUserBtMapper {

	VNbUserBt selectNeedBloodInfoByNBID(long nbid);
    
    List<VNbUserBt> getNeedBloodListNoReceived();
    
    List<VNbUserBt> getNeedBloodListHasReceived();
    
    List<VNbUserBt> getNeedBloodListByBTtypeAndAreaId(Map<String,Object> params);
    
    List<VNbUserBt> getMyNeedBloodListNoReceived(Long userId);
    
    List<VNbUserBt> getMyNeedBloodListHasReceived(Long userId);
    
    List<VNbUserBt> getlistOrderByReceived(Long userId);
    
    Long getCountByUserIdAndBTId(Long userId,Long bloodTypeId);
    
}