<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/background-image.jpg') center/cover no-repeat fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.7);
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 90%;
            max-width: 1200px;
            z-index: 1;
            position: relative;
        }
        .content {
            flex: 1;
            padding: 50px;
            color: #fff;
            text-align: center;
        }
        .content h1 {
            font-size: 3em;
            margin-bottom: 20px;
        }
        .content p {
            font-size: 1.2em;
            line-height: 1.6;
        }
        .login-form {
            flex: 1;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        .login-form h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .login-form input[type="email"],
        .login-form input[type="password"] {
            width: 80%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 25px;
            box-sizing: border-box;
            font-size: 1em;
            outline: none;
        }
        .login-form input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 25px;
            cursor: pointer;
            width: 40%;
            font-size: 1.2em;
            transition: background-color 0.3s ease;
        }
        .login-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .login-form a {
            display: block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .login-form a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <div class="content">
            <h1>Welcome to Charging Point Availability for Electric Vehicles Project!</h1>
            <p>Discover the best charging stations near you. Log in now to manage your account or register to get started!</p>
        </div>
        <div class="login-form">
            <h2>Login</h2>
            <form action="login" method="post">
                <input type="email" name="email" placeholder="Email" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                <input class="submit-button" type="submit" value="Login">
            </form>
            <a href="register.jsp">Register</a>
        </div>
    </div>

    <script>
        // Check if the URL has an error parameter
        const urlParams = new URLSearchParams(window.location.search);
        const error = urlParams.get('error');
        
        // Display alert message if error parameter is present
        if (error) {
            alert(error);
            // Remove the error parameter from the URL to prevent re-display on refresh
            history.replaceState({}, document.title, window.location.pathname);
        }

        window.onload = function() {
            <% if (session.getAttribute("registrationAlert") != null) { %>
                alert("Registration Successful. Please login to access...");
                <% session.removeAttribute("registrationAlert"); %>
            <% } %>
        };
    </script>
</body>
</html>
