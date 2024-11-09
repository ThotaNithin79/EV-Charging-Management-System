package com.example.servlet;

import com.example.dao.SlotDao;
import com.example.model.Slot;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewBookingRequests")
public class ViewBookingRequestsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int stationId = Integer.parseInt(request.getParameter("stationId"));

        SlotDao slotDao = new SlotDao();
        List<Slot> bookings = slotDao.getSlotsByStationId(stationId);

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBookingRequests.jsp").forward(request, response);
    }
}
