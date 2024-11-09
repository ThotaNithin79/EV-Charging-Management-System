package com.example.servlet;

import com.example.dao.UserDao;
import com.example.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        User user = userDao.validateUser(email, password);

        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("home");
        } else {
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
    }
}
