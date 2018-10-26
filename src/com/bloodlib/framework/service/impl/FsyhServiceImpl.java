package com.bloodlib.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bloodlib.framework.mapper.FsyhMapper;
import com.bloodlib.framework.model.Fsyh;
import com.bloodlib.framework.service.FsyhService;

@Service("fsyhService")
public class FsyhServiceImpl implements FsyhService{

	@Autowired
	private FsyhMapper fsyhMapper;

	@Override
	public boolean insert(Fsyh fsyh) {
		if(fsyhMapper.insert(fsyh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean update(Fsyh fsyh) {
		if(fsyhMapper.updateByPrimaryKey(fsyh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean delete(Long fsyhId) {
		if(fsyhMapper.deleteByPrimaryKey(fsyhId)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Fsyh getFsyhByFsyhId(Long fsyhId) {
		return fsyhMapper.selectByPrimaryKey(fsyhId);
	}

	@Override
	public Fsyh getFsyhByUserId(Long userId) {
		return fsyhMapper.getFsyhInfoByUserId(userId);
	}
}
