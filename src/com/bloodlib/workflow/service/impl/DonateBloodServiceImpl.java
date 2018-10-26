package com.bloodlib.workflow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.framework.mapper.BloodTypeMapper;
import com.bloodlib.framework.mapper.FsyhMapper;
import com.bloodlib.framework.model.Fsyh;
import com.bloodlib.workflow.mapper.BloodStockMapper;
import com.bloodlib.workflow.mapper.DonateBloodMapper;
import com.bloodlib.workflow.mapper.VDonateUserBtMapper;
import com.bloodlib.workflow.model.BloodStock;
import com.bloodlib.workflow.model.DonateBlood;
import com.bloodlib.workflow.model.VDonateUserBt;
import com.bloodlib.workflow.service.DonateBloodService;

@Service("donateBloodService")
public class DonateBloodServiceImpl implements DonateBloodService{

	@Autowired
	DonateBloodMapper donateBloodMapper;
	
	@Autowired
	VDonateUserBtMapper detailDonateMapper;
	
	@Autowired
	BloodTypeMapper bloodTypeMapper;
	
	@Autowired
	BloodStockMapper bloodStockMapper;
	
	@Autowired
	FsyhMapper fsyhMapper;
	
	@Override
	public DonateBlood loadDonateInfoByDonateId(Long donateId) {
		return donateBloodMapper.selectByPrimaryKey(donateId);
	}
	
	@Override
	public List<DonateBlood> getSimpleDonateList() {
		return donateBloodMapper.getList();
	}

	@Override
	public List<VDonateUserBt> getDetailDonateList() {
		return detailDonateMapper.getList();
	}

	@Override
	public List<VDonateUserBt> getDonateListByUserId(Long userId) {
		return detailDonateMapper.getUserDonateListByUserId(userId);
	}

	@Override
	public List<VDonateUserBt> getDonateListByUserName(String userName) {
		return detailDonateMapper.getUserDonateListByUserName(userName);
	}

	@Override
	public List<VDonateUserBt> getDonateListByBloodTypeId(Long bloodTypeId) {
		return detailDonateMapper.getUserDonateListByBtId(bloodTypeId);
	}

	@Override
	public boolean updateDonate(DonateBlood donateBlood) {
		if(donateBloodMapper.updateByPrimaryKey(donateBlood)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean deleteDonate(Long donateBloodId) {
		if(donateBloodMapper.deleteByPrimaryKey(donateBloodId)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public VDonateUserBt loadDonateDetailInfoByDonateId(Long donateId) {
		return detailDonateMapper.getDonateInfoByDonateId(donateId);
	}

	@Override
	public boolean acceptDonate(Long donateId, Long donateHos) {
		DonateBlood donateBlood = donateBloodMapper.selectByPrimaryKey(donateId);
		if(null!=donateBlood){
			if(null!=donateBlood.getUserId()){
				Fsyh fsyh=fsyhMapper.getFsyhInfoByUserId(donateBlood.getUserId());
				Long bloodTypeId=fsyh.getBloodTypeId();//加载用户血型id
				BloodStock bloodStock=bloodStockMapper.getStockInfoByUserIdAndBTId(donateBlood.getDonateHos(), bloodTypeId);
				if(null!=bloodStock){
					bloodStock.setStockQuantity(bloodStock.getStockQuantity().add(donateBlood.getQuantity()));
					bloodStockMapper.updateByPrimaryKey(bloodStock);
					donateBloodMapper.updateIsAccept(donateId);
					return true;
				}
			}else{
				System.err.println("用户不存在记录");
			}
		}else{
			System.err.println("献血信息不存在");
			return false;
		}
		return false;
	}

	@Override
	public boolean addDonate(DonateBlood donateBlood) {
		if(donateBloodMapper.insertSelective(donateBlood)>0){
			return true;
		}
		return false;
	}

	@Override
	public List<VDonateUserBt> getDetailDonateListByHosId(Long donateHos) {
		return detailDonateMapper.getListByHosId(donateHos);
	}

	@Override
	public boolean destoryDonate(Long donateId) {
		if(donateBloodMapper.updateNoAccept(donateId)>0){
			return true;
		}
		return false;
	}



}
