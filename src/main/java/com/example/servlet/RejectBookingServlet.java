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

@WebServlet("/rejectBooking")
public class RejectBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SlotDao slotDao = new SlotDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String slotId = request.getParameter("slotId");
        int stationId = Integer.parseInt(request.getParameter("stationId"));
        if (slotId != null && !slotId.isEmpty()) {
            slotDao.updateSlotStatus(Integer.parseInt(slotId), "Rejected");
        }
        
        List<Slot> bookings = slotDao.getSlotsByStationId(stationId);
        request.setAttribute("bookings", bookings);
        
        request.getRequestDispatcher("viewBookingRequests.jsp").forward(request, response);
    }
}
