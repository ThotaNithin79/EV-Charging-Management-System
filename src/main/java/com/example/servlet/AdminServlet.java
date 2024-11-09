package com.example.servlet;

import com.example.dao.UserDao;

import com.example.dao.StationDao;
import com.example.model.Station;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stationId = request.getParameter("stationId");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        StationDao stationDao = new StationDao();
        Station station = stationDao.getStationById(Integer.parseInt(stationId));
        
        UserDao userDao = new UserDao();
        
        if(station==null) {
        	response.sendRedirect("adminLogin.jsp?error=Invalid credentials");
            
        }else if (station.getUserId() == userDao.getUserId(email, password) ) {
            request.setAttribute("station", station);
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        } else {
            response.sendRedirect("adminLogin.jsp?error=Invalid credentials");
        }
    }
}
