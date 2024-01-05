package com.employeemanagment.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.employeemanagment.model.Address;
import com.employeemanagment.model.User;
import com.mysql.cj.xdevapi.Statement;

public class UserDao {
	private String url = "jdbc:mysql://localhost:3306/employeedata?useSSL=false";
	private String username = "root";
	private String password = "Sandesh@123";

	private final String insert_into_employee = "insert into employee(firstname,middlename,lastname,gender,dob,position,email) values(?,?,?,?,?,?,?);";
	private final String select_all_users = "select * from employee";
	private final String delete_employee = "delete from employee where id=?";
	private final String update_employee = "update employee set firstname=?,middlename=?,lastname=?,gender=?,dob=?,position=?,email=? where id=?";
	private final String select_user_by_id = "select id,firstname,middlename,lastname,gender,dob,position,email from employee where id=?";
	private final String insert_into_address = "insert into address(id,country,state,district,pincode,city,address1,address2)values(?,?,?,?,?,?,?,?)";
	private final String select_all_address = "select * from address;";
	private final String delete_address="delete from address where id=?";
	private final String update_address="update address set country=?,state=?,district=?,pincode=?,city=?,address1=?,address2=? where id=?";
	private final String select_address_by_id="select id,country,state,district,pincode,city,address1,address2 from address where id=?"; 
	public UserDao() {

	}

	protected Connection getconnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public void insertEmployee(User user) throws SQLException {

		try {
			Connection connection = getconnection();
			PreparedStatement ps = connection.prepareStatement(insert_into_employee);
			ps.setString(1, user.getFirstname());
			ps.setString(2, user.getMiddlename());
			ps.setString(3, user.getLastname());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getDob());
			ps.setString(6, user.getPosition());
			ps.setString(7, user.getEmail());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertAddress(Address address) throws SQLException {
		try {
			Connection conn = getconnection();
			PreparedStatement ps = conn.prepareStatement(insert_into_address);
			ps.setInt(1, address.getId());
			ps.setString(2, address.getCountry());
			ps.setString(3, address.getState());
			ps.setString(4, address.getDistrict());
			ps.setInt(5, address.getPincode());
			ps.setString(6, address.getCity());
			ps.setString(7, address.getAddress1());
			ps.setString(8, address.getAddress2());
			ps.executeUpdate();
			System.out.println("insert address dao executed!");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public User selectUser(int id) throws SQLException {
		User user = null;
		try (Connection connection = getconnection();
				PreparedStatement preparedStatement = connection.prepareStatement(select_user_by_id);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String firstname = rs.getString("firstname");
				String middlename = rs.getString("middlename");
				String lastname = rs.getString("lastname");
				String gender = rs.getString("gender");
				String dob = rs.getString("dob");
				String position = rs.getString("position");
				String email = rs.getString("email");
				user = new User(id, firstname, middlename, lastname, gender, dob, position, email);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public List<User> selectAllUsers() {

		List<User> users = new ArrayList<>();
		try (Connection connection = getconnection();

				PreparedStatement preparedStatement = connection.prepareStatement(select_all_users);) {

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String firstname = rs.getString("firstname");
				String middlename = rs.getString("middlename");
				String lastname = rs.getString("lastname");
				String gender = rs.getString("gender");
				String dob = rs.getString("dob");
				String position = rs.getString("position");
				String email = rs.getString("email");
				users.add(new User(id, firstname, middlename, lastname, gender, dob, position, email));
			}

		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	
	public Address selectAddress(int id) throws SQLException {
		Address address = null;
		try (Connection connection = getconnection();
				PreparedStatement preparedStatement = connection.prepareStatement(select_address_by_id);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String country = rs.getString("country");
				String state = rs.getString("state");
				String district = rs.getString("district");
				int pincode = rs.getInt("pincode");
				String city = rs.getString("city");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				address = new Address(id, country, state, district, pincode, city, address1, address2);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return address;
	}
	
	public List<Address> selectAllAddress() {

		List<Address> address = new ArrayList<>();
		try (Connection connection = getconnection();

				PreparedStatement addrpprestatement = connection.prepareStatement(select_all_address);) {

			ResultSet rs1 = addrpprestatement.executeQuery();

			while (rs1.next()) {
				int id = rs1.getInt("id");
				String country = rs1.getString("country");
				String state = rs1.getString("state");
				String district = rs1.getString("district");
				int pincode = rs1.getInt("pincode");
				String city = rs1.getString("city");
				String address1 = rs1.getString("address1");
				String address2 = rs1.getString("address2");
				address.add(new Address(id, country, state, district, pincode, city, address1, address2));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return address;
	}

	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getconnection();
				PreparedStatement statement = connection.prepareStatement(delete_employee);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateUser(User user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getconnection();
				PreparedStatement statement = connection.prepareStatement(update_employee);) {
			statement.setString(1, user.getFirstname());
			statement.setString(2, user.getMiddlename());
			statement.setString(3, user.getLastname());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getDob());
			statement.setString(6, user.getPosition());
			statement.setString(7, user.getEmail());

			statement.setInt(8, user.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean deleteAddress(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getconnection();
				PreparedStatement statement = connection.prepareStatement(delete_address);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateAddress(Address address) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getconnection();
				PreparedStatement statement = connection.prepareStatement(update_address);) {
			statement.setString(1, address.getCountry());
			statement.setString(2, address.getState());
			statement.setString(3, address.getDistrict());
			statement.setInt(4, address.getPincode());
			statement.setString(5, address.getCity());
			statement.setString(6, address.getAddress1());
			statement.setString(7, address.getAddress2());

			statement.setInt(8, address.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = e.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}

	}
}