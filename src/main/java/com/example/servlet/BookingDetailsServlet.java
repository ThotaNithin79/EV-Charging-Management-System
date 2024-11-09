package com.example.servlet;

import com.example.dao.SlotDao;
import com.example.dao.UserDao;
import com.example.model.Slot;
import com.example.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/bookingDetails")
public class BookingDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        SlotDao slotDao = new SlotDao();
        List<Slot> slots = slotDao.getSlotsByUserId(new UserDao().getUserId(user.getEmail(), user.getPassword()));

        request.setAttribute("slots", slots);
        request.getRequestDispatcher("bookingDetails.jsp").forward(request, response);
    }
}
