package com.model;

public class City {
	
	String cityName;
	int cityId;
	int stateId;
	
	
	
	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public void setCityName(String cityName){
		this.cityName = cityName;
	}
	
	public String getCityName(){
		
		return this.cityName;
	}

	/**
	 * @return the stateId
	 */
	public int getStateId() {
		return stateId;
	}

	/**
	 * @param stateId the stateId to set
	 */
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

}
