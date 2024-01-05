package com.registration;

import jakarta.servlet.RequestDispatcher;
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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changepass")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		RequestDispatcher dispatcher=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/signup?useSSL=false","root","Sandesh@123");
			PreparedStatement ps=conn.prepareStatement("select * from users where email=?");
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				if(oldpass.equals(rs.getString(4)))
				{
				String query="update users set password=? where email=?";
				PreparedStatement ps1=conn.prepareStatement(query);
				ps1.setString(1,newpass);
				ps1.setString(2,email);
				ps1.executeUpdate();
				request.setAttribute("passmatch", "success");
				dispatcher=request.getRequestDispatcher("index.jsp");
				}
				else
				{
					request.setAttribute("passmatch", "fail");
					dispatcher=request.getRequestDispatcher("changepassword.jsp");
				}
			}
//			else
//			{
//				request.setAttribute("status", "fail");
//				dispatcher=request.getRequestDispatcher("changepassword.jsp");
//			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
