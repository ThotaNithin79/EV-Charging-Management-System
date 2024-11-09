package com.example.servlet;

import com.example.dao.StationDao;
import com.example.model.Station;
import com.example.model.User;
import com.example.dao.UserDao;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/myStations")
public class MyStationsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	User user = (User)request.getSession().getAttribute("user");
    	
    	int userID = new UserDao().getUserId(user.getEmail(), user.getPassword());

        StationDao stationDao = new StationDao();
        List<Station> stations = stationDao.searchStationByUserId(userID);

        request.setAttribute("stations", stations);
        request.getRequestDispatcher("myStations.jsp").forward(request, response);
    }
}
