package com.model;

public class FeesType {
	int feesTypeId;
	String typeName;
	String duration;
	int monthlyAmount;
	int quarterlyAmount;
	int halfyearlyAmount;
	int annualAmount;
	int standardId;
	public int getStandardId() {
		return standardId;
	}
	public void setStandardId(int standardId) {
		this.standardId = standardId;
	}
	public int getFeesTypeId() {
		return feesTypeId;
	}
	public void setFeesTypeId(int feesTypeId) {
		this.feesTypeId = feesTypeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	/**
	 * @return the monthlyamount
	 */
	/**
	 * @return the monthlyAmount
	 */
	public int getMonthlyAmount() {
		return monthlyAmount;
	}
	/**
	 * @param monthlyAmount the monthlyAmount to set
	 */
	public void setMonthlyAmount(int monthlyAmount) {
		this.monthlyAmount = monthlyAmount;
	}
	/**
	 * @return the quarterlyAmount
	 */
	public int getQuarterlyAmount() {
		return quarterlyAmount;
	}
	/**
	 * @param quarterlyAmount the quarterlyAmount to set
	 */
	public void setQuarterlyAmount(int quarterlyAmount) {
		this.quarterlyAmount = quarterlyAmount;
	}
	/**
	 * @return the halfyearlyAmount
	 */
	public int getHalfyearlyAmount() {
		return halfyearlyAmount;
	}
	/**
	 * @param halfyearlyAmount the halfyearlyAmount to set
	 */
	public void setHalfyearlyAmount(int halfyearlyAmount) {
		this.halfyearlyAmount = halfyearlyAmount;
	}
	/**
	 * @return the annualAmount
	 */
	public int getAnnualAmount() {
		return annualAmount;
	}
	/**
	 * @param annualAmount the annualAmount to set
	 */
	public void setAnnualAmount(int annualAmount) {
		this.annualAmount = annualAmount;
	}
	
}
