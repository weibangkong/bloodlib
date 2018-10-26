package com.bloodlib.framework.service;

import com.bloodlib.framework.model.Fsyh;

public interface FsyhService {

	boolean insert(Fsyh fsyh);
	
	boolean update(Fsyh fsyh);
	
	boolean delete(Long fsyhId);
	
	Fsyh getFsyhByFsyhId(Long fsyhId);
	
	Fsyh getFsyhByUserId(Long userId);
	
}
