<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Station" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    } else {
        Station station = (Station) request.getAttribute("station");
        if (station == null) {
            response.sendRedirect("login.jsp");
        }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Google Fonts for modern typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding-top: 60px; /* Adjust for fixed navbar height */
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            overflow: hidden;
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
        .main-content {
            width: 100%;
            max-width: 1200px;
            padding: 20px;
            box-sizing: border-box;
        }
        .main-content h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .station-details {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .station-details .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px 40px;
        }
        .station-details .details-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
        }
        .station-details .details-item .label {
            text-align: left;
            color: #007BFF;
            font-weight: bold;
        }
        .station-details .details-item .value {
            text-align: right;
            color: #333;
        }
        .station-details .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .station-details a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        .station-details a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .btn-edit, .btn-delete {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
            display: inline-block;
        }
        .btn-edit {
            background-color: #28a745;
        }
        .btn-edit:hover {
            background-color: #218838;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        @media (max-width: 768px) {
            .station-details .details-grid {
                grid-template-columns: 1fr;
            }
            .station-details .details-item {
                flex-direction: column;
                align-items: flex-start;
            }
            .station-details .details-item .value {
                text-align: left;
            }
            .btn-container {
                flex-direction: column;
                align-items: center;
            }
            .btn-edit, .btn-delete {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1><i class="fas fa-charging-station"></i> CPAEV</h1>
        <div class="nav-items">
            <a href="home.jsp">Home</a>
            <a href="logout">Logout</a>
            <a href="adminLogin.jsp">Back</a>
        </div>
    </div>
    <div class="main-content">
        <h2>Station Details</h2>
        <div class="station-details">
            <div class="details-grid">
                <div class="details-item">
                    <span class="label">Station ID</span>
                    <span class="value">${station.id}</span>
                </div>
                <div class="details-item">
                    <span class="label">Name</span>
                    <span class="value">${station.name}</span>
                </div>
                <div class="details-item">
                    <span class="label">Email</span>
                    <span class="value">${user.email}</span>
                </div>
                <div class="details-item">
                    <span class="label">Price</span>
                    <span class="value">${station.price}</span>
                </div>
                <div class="details-item">
                    <span class="label">Available Stands</span>
                    <span class="value">${station.stands}</span>
                </div>
                <div class="details-item">
                    <span class="label">Area Name</span>
                    <span class="value">${station.areaName}</span>
                </div>
                <div class="details-item">
                    <span class="label">Alternate Area 1</span>
                    <span class="value">${station.alt1}</span>
                </div>
                <div class="details-item">
                    <span class="label">Alternate Area 2</span>
                    <span class="value">${station.alt2}</span>
                </div>
                <div class="details-item">
                    <span class="label">Alternate Area 3</span>
                    <span class="value">${station.alt3}</span>
                </div>
                <div class="details-item">
                    <span class="label">Alternate Area 4</span>
                    <span class="value">${station.alt4}</span>
                </div>
            </div>
            <div class="btn-container">
                <a href="editStation.jsp?stationId=${station.id}" class="btn-edit"><i class="fas fa-edit"></i> Edit</a>
                <a href="deleteStation?stationId=${station.id}" class="btn-delete" onclick="return confirm('Are you sure?')"><i class="fas fa-trash-alt"></i> Delete</a>
            </div>
        </div>
    </div>
</body>
</html>
<%
    }
%>
