package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jdbc.DBUtility;
import com.model.Person;
import com.model.Standard;
import com.model.Student;

public class StudentDao {

	public static Connection dbConnection;
	public PreparedStatement pStmt;

	public StudentDao() {
		dbConnection = DBUtility.getConnection();
		
	}

	public void addStudent(Student student) {
		
		
		String insertQuery = "INSERT INTO student( fatherid, personid, shift, board, enrollmentdate, leavingdate, standardid, "
				+ "bloodgroup, religion, category, rollno , batch, familyincome, motherid,purchasebook,outstandingfees,academicyear) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			/*pStmt.setInt(1, student.getGrNo());
			pStmt.setInt(2, student.getDiseNo());*/
			pStmt.setInt(1, student.getFatherId());
			pStmt.setInt(2, student.getPersonId());
			pStmt.setString(3, student.getShift());
			pStmt.setString(4, student.getBoard());
			pStmt.setString(5, student.getEnrollmentDate());
			pStmt.setString(6, student.getLeavingDate());
			pStmt.setInt(7, student.getStandardId());
			pStmt.setString(8, student.getBloodGroup());
			pStmt.setString(9, student.getReligion());
			/*pStmt.setString(10, student.getNationality());*/
			pStmt.setString(10, student.getCategory());
			pStmt.setInt(11, getNextRollNo(student.getStandardId(),student.getAcademicyear()));
			pStmt.setString(12, student.getBatch());
			pStmt.setInt(13, student.getFamilyIncome());
			pStmt.setInt(14, student.getMotherId());
			pStmt.setInt(15, student.getPurchaseBook());
			pStmt.setInt(16, student.getOutstandingFees());
			pStmt.setString(17, student.getAcademicyear());
			pStmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	
	public int getNextRollNo(int standardId,String academicYear) {
		
		String rollnoQuery = "SELECT max(rollno) FROM student where standardid = ? and academicyear = ?";
		try {
			PreparedStatement pStmt1 = dbConnection.prepareStatement(rollnoQuery);
			pStmt1.setInt(1, standardId);
			pStmt1.setString(2, academicYear);
			ResultSet rs= pStmt1.executeQuery();
			if(rs.next()) {
				return(rs.getInt(1)+1);
			}
						
						
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return 1;
	}
	
	
	public void deleteStudent(int studentId) {
		String deleteQuery = "DELETE FROM student WHERE studentid = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setInt(1, studentId);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateStudent(Student student) {
		String updateQuery = "UPDATE student SET fatherid = ?, personid = ?, shift = ?, board = ?, enrollmentdate = ?, "
				+ "leavingdate = ?, standardid = ?, bloodgroup = ?, religion = ?, category = ?, rollno = ? , batch = ?, familyincome = ?, motherid = ?, purchasebook = ?, outstandingfees = ?, academicyear = ? WHERE studentid = ?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);
			/*pStmt.setInt(1, student.getGrNo());
			pStmt.setInt(2, student.getDiseNo());*/
			pStmt.setInt(1, student.getFatherId());
			pStmt.setInt(2, student.getPersonId());
			pStmt.setString(3, student.getShift());
			pStmt.setString(4, student.getBoard());
			pStmt.setString(5, student.getEnrollmentDate());
			pStmt.setString(6, student.getLeavingDate());
			pStmt.setInt(7, student.getStandardId());
			pStmt.setString(8, student.getBloodGroup());
			pStmt.setString(9, student.getReligion());
			/*pStmt.setString(12, student.getNationality());*/
			pStmt.setString(10, student.getCategory());
			pStmt.setInt(11, student.getRollNo());
			pStmt.setString(12, student.getBatch());
			pStmt.setInt(13, student.getFamilyIncome());
			pStmt.setInt(14, student.getMotherId());
			pStmt.setInt(15, student.getPurchaseBook());
			pStmt.setInt(16, student.getOutstandingFees());
			pStmt.setString(17,student.getAcademicyear());
			pStmt.setInt(18, student.getStudentId());
			
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<Student> getAllStudents() {
		List<Student> students = new ArrayList<Student>();

		String query = "SELECT * FROM student where leavingdate is not null  ORDER BY studentid";
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Student student = new Student();

				student.setStudentId(rs.getInt("studentid"));
				/*student.setGrNo(rs.getInt("grno"));
				student.setDiseNo(rs.getInt("diseno"));*/
				student.setFatherId(rs.getInt("fatherid"));
				student.setPersonId(rs.getInt("personid"));
				student.setShift(rs.getString("shift"));
				student.setBoard(rs.getString("board"));
				student.setEnrollmentDate(rs.getString("enrollmentdate"));
				student.setLeavingDate(rs.getString("leavingdate"));
				student.setStandardId(rs.getInt("standardid"));
				student.setBloodGroup(rs.getString("bloodgroup"));
				student.setReligion(rs.getString("religion"));
				/*student.setNationality(rs.getString("nationality"));*/
				student.setCategory(rs.getString("category"));
				student.setRollNo(rs.getInt("rollno"));
				student.setBatch(rs.getString("batch"));
				student.setFamilyIncome(rs.getInt("familyincome"));
				student.setMotherId(rs.getInt("motherid"));
				student.setPurchaseBook(rs.getInt("purchasebook"));
				student.setOutstandingFees(rs.getInt("outstandingfees"));
				student.setAcademicyear(rs.getString("academicyear"));
				students.add(student);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return students;
	}

	public List<Student> getStudentsFromPersonId(int[] personId) {
		List<Student> students = new ArrayList<Student>();

		for (int i = 0; i < personId.length; i++) {
			String query = "SELECT * FROM student WHERE personid="
					+ personId[i];
			try {
				Statement stmt = dbConnection.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
					Student student = new Student();

					student.setStudentId(rs.getInt("studentid"));
					/*student.setGrNo(rs.getInt("grno"));
					student.setDiseNo(rs.getInt("diseno"));*/
					student.setFatherId(rs.getInt("fatherid"));
					student.setPersonId(rs.getInt("personid"));
					student.setShift(rs.getString("shift"));
					student.setBoard(rs.getString("board"));
					student.setEnrollmentDate(rs.getString("enrollmentdate"));
					student.setLeavingDate(rs.getString("leavingdate"));
					student.setStandardId(rs.getInt("standardid"));
					student.setBloodGroup(rs.getString("bloodgroup"));
					student.setReligion(rs.getString("religion"));
					/*student.setNationality(rs.getString("nationality"));*/
					student.setCategory(rs.getString("category"));
					student.setRollNo(rs.getInt("rollno"));
					student.setBatch(rs.getString("batch"));
					student.setFamilyIncome(rs.getInt("familyincome"));
					student.setMotherId(rs.getInt("motherid"));
					student.setPurchaseBook(rs.getInt("purchasebook"));
					student.setOutstandingFees(rs.getInt("outstandingfees"));
					student.setAcademicyear(rs.getString("academicyear"));
					students.add(student);
				}
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
		return students;
	}

	public void promoteStudentThroughStudentId(int[] studentId) {

		for (int i = 0; i < studentId.length; i++) {
			Student student = StudentDao.getStudentThroughId(studentId[i]);
			Person person = PersonDao.getPersonThroughId(student.getPersonId());
			Standard standard = StandardDao.getStandardThroughId(student.getStandardId());
			String query;
			String insertQuery;
			if (student.getStandardId() >= 13) {
				
				insertQuery = "INSERT INTO history( firstname, middlename, lastname, standardname, joiningdate, leavingdate) "
						+ "VALUES (?,?,?,?,?,?)";
				query = "UPDATE student SET standardid = -1  WHERE studentid="
						+ studentId[i];
				System.out.println("greater");
			} else {
				insertQuery = "INSERT INTO history( firstname, middlename, lastname, standardname, joiningdate, leavingdate) "
						+ "VALUES (?,?,?,?,?,?)";
				query = "UPDATE student SET standardid = standardid + 1 WHERE studentid="
						+ studentId[i];
				System.out.println("lesser");
			}
			try {
				PreparedStatement pStmt = dbConnection.prepareStatement(insertQuery);
				pStmt.setString(1,person.getFirstName() );
				pStmt.setString(2, person.getMiddleName());
				pStmt.setString(3, person.getMiddleName());
				pStmt.setString(4, standard.getStandardName());
				pStmt.setString(5, student.getEnrollmentDate());
				pStmt.setString(6, student.getLeavingDate());
				pStmt.executeUpdate();
				Statement stmt = dbConnection.createStatement();
				stmt.executeUpdate(query);
				
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}

	}
	
	public void demoteStudentThroughStudentId(int[] studentId) {

		for (int i = 0; i < studentId.length; i++) {
			Student student = StudentDao.getStudentThroughId(studentId[i]);
			String query;
			if (student.getStandardId() < 1) {
				query = "UPDATE student SET standardid=" + student.getStandardId() +"  WHERE studentid=" + studentId[i];
				System.out.println("less than first standard");
			} else {
				query = "UPDATE student SET standardid = standardid - 1 WHERE studentid="
						+ studentId[i];
				System.out.println("lesser");
			}
			try {
				Statement stmt = dbConnection.createStatement();
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
	}

	public void purchaseBookByStudent(int[] studentId,int standardId) {
		int result = 0;
		for (int i = 0; i < studentId.length; i++) {
			Student student = StudentDao.getStudentThroughId(studentId[i]);
			String query;
			query = "UPDATE student SET purchasebook = 1  WHERE studentid="
						+ studentId[i];
			try {
				Statement stmt = dbConnection.createStatement();
				result += stmt.executeUpdate(query);
				System.out.println("Result of puchase Book : " + result);
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
		String query1="UPDATE bookset SET availquantity = availquantity - " + result + "   WHERE standardId="+ standardId;
		try {
			Statement stmt = dbConnection.createStatement();
			stmt.executeUpdate(query1);
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	
	public void resetPurchaseBook() {
			String query;
			query = "UPDATE student SET purchasebook = 0";
			try {
				Statement stmt = dbConnection.createStatement();
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
			
			String query1;
			query1 = "UPDATE bookset SET availquantity = quantity";
			try {
				Statement stmt = dbConnection.createStatement();
				stmt.executeUpdate(query1);
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
	}

	public List<Student> getStudentsFromStandardId(int standardId) {
		List<Student> students = new ArrayList<Student>();

		String query = "SELECT * FROM student WHERE leavingdate is  null AND  standardid=" + standardId;
		System.out.println(query);
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Student student = new Student();
				System.out.println("Student Standard ");
				student.setStudentId(rs.getInt("studentid"));
				/*student.setGrNo(rs.getInt("grno"));
				student.setDiseNo(rs.getInt("diseno"));*/
				student.setFatherId(rs.getInt("fatherid"));
				student.setPersonId(rs.getInt("personid"));
				student.setShift(rs.getString("shift"));
				student.setBoard(rs.getString("board"));
				student.setEnrollmentDate(rs.getString("enrollmentdate"));
				student.setLeavingDate(rs.getString("leavingdate"));
				student.setStandardId(rs.getInt("standardid"));
				student.setBloodGroup(rs.getString("bloodgroup"));
				student.setReligion(rs.getString("religion"));
				/*student.setNationality(rs.getString("nationality"));*/
				student.setCategory(rs.getString("category"));
				student.setRollNo(rs.getInt("rollno"));
				student.setBatch(rs.getString("batch"));
				student.setFamilyIncome(rs.getInt("familyincome"));
				student.setMotherId(rs.getInt("motherid"));
				student.setPurchaseBook(rs.getInt("purchasebook"));
				student.setOutstandingFees(rs.getInt("outstandingfees"));
				student.setAcademicyear(rs.getString("academicyear"));
				students.add(student);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return students;
	}

	public static Student getStudentThroughId(int studentId) {
		Student student = new Student();
		String query = "SELECT * FROM student WHERE studentid=" + studentId;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			System.out.println("stmt1");
			stmt = dbConnection.createStatement();
			System.out.println("stmt2");
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				System.out.println("resultSet");
				student.setStudentId(rs.getInt("studentid"));
				/*student.setGrNo(rs.getInt("grno"));
				student.setDiseNo(rs.getInt("diseno"));*/
				student.setFatherId(rs.getInt("fatherid"));
				student.setPersonId(rs.getInt("personid"));
				student.setShift(rs.getString("shift"));
				student.setBoard(rs.getString("board"));
				student.setEnrollmentDate(rs.getString("enrollmentdate"));
				student.setLeavingDate(rs.getString("leavingdate"));
				student.setStandardId(rs.getInt("standardid"));
				student.setBloodGroup(rs.getString("bloodgroup"));
				student.setReligion(rs.getString("religion"));
				/*student.setNationality(rs.getString("nationality"));*/
				student.setCategory(rs.getString("category"));
				student.setRollNo(rs.getInt("rollno"));
				student.setBatch(rs.getString("batch"));
				student.setFamilyIncome(rs.getInt("familyincome"));
				student.setMotherId(rs.getInt("motherid"));
				student.setPurchaseBook(rs.getInt("purchasebook"));
				student.setOutstandingFees(rs.getInt("outstandingfees"));
				student.setAcademicyear(rs.getString("academicyear"));
			}
		} catch (SQLException e) {
			System.out.println("exception");
			System.err.println(e.getMessage());
			System.out.println(e);
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("inside student through id1 " + studentId);
		return student;
	}
	
	// For Fees Module when we want to add fees in tables like charge, payment, invoice.
	public static int getMaxSequenceNo(int studentId){
		int maxCharge=0,maxPayment=0,maxInvoice=0;
		String chargeQuery = "SELECT max(sequenceno) as maxseq FROM charge where studentid = " + studentId;
		String paymentQuery = "SELECT max(sequenceno) as maxseq FROM payment where studentid = " + studentId;
		String invoiceQuery = "SELECT max(sequenceno) as maxseq FROM invoice where studentid = " + studentId;
		System.out.println("charge : " + chargeQuery + "payment : " + paymentQuery + "invoice : " + invoiceQuery);
		try {
			Statement stmt1 = dbConnection.createStatement();
			ResultSet rs1 = stmt1.executeQuery(chargeQuery);
			rs1.next(); 
			maxCharge = rs1.getInt("maxseq");
				
			
			Statement stmt2 = dbConnection.createStatement();
			ResultSet rs2 = stmt2.executeQuery(paymentQuery);
			rs2.next(); 
			maxPayment = rs2.getInt("maxseq");
			
			Statement stmt3 = dbConnection.createStatement();
			ResultSet rs3 = stmt3.executeQuery(invoiceQuery);
			rs3.next(); 
			maxInvoice = rs3.getInt("maxseq");
			
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%");
			System.out.println("charge : " + maxCharge + "payment : " + maxPayment + "invoice : " + maxInvoice);
			if(maxCharge > maxPayment){
				if(maxCharge > maxInvoice)
					return maxCharge;
				else
					return maxInvoice;
			}
			else{
				if(maxPayment > maxInvoice)
					return maxPayment;
				else
					return maxInvoice;
			}	
				
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return -1;
	}
	
	public static void updateOutstandingFees(int studentId,int outstandingFees){
		String query;
		query = "UPDATE student SET outstandingfees=" + outstandingFees + " WHERE studentid=" + studentId;
		try {
			Statement stmt = dbConnection.createStatement();
			int res = stmt.executeUpdate(query);
			System.out.println("Row Update : " + res);
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	public int getMaxGrNo(){
		String query = "select max(grno) from student";
		
		try {
			Statement st = dbConnection.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return -1;
		
	}
	
	public void leaveSchool(int studentId){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String leavingDate =  dateFormat.format(date);
		String query = "update student set leavingdate = ? where studentid = ?";
		try{
			pStmt = dbConnection.prepareStatement(query);
			pStmt.setString(1, leavingDate);
			pStmt.setInt(2, studentId);
			pStmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
}