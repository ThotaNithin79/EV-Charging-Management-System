<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Station" %>
<%@ page import="com.example.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        session.removeAttribute("user");
        response.sendRedirect("login.jsp?error=Invalid credentials");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
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
            background-position: center center;
            margin: 0;
            padding-top: 60px; /* Adjust for fixed navbar */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .navbar {
            background-color: #007BFF;
            color: white;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center; /* Align items vertically */
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
            margin-right: 20px;
            text-decoration: none;
            font-size: 18px;
            padding: 10px;
            transition: background-color 0.3s ease;
        }
        .navbar .nav-items a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }
        .results-container {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 1200px;
        }
        .results-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
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
        .no-results {
            text-align: center;
            color: #999;
            margin-top: 20px;
        }
        .book-slot-btn {
            background-color: #28a745;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .book-slot-btn:hover {
            background-color: #218838;
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

    <div class="results-container">
        <h2>Search Results</h2>
        <%
            List<Station> stations = (List<Station>) request.getAttribute("stations");
            if (stations != null && !stations.isEmpty()) {
        %>
                <table>
                    <thead>
                        <tr>
                            <th>Station Name</th>
                            <th>Area Name</th>
                            <th>Price</th>
                            <th>Number of Available Stands</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
        <%
                for (Station station : stations) {
        %>
                        <tr>
                            <td><%= station.getName() %></td>
                            <td><%= station.getAreaName() %></td>
                            <td>&#8377;<%= station.getPrice() %></td>
                            <td><%= station.getStands() %></td>
                            <td><a href="bookSlot.jsp?stationId=<%= station.getId() %>" class="book-slot-btn">Book Slot</a></td>
                        </tr>
        <%
                }
        %>
                    </tbody>
                </table>
        <%
            } else {
        %>
                <p class="no-results">No stations found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
