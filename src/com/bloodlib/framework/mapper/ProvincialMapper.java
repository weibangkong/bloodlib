package com.bloodlib.framework.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.Provincial;

@Repository("provincialMapper")
public interface ProvincialMapper {
    int deleteByPrimaryKey(Long pid);

    int insert(Provincial record);

    int insertSelective(Provincial record);

    Provincial selectByPrimaryKey(Long pid);

    int updateByPrimaryKeySelective(Provincial record);

    int updateByPrimaryKey(Provincial record);
    
    List<Provincial> getProList();
}