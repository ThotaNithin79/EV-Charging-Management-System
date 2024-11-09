package com.example.servlet;

import com.example.dao.UserDao;
import com.example.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get the input email and password from the user
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // create userDao object to perform database related operations on user
        UserDao userDao = new UserDao();
        
        if(userDao.isUserRegistered(email)) {
        	HttpSession session = request.getSession();
        	session.setAttribute("registrationError", "Email address already registered. Please use a different email or login.");
        	response.sendRedirect("register.jsp");
        }else {
        	
        	User user = new User(email, password);
        	 
        	userDao.registerUser(user);
        	
        	HttpSession session = request.getSession();
            
            session.setAttribute("registrationAlert", "Account registration successfull. Please login to access..");

            response.sendRedirect("login.jsp");
        	
        }
        
        
    }
}
