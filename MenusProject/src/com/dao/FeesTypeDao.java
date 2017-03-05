package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jdbc.DBUtility;
import com.model.FeesType;
import com.model.Student;

public class FeesTypeDao {

	public static Connection dbConnection;
	public PreparedStatement pStmt;

	public FeesTypeDao() {
		dbConnection = DBUtility.getConnection();
	}

	public void addFeesType(FeesType feesType) {
		String insertQuery = "INSERT INTO feestype(typename,  "
				+ "monthlyamount, quarterlyamount, halfyearlyamount, annualamount, standardid) VALUES (?,?,?,?,?,?)";
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setString(1, feesType.getTypeName());
			/*pStmt.setString(2, feesType.getDuration());*/
			pStmt.setInt(2, feesType.getMonthlyAmount());
			pStmt.setInt(3, feesType.getQuarterlyAmount());
			pStmt.setInt(4, feesType.getHalfyearlyAmount());
			pStmt.setInt(5, feesType.getAnnualAmount());
			pStmt.setInt(6, feesType.getStandardId());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteFeesType(int feesTypeId) {
		String deleteQuery = "DELETE FROM feestype WHERE feestypeid = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setInt(1, feesTypeId);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateFeesType(FeesType feesType) {
		String updateQuery = "UPDATE feestype SET typename = ?, "
				+ "monthlyamount = ?, quarterlyamount = ?, halfyearlyamount = ?, annualamount = ?, standardid = ? WHERE feestypeid = ?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);
			pStmt.setString(1, feesType.getTypeName());
			/*pStmt.setString(2, feesType.getDuration());*/
			pStmt.setInt(2, feesType.getMonthlyAmount());
			pStmt.setInt(3, feesType.getQuarterlyAmount());
			pStmt.setInt(4, feesType.getHalfyearlyAmount());
			pStmt.setInt(5, feesType.getAnnualAmount());
			pStmt.setInt(6, feesType.getStandardId());
			pStmt.setInt(7, feesType.getFeesTypeId());
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<FeesType> getAllFeesTypes() {
		List<FeesType> feesTypes = new ArrayList<FeesType>();

		String query = "SELECT * FROM feestype ORDER BY feestypeid";
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				FeesType feesType = new FeesType();
				
				feesType.setFeesTypeId(rs.getInt("feestypeid"));
				feesType.setTypeName(rs.getString("typename"));
				/*feesType.setDuration(rs.getString("duration"));*/
				feesType.setMonthlyAmount(rs.getInt("monthlyamount"));
				feesType.setQuarterlyAmount(rs.getInt("quarterlyamount"));
				feesType.setHalfyearlyAmount(rs.getInt("halfyearlyamount"));
				feesType.setAnnualAmount(rs.getInt("annualamount"));
				feesType.setStandardId(rs.getInt("standardid"));
				feesTypes.add(feesType);
				System.out.println("Fees type name is" + rs.getString("typename"));
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return feesTypes;
	}
	
	public List<FeesType> getFeesTypesFromStandardId(int standardId) {
		List<FeesType> students = new ArrayList<FeesType>();

		String query = "SELECT * FROM feestype WHERE standardid=" + standardId;
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				FeesType feesType = new FeesType();

				feesType.setFeesTypeId(rs.getInt("feestypeid"));
				feesType.setTypeName(rs.getString("typename"));
				/*feesType.setDuration(rs.getString("duration"));*/
				feesType.setMonthlyAmount(rs.getInt("monthlyamount"));
				feesType.setQuarterlyAmount(rs.getInt("quarterlyamount"));
				feesType.setHalfyearlyAmount(rs.getInt("halfyearlyamount"));
				feesType.setAnnualAmount(rs.getInt("annualamount"));
				feesType.setStandardId(rs.getInt("standardid"));
				students.add(feesType);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return students;
	}
}