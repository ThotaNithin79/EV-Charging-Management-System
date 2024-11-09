package com.example.servlet;

import com.example.dao.StationDao;
import com.example.model.Station;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editStation")
public class EditStationServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StationDao stationDao = new StationDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int stationId = Integer.parseInt(request.getParameter("stationId"));
        Station station = stationDao.getStationById(stationId);
        request.setAttribute("station", station);
        request.getRequestDispatcher("editStation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String areaName = request.getParameter("areaName");
        double price = Double.parseDouble(request.getParameter("price"));
        int stands = Integer.parseInt(request.getParameter("stands"));
        String alt1 = request.getParameter("alt1");
        String alt2 = request.getParameter("alt2");
        String alt3 = request.getParameter("alt3");
        String alt4 = request.getParameter("alt4");

        Station station = stationDao.getStationById(id);
        station.setName(name);
        station.setAreaName(areaName);
        station.setPrice(price);
        station.setStands(stands);
        station.setAlt1(alt1);
        station.setAlt2(alt2);
        station.setAlt3(alt3);
        station.setAlt4(alt4);
        
        stationDao.updateStation(station);
        response.sendRedirect("adminLogin.jsp");
    }
}
