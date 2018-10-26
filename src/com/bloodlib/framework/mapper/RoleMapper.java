package com.bloodlib.framework.mapper;

import com.bloodlib.framework.model.Role;

public interface RoleMapper {


	int deleteByPrimaryKey(Long roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}