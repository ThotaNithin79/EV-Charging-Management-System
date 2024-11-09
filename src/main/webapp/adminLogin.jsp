<%@ page import="com.example.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
    else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
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
            padding-top: 60px; /* Adjust for fixed navbar height */
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin-top: 20px; /* Adjust spacing from top */
        }

        /* Navbar styles from adminHome.jsp */
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
        
        .nav-items .myStations {
          background-color: #007BFF;
          border:none;
          color: white;
          text-decoration: none;
          font-size: 18px;
          padding: 10px 20px;
          transition: background-color 0.3s ease;
          margin-right:20px;
          cursor:pointer;
        }
        
        .nav-items .myStations:hover {
        	background-color: #0056b3;
            border-radius: 5px;
        }

        /* Left side content */
        .left-side {
            flex: 1;
            background-color: #007BFF;
            color: white;
            padding: 40px;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .left-side h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .left-side p {
            font-size: 16px;
            line-height: 1.6;
        }

        /* Login box styles */
        .login-box {
            flex: 1;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin-left: 20px; /* Add some space between navbar and main content */
        }

        .login-box h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .login-box form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-box input[type="text"],
        .login-box input[type="email"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: none;
            border-bottom: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .login-box input[type="text"]:focus,
        .login-box input[type="email"]:focus,
        .login-box input[type="password"]:focus {
            border-color: #007BFF;
        }

        .login-box input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            padding: 15px 20px;
            border-radius: 5px;
            width: 100%;
            font-size: 18px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .login-box input[type="submit"]:hover {
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
    	<form action="myStations" method="get">
    		<input class= "myStations" type="submit" value="My Stations" >
    	</form>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="container">
    <div class="left-side">
        <h2>Welcome to Admin Login</h2>
        <p>This page allows administrators to access the CPAEV admin dashboard.</p>
        <p>The CPAEV project aims to provide an efficient charging station management system, promoting sustainable transportation solutions.</p>
    </div>
    <div class="login-box">
        <h2>Admin Login</h2>
        <form name="loginForm" action="admin" method="post" onsubmit="return validateForm()">
            <input type="text" name="stationId" placeholder="Station ID" required><br>
            <input type="email" name="email" placeholder="Email" value="<%= user.getEmail() %>" required readonly><br>
            <input type="password" name="password" placeholder="Password" value="<%= user.getPassword() %>" required readonly><br>
            <input type="submit" value="Login">
        </form>
        <a href="registerStation.jsp">Register New Station</a>
    </div>
</div>

<script type="text/javascript">
	
	//Check if the URL has an error parameter
	const urlParams = new URLSearchParams(window.location.search);
	const message = urlParams.get('message');
		
		// Display alert message if message parameter is present
		if (message) {
		    alert("Station Registered Successfully!");
		    // Remove the error parameter from the URL to prevent re-display on refresh
		    history.replaceState({}, document.title, window.location.pathname);
		}
		
	const existsError = urlParams.get('existsError');
		
		// Display alert message if error parameter is present
		if (existsError) {
		    alert("Station ID is already exists the application Please login or register with differenct Station ID !");
		    // Remove the error parameter from the URL to prevent re-display on refresh
		    history.replaceState({}, document.title, window.location.pathname);
		}
		
	const error = urlParams.get('error');
	
	// Display alert message if error parameter is present
	if (error) {
	    alert("Invalid Station ID / Unauthorized access ");
	    // Remove the error parameter from the URL to prevent re-display on refresh
	    history.replaceState({}, document.title, window.location.pathname);
	}
    
    function validateForm() {
        var stationId = document.forms["loginForm"]["stationId"].value;

        // Check if stationId is not empty
        if (stationId.trim() === "") {
            alert("Station ID must be filled out");
            return false;
        }

        // Check if stationId is a valid integer
        if (!Number.isInteger(Number(stationId))) {
            alert("Station ID must be a valid integer");
            return false;
        }

        // Check if stationId is within the range of int data type
        if (Number(stationId) < -2147483648 || Number(stationId) > 2147483647) {
            alert("Station ID must be within integer range");
            return false;
        }

        // If all validations pass, return true
        return true;
    }
</script>

</body>
</html>
<%
    }
%>
