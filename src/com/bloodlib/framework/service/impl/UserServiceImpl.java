package com.bloodlib.framework.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.framework.mapper.UserMapper;
import com.bloodlib.framework.model.User;
import com.bloodlib.framework.service.UserService;
import com.bloodlib.workflow.mapper.VUserFsyhBtMapper;
import com.bloodlib.workflow.model.VUserFsyhBt;
import com.github.pagehelper.PageHelper;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private VUserFsyhBtMapper vUserFsyhBtMapper;
	
	@Override
	public boolean insert(User user) {
		if(userMapper.insert(user)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public User loginQuery(String loginname, String password) {
		return userMapper.loginQuery(loginname, password);
	}

	@Override
	public List<User> getUserList(Map<String,Object> condition) {
		//修改方法条件画
		return userMapper.getUserList();
	}

	@Override
	public User getUserInfo(long id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean updataUser(User user) {
		if(userMapper.updateByPrimaryKey(user)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean deleteUser(long id) {
		if(userMapper.deleteByPrimaryKey(id)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public String getUserNameByID(long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isExists(String loginName) {
		if(userMapper.getUserCountByLoginName(loginName)>0){
			return true;
		}
		return false;
	}

	@Override
	public Long getNewId() {
		return (userMapper.getMaxID()+1l);
	}

	@Override
	public VUserFsyhBt getUserDetailInfoByUserId(Long userId) {
		return vUserFsyhBtMapper.getUserInfoByUserId(userId);
	}

	@Override
	public VUserFsyhBt getUserDetailInfoByFsyhId(Long fsyhId) {
		return vUserFsyhBtMapper.getUserInfoByFsyhId(fsyhId);
	}

	@Override
	public List<VUserFsyhBt> getNearHospitalList(Long areaId) {
		return vUserFsyhBtMapper.getNearHospitalList(areaId);
	}

	@Override
	public List<VUserFsyhBt> getNearBloodLibList(Long areaId) {
		return vUserFsyhBtMapper.getNearBloodlibList(areaId);
	}

	@Override
	public List<VUserFsyhBt> getNearList(Long roleId, Long areaId) {
		return vUserFsyhBtMapper.getNearList(roleId, areaId);
	}

	@Override
	public List<VUserFsyhBt> getStockUserList() {
		return vUserFsyhBtMapper.getStockUserList();
	}

	@Override
	public List<User> getUnformalUserList() {
		return userMapper.getUnformalUserList();
	}

	@Override
	public Long getCountByRoleId(Long roleId) {
		return userMapper.getCountByRoleId(roleId);
	}

	@Override
	public Long getHAndBCount() {
		return userMapper.getCountHospitalAndBloodlib();
	}

	@Override
	public List<User> getHospitalList(Long areaId) {
		return userMapper.getHospitals(areaId);
	}

}
