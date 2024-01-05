package com.employeemanagment.view;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.employeemanagment.dao.UserDao;
import com.employeemanagment.model.Address;
import com.employeemanagment.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDAO;

    public void init() {
        userDAO = new UserDao();
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/insert":
                    insertUser(request, response);
                    break;
                case "/delete":
                    deleteUser(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                    
                case "/editaddress":
                	showEditAddressForm(request,response);
                	break;
                	
                case "/update":
                    updateUser(request, response);
                    break;
                case "/insertaddress":
                	insertAddress(request, response);
                	break;
                case "/updateaddress":
                	updateAddress(request, response);
                	break;
                case "/deleteaddress":
                	deleteAddress(request, response);
                	break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
    	HttpSession session=request.getSession();
        List < User > listUser = userDAO.selectAllUsers();
        List <Address> listAddress=userDAO.selectAllAddress();
        session.setAttribute("listUser", listUser);
        session.setAttribute("listAddress", listAddress);
        response.sendRedirect("index.jsp");
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("empEditForm.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }
    
    private void showEditAddressForm(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, ServletException, IOException {
    	        int id = Integer.parseInt(request.getParameter("id"));
    	        Address existingAddress = userDAO.selectAddress(id);
    	        RequestDispatcher dispatcher = request.getRequestDispatcher("empEditAddressForm.jsp");
    	        request.setAttribute("address", existingAddress);
    	        dispatcher.forward(request, response);
    	    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
    	System.out.println("insert method is called");
        String firstname = request.getParameter("empfirstname");
        String middlename = request.getParameter("empmiddlename");
        String lastname = request.getParameter("emplastname");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("empdob");
        String position = request.getParameter("empposition");
        String email = request.getParameter("email");
        
        User user=new User(firstname,middlename,lastname,gender,dob,position,email);
       
        userDAO.insertEmployee(user);
        listUser(request, response);
    }
    
    private void insertAddress(HttpServletRequest request,HttpServletResponse response)throws SQLException,IOException,ServletException
    {
    	int id =Integer.parseInt(request.getParameter("empid"));
    	String country=request.getParameter("country");  
        String state=request.getParameter("state"); 
        String district=request.getParameter("district"); 
        int pincode=Integer.parseInt(request.getParameter("pincode")); 
        String city=request.getParameter("city"); 
        String address1=request.getParameter("address1"); 
        String address2=request.getParameter("address2");
        System.out.println(id);
        System.out.println(country);
        System.out.println(state);
        System.out.println(district);
        System.out.println(pincode);
        System.out.println(city);
        System.out.println(address1);
        System.out.println(address2);
        
        Address address = new Address(id,country, state, district,pincode,city,address1,address2);
        userDAO.insertAddress(address);
        listUser(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("the selected id is:"+id);
        String firstname = request.getParameter("empfirstname");
        String middlename = request.getParameter("empmiddlename");
        String lastname = request.getParameter("emplastname");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("empdob");
        String position = request.getParameter("empposition");
        String email = request.getParameter("email");
        User user = new User(id, firstname, middlename, lastname,gender,dob,position,email);
        userDAO.updateUser(user);
        listUser(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        System.out.println("delete user method executed!");
       listUser(request, response);

    }
    
    private void updateAddress(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException, ServletException {
    	        int id = Integer.parseInt(request.getParameter("addressID"));
    	        System.out.println("the selected address id is:"+id);
    	        String country = request.getParameter("country");
    	        String state = request.getParameter("state");
    	        String district = request.getParameter("district");
    	        int pincode = Integer.parseInt(request.getParameter("pincode"));
    	        String city = request.getParameter("city");
    	        String address1 = request.getParameter("address1");
    	        String address2 = request.getParameter("address2");
    	        Address address = new Address(id, country, state, district,pincode,city,address1,address2);
    	        userDAO.updateAddress(address);
    	        listUser(request, response);
    	    }

    	    private void deleteAddress(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException, ServletException {
    	        int id = Integer.parseInt(request.getParameter("id"));
    	        userDAO.deleteAddress(id);
    	        System.out.println("delete address method executed!");
    	       listUser(request, response);

    	    }
}