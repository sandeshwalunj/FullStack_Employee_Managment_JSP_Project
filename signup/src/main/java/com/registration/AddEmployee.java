package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/addEmployee")
public class AddEmployee extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname=request.getParameter("firstName");
		String middlename=request.getParameter("middleName");
		String lastname=request.getParameter("lastName");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		String position=request.getParameter("position");
		String email=request.getParameter("email");
		RequestDispatcher dispatcher=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?useSSL=false","root","Sandesh@123");
			PreparedStatement ps=conn.prepareStatement("insert into employeedata(firstname,middlename,lastname,email,gender,dob,position) values(?,?,?,?,?,?,?)");
			
			ps.setString(1, firstname);
			ps.setString(2, middlename);
			ps.setString(3, lastname);
			ps.setString(4, email);
			ps.setString(5, gender);
			ps.setString(6, dob);
			ps.setString(7, position);
			int row=ps.executeUpdate();
			if(row>0)
			{
				request.setAttribute("DetailStatus", "success");
				dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
