package com.bloodlib.framework.model;

public class BloodType {
    private Long bloodTypeId;

	private String type1;

	private String type2;

	private String inputType;

	private String outputType;

	private String remark;

	public Long getBloodTypeId() {
		return bloodTypeId;
	}

	public void setBloodTypeId(Long bloodTypeId) {
		this.bloodTypeId = bloodTypeId;
	}

	public String getType1() {
		return type1;
	}

	public void setType1(String type1) {
		this.type1 = type1;
	}

	public String getType2() {
		return type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	public String getInputType() {
		return inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	public String getOutputType() {
		return outputType;
	}

	public void setOutputType(String outputType) {
		this.outputType = outputType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}