package com.bloodlib.workflow.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bloodlib.framework.model.User;
import com.bloodlib.workflow.model.VInputUserFsyhBloodtype;
@Repository("v_inputMapper")
public interface VInputUserFsyhBloodtypeMapper {
    int insert(VInputUserFsyhBloodtype record);

    int insertSelective(VInputUserFsyhBloodtype record);
    
    VInputUserFsyhBloodtype getAcceptInfo(Long userId);
    
    List<User> getMatchUserList(Long bloodTypeId);
    
}