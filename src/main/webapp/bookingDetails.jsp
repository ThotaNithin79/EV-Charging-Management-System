<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Slot" %>
<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Station" %>
<%@ page import="com.example.dao.StationDao" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Slot> slots = (List<Slot>) request.getAttribute("slots");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Google Fonts for modern typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('images/background-image.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            margin: 0;
            padding-top: 60px; /* Adjust for fixed navbar */
        }
        .navbar {
            background-color: rgba(0, 123, 255, 0.9); /* Slightly transparent background */
            color: white;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }
        .navbar .nav-items {
            display: flex;
            gap: 20px;
            margin-left: auto; /* Push items to the right */
        }
        .navbar .nav-items a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px;
            transition: background-color 0.3s ease;
            margin-right: 20px;
        }
        .navbar .nav-items a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            max-width: 1200px;
        }
        .main-content {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .main-content h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1><i class="fas fa-charging-station"></i> CPAEV</h1>
        <div class="nav-items">
            <a href="home.jsp">Home</a>
            <a href="adminLogin.jsp">Admin Mode</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="main-content">
            <h2>Your Booking Details</h2>
            <table>
                <thead>
                    <tr>
                        <th>Station Name</th>
                        <th>Area Name</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (slots != null && !slots.isEmpty()) {
                            for (Slot slot : slots) {
                            	Station station = new StationDao().getStationById(slot.getStationId());
                    %>
                    <tr>
                        <td><%= station.getName() %></td>
                        <td><%= station.getAreaName() %></td>
                        <td><%= slot.getDate() %></td>
                        <td><%= slot.getTime() %></td>
                        <td><%= slot.getStatus() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5">No booking details found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
