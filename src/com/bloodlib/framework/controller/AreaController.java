package com.bloodlib.framework.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bloodlib.common.utils.ResultMessage;
import com.bloodlib.framework.service.AreaService;

@Controller
@RequestMapping(value="area")
public class AreaController {

	@Autowired
	private AreaService areaService;
	
	@ResponseBody
	@RequestMapping(value="/getlist")
	public ResultMessage getArea(){
		ResultMessage resultMsg=new ResultMessage();
		List<?> area_list=areaService.getArea();
		resultMsg.setTotal((long)area_list.size());
		resultMsg.setRows(area_list);
		return resultMsg;
	}
}
