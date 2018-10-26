package com.bloodlib.workflow.model;

import java.math.BigDecimal;

public class BloodStock {
    private Long bloodStockId;

    private Long userId;

    private Long bloodTypeId;

    private BigDecimal stockQuantity;

    private BigDecimal safeStock;

    private BigDecimal maxStock;

    public Long getBloodStockId() {
        return bloodStockId;
    }

    public void setBloodStockId(Long bloodStockId) {
        this.bloodStockId = bloodStockId;
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

    public BigDecimal getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(BigDecimal stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public BigDecimal getSafeStock() {
        return safeStock;
    }

    public void setSafeStock(BigDecimal safeStock) {
        this.safeStock = safeStock;
    }

    public BigDecimal getMaxStock() {
        return maxStock;
    }

    public void setMaxStock(BigDecimal maxStock) {
        this.maxStock = maxStock;
    }
}