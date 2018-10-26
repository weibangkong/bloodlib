package com.bloodlib.common.utils;

import java.util.List;

public class MessageHelper {

	/**
	 * 将list封装成LayuiMessage
	 * @param list
	 * @return
	 */
	public static LayuiMessage formatToLayuiMsg(List<?> list,long total){
		LayuiMessage resultMsg=new LayuiMessage();
		resultMsg.setCode(0);
		resultMsg.setMsg("查询成功");
		resultMsg.setData(list);
		resultMsg.setCount(total);
		return resultMsg;
	}
	
	/**
	 * 将list封装成ResultMessage
	 * @param list
	 * @return
	 */
	public static ResultMessage formatToResultMsg(List<?> list,long total){
		ResultMessage resultMsg=new ResultMessage();
		resultMsg.setSuccess("success");
		resultMsg.setMsg("查询成功");
		resultMsg.setRows(list);
		resultMsg.setTotal(total);
		return resultMsg;
	}
}
