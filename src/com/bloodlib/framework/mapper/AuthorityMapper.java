package com.bloodlib.framework.mapper;

import com.bloodlib.framework.model.Authority;

public interface AuthorityMapper {
    int deleteByPrimaryKey(Long authorityId);

	int insert(Authority record);

	int insertSelective(Authority record);

	Authority selectByPrimaryKey(Long authorityId);

	int updateByPrimaryKeySelective(Authority record);

	int updateByPrimaryKey(Authority record);


}