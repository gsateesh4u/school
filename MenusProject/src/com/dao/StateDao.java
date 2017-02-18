/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.*;
import java.util.*;

import com.jdbc.*;
import com.model.City;
import com.model.State;

/**
 *
 * @author pavan
 */
public class StateDao {

	private static Connection dbConnection;
	// private PreparedStatement pStmt;

	public StateDao() {
		dbConnection = DBUtility.getConnection();
		System.out.println("inside a constructor");
	}

	public void insertState() {

	}

	public List<State> getAllState() throws SQLException {
		Statement st = dbConnection.createStatement();
		String sql = "SELECT c.cityid, c.cityname, c.stateid, s.name from `school`.`city` c , `school`.`state` s where s.stateid = c.stateid;";
		ResultSet rs = st.executeQuery(sql);
		List<State> states = new ArrayList<State>();
		City tempCity;
		State tempState;
		while (rs.next()) {
			int stateId = rs.getInt("stateid");
			int cityId = rs.getInt("cityid");
			String stateName = rs.getString("name");
			String cityName = rs.getString("cityname");
			boolean isSateExisted = false;
			tempCity = new City();
			tempCity.setCityId(cityId);
			tempCity.setStateId(stateId);
			tempCity.setCityName(cityName);
			if (states.size() == 0) {
				tempState = new State();
				tempState.setStateId(stateId);
				tempState.setStateName(stateName);
				tempState.setCityList(new ArrayList<City>());
				tempState.getCityList().add(tempCity);
				states.add(tempState);
			} else {
				for (State state : states) {
					if (state.getStateId() == stateId) {
						if (state.getCityList() == null) {
							state.setCityList(new ArrayList<City>());
						}
						state.getCityList().add(tempCity);
						isSateExisted = true;
					}
				}
				if (!isSateExisted) {
					tempState = new State();
					tempState.setStateId(stateId);
					tempState.setStateName(stateName);
					tempState.setCityList(new ArrayList<City>());
					tempState.getCityList().add(tempCity);
					states.add(tempState);
				}
			}

		}
		// dbConnection.close();
		return states;

	}

}
