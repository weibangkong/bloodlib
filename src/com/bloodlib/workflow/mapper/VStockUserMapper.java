package com.bloodlib.workflow.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.workflow.model.VStockUser;
@Repository("vStockUserMapper")
public interface VStockUserMapper {

	List<VStockUser> getStockList();
	
	List<VStockUser> getHospitalStockByUserId(long userId);
	
	List<VStockUser> getBloodLibStockByUserId(long userId);
	
	List<VStockUser> getStockListByUserId(long userId);
	
	VStockUser selectByPrimaryKey(Long bloodStockId);
}