package com.example.servlet;

import com.example.dao.StationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteStation")
public class DeleteStationServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StationDao stationDao = new StationDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int stationId = Integer.parseInt(request.getParameter("stationId"));

        // Perform deletion
        stationDao.deleteStation(stationId);

        // Redirect back to admin home
        response.sendRedirect("myStations?stationId="+stationId);
    }
}
