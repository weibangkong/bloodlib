package com.bloodlib.workflow.model;

import java.math.BigDecimal;
import java.util.Date;

public class VDonateUserBt {
    private Long donateId;

    private BigDecimal quantity;

    private Long donateHos;

    private Long userId;

    private String donateer;

    private String certificateCode;

    private String tel;

    private Long bloodTypeId;

    private String type1;

    private String type2;

    private String hosName;

    private Date donateDate;

    private Integer isaccepted;

    public Long getDonateId() {
        return donateId;
    }

    public void setDonateId(Long donateId) {
        this.donateId = donateId;
    }

    public BigDecimal getQuantity() {
        return quantity;
    }

    public void setQuantity(BigDecimal quantity) {
        this.quantity = quantity;
    }

    public Long getDonateHos() {
        return donateHos;
    }

    public void setDonateHos(Long donateHos) {
        this.donateHos = donateHos;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getDonateer() {
        return donateer;
    }

    public void setDonateer(String donateer) {
        this.donateer = donateer;
    }

    public String getCertificateCode() {
        return certificateCode;
    }

    public void setCertificateCode(String certificateCode) {
        this.certificateCode = certificateCode;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

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

    public String getHosName() {
        return hosName;
    }

    public void setHosName(String hosName) {
        this.hosName = hosName;
    }

    public Date getDonateDate() {
        return donateDate;
    }

    public void setDonateDate(Date donateDate) {
        this.donateDate = donateDate;
    }

    public Integer getIsaccepted() {
        return isaccepted;
    }

    public void setIsaccepted(Integer isaccepted) {
        this.isaccepted = isaccepted;
    }
}