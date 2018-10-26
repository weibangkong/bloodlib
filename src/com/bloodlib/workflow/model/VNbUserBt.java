package com.bloodlib.workflow.model;

import java.math.BigDecimal;
import java.util.Date;

public class VNbUserBt {
    private Long needBloodId;

	private Long userId;

	private Long bloodTypeId;

	private BigDecimal quantity;

	private String remark;

	private Long areaId;

	private Integer isreceived;

	private String needBloodPerson;

	private Long hospitalId;

	private Date createDate;

	private String areaname;

	private String operator;

	private String tel;

	private Integer certificateType;

	private String certificateCode;

	private String type1;

	private String type2;

	private String hospitalName;

	public Long getNeedBloodId() {
		return needBloodId;
	}

	public void setNeedBloodId(Long needBloodId) {
		this.needBloodId = needBloodId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getBloodTypeId() {
		return bloodTypeId;
	}

	public void setBloodTypeId(Long bloodTypeId) {
		this.bloodTypeId = bloodTypeId;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public Integer getIsreceived() {
		return isreceived;
	}

	public void setIsreceived(Integer isreceived) {
		this.isreceived = isreceived;
	}

	public String getNeedBloodPerson() {
		return needBloodPerson;
	}

	public void setNeedBloodPerson(String needBloodPerson) {
		this.needBloodPerson = needBloodPerson;
	}

	public Long getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(Long hospitalId) {
		this.hospitalId = hospitalId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getCertificateType() {
		return certificateType;
	}

	public void setCertificateType(Integer certificateType) {
		this.certificateType = certificateType;
	}

	public String getCertificateCode() {
		return certificateCode;
	}

	public void setCertificateCode(String certificateCode) {
		this.certificateCode = certificateCode;
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

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

}