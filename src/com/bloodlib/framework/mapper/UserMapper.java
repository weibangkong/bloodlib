package com.bloodlib.framework.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.User;
@Repository("userMapper")
public interface UserMapper {


	int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    Long getUserCountByLoginName(String loginName);
    
    User loginQuery(String loginname,String password);
    
    List<User> getUserList();
    
    Long getMaxID();
    //String getUserNameByID(long userId);
    int updatePassword(Long userId,String new_password);
    
    List<User> getUnformalUserList();
  /*  List<User> getUnformalUserList(Long start,Long end);*/
    
    Long getCountByRoleId(Long roleId);
    
    Long getCountHospitalAndBloodlib();
    
    List<User> getHospitals(Long areaId);
    
}