package com.bloodlib.framework.service;

import java.util.List;
import java.util.Map;

import com.bloodlib.framework.model.User;
import com.bloodlib.workflow.model.VUserFsyhBt;

public interface UserService {
	
	/**
	 * 新增一个用户
	 * 
	 * @param user
	 * @return
	 */
	boolean insert(User user);

	/**
	 * 登录查询
	 * 
	 * @param loginname
	 * @param password
	 * @return
	 */
	User loginQuery(String loginname, String password);
	
	/**
	 * 获取用户列表
	 * 
	 * @return
	 */
	List<User> getUserList(Map<String,Object> condition);
	
	/**
	 * 获取用户信息
	 * 
	 * @param id
	 * @return
	 */
	User getUserInfo(long id);
	
	/**
	 * 更新用户信息 
	 * 
	 * @param user
	 * @return
	 */
	boolean updataUser(User user);
	
	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	boolean deleteUser(long id);
	

	/**
	 * 根据用户ID查找用户名
	 * 
	 * @param userId
	 * @return
	 */
	String getUserNameByID(long userId);
	
	/**
	 * 检查用户是否存在
	 * 
	 * @param loginName
	 * @return
	 */
	boolean isExists(String loginName);
	
	/**
	 * 生成一个新的id
	 * 
	 * @return
	 */
	Long getNewId();
	
	/**
	 * 根据用户id获取用户详细信息
	 * 
	 * @param userId
	 * @return
	 */
	VUserFsyhBt getUserDetailInfoByUserId(Long userId);
	
	/**
	 * 根据附属用户id获取用户详细信息
	 * 
	 * @param FsyhId
	 * @return
	 */
	VUserFsyhBt getUserDetailInfoByFsyhId(Long fsyhId);
	
	/**
	 * 获取附近的医院
	 * 
	 * @param areaId
	 * @return
	 */
	List<VUserFsyhBt> getNearHospitalList(Long areaId);
	
	/**
	 * 获取附近的血库
	 * 
	 * @param areaId
	 * @return
	 */
	List<VUserFsyhBt> getNearBloodLibList(Long areaId);
	
	/**
	 * 获取附近的列表（附近的血库或医院）
	 * 
	 * @param roleId
	 * @param areaId
	 * @return
	 */
	List<VUserFsyhBt> getNearList(Long roleId,Long areaId);
	
	
	/**
	 * 获取有血库的用户的列表
	 * @return
	 */
	List<VUserFsyhBt> getStockUserList();
	
	/**
	 * 获取非正式用户集合
	 * 
	 * @return
	 */
	List<User> getUnformalUserList();
	
	/**
	 *根据角色Id获取总条数
	 */
	Long getCountByRoleId(Long roleId);
	
	/**
	 * 获取血库和医院总条数
	 * 
	 */
	Long getHAndBCount();
	
	List<User> getHospitalList(Long areaId);

}
