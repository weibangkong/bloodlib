package com.bloodlib.workflow.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.workflow.mapper.BloodStockMapper;
import com.bloodlib.workflow.mapper.VStockUserMapper;
import com.bloodlib.workflow.model.BloodStock;
import com.bloodlib.workflow.model.VStockUser;
import com.bloodlib.workflow.service.BloodStockService;

@Service("bloodStockService")
public class BloodStockServiceImpl implements BloodStockService{

	
	@Autowired
	private BloodStockMapper bloodStockMapper;
	
	@Autowired
	private VStockUserMapper vStockUserMapper;
	
	@Override
	public ResultMessage getList() {
		ResultMessage resultMsg=new ResultMessage();
		List<VStockUser> dataList=vStockUserMapper.getStockList();
		resultMsg.setRows(dataList);
		resultMsg.setTotal(dataList.size());
		return resultMsg;
	}

	@Override
	public ResultMessage getHospitalStockByUserId(long userId) {
		ResultMessage resultMsg=new ResultMessage();
		List<VStockUser> dataList=vStockUserMapper.getHospitalStockByUserId(userId);
		resultMsg.setRows(dataList);
		resultMsg.setTotal(dataList.size());
		return resultMsg;
	}

	@Override
	public ResultMessage getBloodLibStockByUserId(long userId) {
		ResultMessage resultMsg=new ResultMessage();
		List<VStockUser> dataList=vStockUserMapper.getBloodLibStockByUserId(userId);
		resultMsg.setRows(dataList);
		resultMsg.setTotal(dataList.size());
		return resultMsg;
	}

	@Override
	public boolean insertBloodStock(BloodStock bloodStock) {
		if(bloodStockMapper.insert(bloodStock)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateBloodStock(BloodStock bloodStock) {
		if(bloodStockMapper.updateByPrimaryKey(bloodStock)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean deleteBloodStockByBSId(Long bloodStockId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteBloodStockByUserId(Long userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ResultMessage getStockListByUserId(long userId) {
		ResultMessage resultMsg=new ResultMessage();
		List<VStockUser> dataList=vStockUserMapper.getStockListByUserId(userId);
		resultMsg.setRows(dataList);
		resultMsg.setTotal(dataList.size());
		return resultMsg;
	}

	@Override
	public BloodStock getByBloodStockId(Long bloodStockId) {
		return bloodStockMapper.selectByPrimaryKey(bloodStockId);
	}

	@Override
	public boolean createBlooStockByUserIdAndBTId(Long userId, Long bloodTypeId){
		BloodStock bloodStock=new BloodStock();
		bloodStock.setUserId(userId);
		bloodStock.setBloodTypeId(bloodTypeId);
		bloodStock.setStockQuantity(BigDecimal.valueOf(0l));
		bloodStock.setSafeStock(BigDecimal.valueOf(0l));
		bloodStock.setMaxStock(BigDecimal.valueOf(0l));
		if(bloodStockMapper.insert(bloodStock)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean isExsits(Long userId, Long bloodTypeId) {
		if(bloodStockMapper.getCountByUserIdAndBTId(userId, bloodTypeId)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public VStockUser getStockDetailByBSId(Long bloodStockId) {
		return vStockUserMapper.selectByPrimaryKey(bloodStockId);
	}

}
