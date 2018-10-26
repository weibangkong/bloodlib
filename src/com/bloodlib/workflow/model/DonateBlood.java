package com.bloodlib.workflow.model;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DonateBlood {
    private Long donateId;

    private Long userId;

    private Long bloodTypeId;

    private BigDecimal quantity;

    private Long donateHos;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date donateDate;

    private Integer isaccepted;

    private String certificateCode;

    private String donateer;

    private String tel;

    public Long getDonateId() {
        return donateId;
    }

    public void setDonateId(Long donateId) {
        this.donateId = donateId;
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

    public Long getDonateHos() {
        return donateHos;
    }

    public void setDonateHos(Long donateHos) {
        this.donateHos = donateHos;
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

    public String getCertificateCode() {
        return certificateCode;
    }

    public void setCertificateCode(String certificateCode) {
        this.certificateCode = certificateCode;
    }

    public String getDonateer() {
        return donateer;
    }

    public void setDonateer(String donateer) {
        this.donateer = donateer;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}