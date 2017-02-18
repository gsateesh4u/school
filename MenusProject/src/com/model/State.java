package com.model;

import java.util.List;

public class State {
	
	String stateName;
	int stateId;
	List<City> cityList;
	/**
	 * @return the stateName
	 */
	public String getStateName() {
		return stateName;
	}
	/**
	 * @param stateName the stateName to set
	 */
	public void setStateName(String stateName) {
		this.stateName = stateName;
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
	/**
	 * @return the cityList
	 */
	public List<City> getCityList() {
		return cityList;
	}
	/**
	 * @param cityList the cityList to set
	 */
	public void setCityList(List<City> cityList) {
		this.cityList = cityList;
	}
	
}
