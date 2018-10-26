package com.bloodlib.workflow.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.workflow.model.BloodStock;
@Repository("bloodStockMapper")
public interface BloodStockMapper {
    int deleteByPrimaryKey(Long bloodStockId);

    int insert(BloodStock record);

    int insertSelective(BloodStock record);

    BloodStock selectByPrimaryKey(Long bloodStockId);

    int updateByPrimaryKeySelective(BloodStock record);

    int updateByPrimaryKey(BloodStock record);
    
    int deleteByUserId(Long userId);
    
    List<BloodStock> getListByUserId(Long userId);
    
    /**
     * 查询数量根据用户id和血型id
     * @param userId
     * @param bloodTypeId
     * @return
     */
    Long getCountByUserIdAndBTId(Long userId,Long bloodTypeId);
    
    /**
     * 根据用户id和血液类型加载存量信息
     * @param userId
     * @param bloodTypeId
     * @return
     */
    BloodStock getStockInfoByUserIdAndBTId(Long userId,Long bloodTypeId);
}