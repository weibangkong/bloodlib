package com.bloodlib.workflow.service;

import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.workflow.model.BloodStock;
import com.bloodlib.workflow.model.VStockUser;

public interface BloodStockService {

	/**获取库存信息集合，管理员
	 * 
	 * @return
	 */
	ResultMessage getList();
	
	/**获取本院库存血液集合，医院
	 * 
	 * @return
	 */
	ResultMessage getHospitalStockByUserId(long userId);
	
	/**获取本库库存血液集合，血库
	 * 
	 * @return
	 */
	ResultMessage getBloodLibStockByUserId(long userId);
	
	/**
	 * 获取本用户的血液存量集合
	 * 
	 * @param userId
	 * @return
	 */
	ResultMessage getStockListByUserId(long userId);
	
	boolean insertBloodStock(BloodStock bloodStock);
	
	boolean updateBloodStock(BloodStock bloodStock);
	
	boolean deleteBloodStockByBSId(Long bloodStockId);
	
	boolean deleteBloodStockByUserId(Long userId);
	
	/**
	 * 根据主键查询
	 * 
	 * @param bloodStockId
	 * @return
	 */
	BloodStock getByBloodStockId(Long bloodStockId);
	
	/**
	 * 创建血液存量记录
	 * @param userId
	 * @param bloodTypeId
	 * @return
	 */
	boolean createBlooStockByUserIdAndBTId(Long userId,Long bloodTypeId);
	
	/**
	 * 判断是否已存在该用户下的该血型的存量纪录
	 * @param userId
	 * @param bloodTypeId
	 * @return
	 */
	boolean isExsits(Long userId,Long bloodTypeId);
	
	VStockUser getStockDetailByBSId(Long bloodStockId);
}
