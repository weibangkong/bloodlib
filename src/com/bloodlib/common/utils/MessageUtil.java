package com.bloodlib.common.utils;

import java.util.List;

public class MessageUtil {

	/**
	 * 将list封装成LayuiMessage
	 * @param list
	 * @return
	 */
	public LayuiMessage listToLayuiMsg(List<?> list){
		LayuiMessage resultMsg=new LayuiMessage();
		resultMsg.setCode(0);
		resultMsg.setMsg("");
		resultMsg.setData(list);
		resultMsg.setCount((long)list.size());
		return resultMsg;
	}
	
	/**
	 * 将list封装成ResultMessage
	 * @param list
	 * @return
	 */
	public ResultMessage listToResultMsg(List<?> list){
		ResultMessage resultMsg=new ResultMessage();
		resultMsg.setSuccess("success");
		resultMsg.setMsg("查询成功");
		resultMsg.setRows(list);
		resultMsg.setTotal((long)list.size());
		return resultMsg;
	}
}
