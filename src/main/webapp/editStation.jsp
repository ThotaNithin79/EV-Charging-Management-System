<%@ page import="com.example.model.Station" %>
<%@ page import="com.example.dao.StationDao" %>
<%@ page import="com.example.dao.UserDao" %>
<%@ page import="com.example.model.User" %>
<%
    int stationId = Integer.parseInt(request.getParameter("stationId"));    
    Station station = new StationDao().getStationById(stationId);
    User user = (User)session.getAttribute("user");
    int userId = new UserDao().getUserId(user.getEmail(), user.getPassword());
    
    if(userId != station.getUserId()){
        session.removeAttribute("user");
        response.sendRedirect("login.jsp?error=Invalid Credentials");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Station</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding-top: 60px; /* Adjust for fixed navbar height */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .navbar {
            background-color: #007BFF;
            color: white;
            width: 100%;
            height: 60px;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }
        .nav-items {
            display: flex;
            gap: 20px;
        }
        .nav-items a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
            margin-right:20px;
        }
        .nav-items a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }
        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
            max-width: 1200px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .content {
            flex: 1;
            padding: 30px;
            background-color: #007BFF;
            color: white;
            text-align: left;
        }
        .form-container {
            flex: 1;
            padding: 30px;
            text-align: center;
        }
        .form-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .form-container form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container button[type="submit"] {
            width: 48%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .form-container button[type="submit"] {
            width: 100%;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .form-container button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1><i class="fas fa-charging-station"></i> CPAEV</h1>
        <div class="nav-items">
            <a href="home.jsp">Home</a>
            <a href="logout">Logout</a>
            <a href="adminLogin.jsp">Admin Mode</a>
        </div>
    </div>
    <div class="container">
        <div class="content">
            <h2>About Editing Stations</h2>
            <p>
                Use this form to update the details of your charging station. Make sure to fill out all the required fields and click on "Update" to save your changes.
            </p>
            <ul>
                <li>Ensure accuracy of the data</li>
                <li>Keep station information up-to-date</li>
                <li>Contact support if you encounter any issues</li>
            </ul>
        </div>
        <div class="form-container">
            <h2><i class="fas fa-edit"></i> Edit Station</h2>
            <form action="editStation" method="post">
                <input type="hidden" name="id" value="<%= station.getId() %>">
                <input type="text" name="name" placeholder="Station Name" value="<%= station.getName() %>" required>
                <input type="text" name="areaName" placeholder="Area Name" value="<%= station.getAreaName() %>" required>
                <input type="number" name="price" step="0.01" placeholder="Price" value="<%= station.getPrice() %>" required>
                <input type="number" name="stands" placeholder="Number of Stands" value="<%= station.getStands() %>" required>
                <input type="text" name="alt1" placeholder="Alternate Area 1" value="<%= station.getAlt1() %>">
                <input type="text" name="alt2" placeholder="Alternate Area 2" value="<%= station.getAlt2() %>">
                <input type="text" name="alt3" placeholder="Alternate Area 3" value="<%= station.getAlt3() %>">
                <input type="text" name="alt4" placeholder="Alternate Area 4" value="<%= station.getAlt4() %>">
                <button type="submit"><i class="fas fa-save"></i> Update</button>
            </form>
        </div>
    </div>
</body>
</html>
