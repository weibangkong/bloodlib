package com.bloodlib.workflow.model;

import java.math.BigDecimal;
import java.util.Date;

public class NeedBlood {
    private Long needBloodId;

	private Long userId;

	private Long bloodTypeId;

	private BigDecimal quantity;

	private String remark;

	private Long areaId;

	private Integer isreceived;

	private String needBloodPerson;

	private Integer certificateType;

	private String certificateCode;

	private Date createDate;

	private Long hospitalId;

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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Long getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(Long hospitalId) {
		this.hospitalId = hospitalId;
	}
}
