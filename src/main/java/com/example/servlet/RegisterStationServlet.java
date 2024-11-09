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

@WebServlet("/registerStation")
public class RegisterStationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int stands = Integer.parseInt(request.getParameter("stands"));
        double price = Double.parseDouble(request.getParameter("price"));
        String areaName = request.getParameter("areaName");
        String alt1 = request.getParameter("alt1");
        String alt2 = request.getParameter("alt2");
        String alt3 = request.getParameter("alt3");
        String alt4 = request.getParameter("alt4");
        
        int userId = new UserDao().getUserId(email, password);
        StationDao stationDao = new StationDao();
        
        Station check = stationDao.getStationById(id);
        
        if(check!=null) {
        	response.sendRedirect("adminLogin.jsp?existsError=Station Already exists in the database");
        }else {

	        Station station = new Station(id, name, stands, price, areaName, alt1, alt2, alt3, alt4,userId);
	        
	        
	        
	        
	        stationDao.registerStation(station);
	
	        response.sendRedirect("adminLogin.jsp?message=Station registered successfully");
        }
    }
}
