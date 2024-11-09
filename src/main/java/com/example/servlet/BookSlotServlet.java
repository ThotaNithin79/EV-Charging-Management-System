package com.example.servlet;

import com.example.dao.SlotDao;
import com.example.dao.UserDao;
import com.example.model.User;
import com.example.model.Slot;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BookSlotServlet")
public class BookSlotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user session
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp?error=Invalid credentials");
            return;
        }

        // Get form parameters
        int stationId = Integer.parseInt(request.getParameter("stationId"));
        String dateStr = request.getParameter("date");
        String timeStr = request.getParameter("time");

        // Create a Slot object
        Slot slot = new Slot();
        slot.setStationId(stationId);
        slot.setUserId(new UserDao().getUserId(user.getEmail(), user.getPassword()));
        slot.setDate(dateStr);
        slot.setTime(timeStr);
        slot.setStatus("pending");

        // Store slot booking details in the database
        SlotDao slotDao = new SlotDao();
        boolean success = slotDao.registerSlot(slot);

        if (success) {
            response.sendRedirect("bookSlotConfirmation.jsp?message=Booking request received. Please wait for approval.");
        } else {
            response.sendRedirect("bookSlot.jsp?stationId=" + stationId + "&error=Unable to process the booking request. Please try again.");
        }
    }
}
