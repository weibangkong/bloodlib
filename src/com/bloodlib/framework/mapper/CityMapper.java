package com.bloodlib.framework.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.City;

@Repository("cityMapper")
public interface CityMapper {
    int deleteByPrimaryKey(Long cid);

    int insert(City record);

    int insertSelective(City record);

    City selectByPrimaryKey(Long cid);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
    
    /*
     * 根据省份id查询该省份下的城市列表
     */
    List<City> getCityByPid(Long pid);
}