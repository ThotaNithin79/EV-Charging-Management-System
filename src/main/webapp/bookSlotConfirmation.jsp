<%@ page import="java.util.List" %>
<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Station" %>

<%
    // Fetch the message from request parameters
    String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: white; /* Text color for better readability on the background */
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
        .confirmation-container {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            margin-top: 100px; /* Adjust margin for fixed navbar */
            text-align: center;
            color: black; /* Text color for the content */
        }
        .confirmation-container h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .confirmation-container p {
            color: #555;
            margin-bottom: 30px;
        }
        .confirmation-container a {
            display: inline-block;
            padding: 10px 15px;
            margin: 5px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .confirmation-container a:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        // Display alert message on page load
        window.onload = function() {
            var message = "<%= message %>";
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body>
    <!-- Navigation bar -->
    <div class="navbar">
        <h1><i class="fas fa-charging-station"></i> CPAEV</h1>
        <div class="nav-items">
        	<a href="home.jsp">Home</a>
            <a href="bookingDetails">Booking Details</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="confirmation-container">
        <h2>Booking Confirmation</h2>
        <p>Your slot booking request has been received. Please wait for approval.</p>
        <p>Click on Booking Details to check your booking status regularly.</p>
       	<a href="bookingDetails">Booking Details</a>
        
    </div>
</body>
</html>
