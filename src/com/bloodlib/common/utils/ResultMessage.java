package com.bloodlib.common.utils;

import java.util.List;
/**
 * 返回消息/结果类
 * 
 * @author WeiBang Kong
 *
 */
public class ResultMessage extends Message{
	private String success;
	private String msg;
	
	private long total;
	private List<?> rows;


	public long getTotal() {
		return total;
	}
	
	/**
	 * 返回数据条数，适用于bootstrap和easyui
	 * 
	 * @param total
	 */
	public void setTotal(long total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}
	
	/**
	 * 返回数据集合，适用于bootstrap和easyui
	 * 
	 * @param rows
	 */
	public void setRows(List<?> rows) {
		this.rows = rows;
	}

	public String getSuccess() {
		return success;
	}
	/**
	 * 返回操作是否成功
	 * 
	 * @param success
	 */
	public void setSuccess(String success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}
	/**
	 * 返回操作消息
	 * 
	 * @param msg
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
