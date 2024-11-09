<%@ page import="com.example.model.User" %>
<%
    User user = (User)session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Station</title>
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
        .form-container input[type="email"],
        .form-container input[type="password"],
        .form-container input[type="number"],
        .form-container input[type="submit"] {
            width: 48%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .form-container input[type="submit"]:hover {
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
            <a href="adminLogin.jsp">Back</a>
        </div>
    </div>
    <div class="container">
        <div class="content">
            <h2>About Station Registration</h2>
            <p>
                Welcome to the CPAEV charging stations platform. Here you can register new charging stations to our network.
                Our project aims to promote sustainable transportation solutions by making it easy to find and register charging stations.
            </p>
            <ul>
                <li>Easy registration process</li>
                <li>Wide network coverage</li>
                <li>Real-time updates on station availability</li>
            </ul>
        </div>
        <div class="form-container">
            <h2>Register Station</h2>
            <form action="registerStation" method="post">
                <input type="number" name="id" placeholder="Station ID" required>
                <input type="text" name="name" placeholder="Station Name" required>
                <input type="email" name="email" placeholder="Email" value="<%= user.getEmail() %>" required readonly>
                <input type="password" name="password" placeholder="Password" value="<%= user.getPassword() %>" required readonly>
                <input type="number" name="stands" placeholder="Number of Stands" required>
                <input type="number" step="0.5" name="price" placeholder="Price" required>
                <input type="text" name="areaName" placeholder="Area Name" required>
                <input type="text" name="alt1" placeholder="Alternate Area 1">
                <input type="text" name="alt2" placeholder="Alternate Area 2">
                <input type="text" name="alt3" placeholder="Alternate Area 3">
                <input type="text" name="alt4" placeholder="Alternate Area 4">
                <input type="submit" value="Register">
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
		 // Check if the URL has an error parameter
		    const urlParams = new URLSearchParams(window.location.search);
		    const error = urlParams.get('error');
		    
		    // Display alert message if error parameter is present
		    if (error) {
		        alert(error);
		        // Remove the error parameter from the URL to prevent re-display on refresh
		        history.replaceState({}, document.title, window.location.pathname);
		    }
    
    </script>
</body>
</html>
<%
    }
%>
