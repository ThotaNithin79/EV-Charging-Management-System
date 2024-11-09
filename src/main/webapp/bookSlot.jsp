<%@ page import="com.example.model.Station" %>
<%@ page import="com.example.dao.StationDao" %>
<%@ page import="com.example.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp?error=Invalid credentials");
        return;
    }

    int stationId = Integer.parseInt(request.getParameter("stationId"));
    StationDao stationDao = new StationDao();
    Station station = stationDao.getStationById(stationId);
    if (station == null) {
        response.sendRedirect("searchResults.jsp?error=Station not found");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Slot</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Google Fonts for modern typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: url('images/background-image.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding-top: 60px; /* Adjust for fixed navbar */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .navbar {
            background-color: rgba(0, 123, 255, 0.8);
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
        }
        .navbar .nav-items a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px;
            transition: background-color 0.3s ease;
            margin-right:20px;
        }
        .navbar .nav-items a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }
        .booking-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            margin: 100px auto; /* Adjust margin to accommodate fixed navbar */
        }
        .booking-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .booking-container form {
            display: flex;
            flex-direction: column;
        }
        .booking-container form label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        .booking-container form input, .booking-container form select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .booking-container form button {
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .booking-container form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
    <div class="navbar">
        <h1><i class="fas fa-charging-station"></i> CPAEV</h1>
        <div class="nav-items">
            <a href="home.jsp">Home</a>
            <a href="adminLogin.jsp">Admin Mode</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="booking-container">
        <h2>Book Slot for <%= station.getName() %></h2>
        <p><strong>Station Area:</strong> <%= station.getAreaName() %></p>
        <form action="BookSlotServlet" method="post">
            <input type="hidden" name="stationId" value="<%= station.getId() %>">
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>
            
            <label for="time">Time:</label>
            <input type="time" id="time" name="time" required>
            
            <button type="submit">Request Booking</button>
        </form>
    </div>
</body>
</html>
