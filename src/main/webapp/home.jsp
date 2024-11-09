<%@ page import="com.example.model.User" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Google Fonts for modern typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        /* Global styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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
            text-decoration: none;
            font-size: 18px;
            padding: 10px;
            margin-right: 20px;
            transition: background-color 0.3s ease;
        }

        .navbar .nav-items a:hover {
            background-color: #0056b3;
            border-radius: 5px;
        }

        /* Container and main content styles remain the same */
        .container {
            width: 100%;
            max-width: 1200px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin-top: 60px; /* Adjust for fixed navbar height */
        }

        /* Adjusted main content */
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .main-content h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .description {
            margin-bottom: 20px;
        }

        .description p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .description ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        .search-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .search-container input[type="text"],
        .search-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            outline: none;
        }

        .search-container input[type="submit"] {
            width: 20%;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1><i class="fas fa-charging-station"></i> CPAEV</h1>
        <div class="nav-items">
            <a href="home.jsp">Home</a>
            <a href="adminLogin.jsp">Admin Mode</a>
            <a href="bookingDetails">Booking Details</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="main-content">
            <h2>Welcome, <%= user.getEmail() %></h2>
            <div class="description">
                <p>Welcome to the CPAEV charging stations platform. Here you can:</p>
                <ul>
                    <li>Search for available charging stations in your area</li>
                    <li>View details about the stations, including price and available stands</li>
                </ul>
            </div>
            <div class="search-container">
                <form action="search" method="post">
                    <input type="text" name="area" placeholder="Enter Area Name" required><br>
                    <input type="submit" value="Search">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
