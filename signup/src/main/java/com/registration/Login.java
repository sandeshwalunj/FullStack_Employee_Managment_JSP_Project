package com.registration;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?useSSL=false","root","Sandesh@123");
			PreparedStatement ps=conn.prepareStatement("select * from users where email=? and password=? ");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				session.setAttribute("name",rs.getString("username"));
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("loginstatus", "success");
				response.sendRedirect("index.jsp");
			}
			else
			{
				session.setAttribute("loginstatus","failed");
				response.sendRedirect("login.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
