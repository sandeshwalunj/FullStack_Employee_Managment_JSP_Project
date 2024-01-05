package com.registration;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String uname=request.getParameter("name");
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	String contact=request.getParameter("contact");
	RequestDispatcher dispatcher=null;
	Connection conn=null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?useSSL=false","root","Sandesh@123");
		PreparedStatement ps=conn.prepareStatement("insert into users(username,email,password,mobile)values(?,?,?,?)");
		ps.setString(1, uname);
		ps.setString(2, email);
		ps.setString(3, pass);
		ps.setString(4, contact);
		
		int rowval=ps.executeUpdate();
		dispatcher=request.getRequestDispatcher("registration.jsp");
		
		if(rowval>0)
		{
			request.setAttribute("status","success");
			
		}
		else
		{
			request.setAttribute("status","failed");
		}
		dispatcher.forward(request, response);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	finally
	{
try {
	conn.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	}
	
	}

}
