package com.bloodlib.workflow.model;

import java.math.BigDecimal;

public class VStockUser {
    private Long bloodStockId;

	private Long userId;

	private Long bloodTypeId;

	private BigDecimal stockQuantity;

	private BigDecimal safeStock;

	private BigDecimal maxStock;

	private Long roleId;

	private String userName;

	private String type1;

	private String type2;

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

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
}