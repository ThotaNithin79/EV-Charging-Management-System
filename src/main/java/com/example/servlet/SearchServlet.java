package com.example.servlet;

import com.example.dao.StationDao;
import com.example.model.Station;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String area = request.getParameter("area");

        StationDao stationDao = new StationDao();
        List<Station> stations = stationDao.searchStationsByArea(area);

        request.setAttribute("stations", stations);
        request.getRequestDispatcher("searchResults.jsp").forward(request, response);
    }
}
