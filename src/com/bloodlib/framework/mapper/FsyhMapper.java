package com.bloodlib.framework.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.Fsyh;
@Repository("fsyhMapper")
public interface FsyhMapper {


	int deleteByPrimaryKey(Long fsyhId);

    int insert(Fsyh record);

    int insertSelective(Fsyh record);

    Fsyh selectByPrimaryKey(Long fsyhId);

    int updateByPrimaryKeySelective(Fsyh record);

    int updateByPrimaryKey(Fsyh record);
    
    Fsyh getFsyhInfoByUserId(Long userId);
    
    List<Long> getUserIdlist(Long bloodTypeId);
}