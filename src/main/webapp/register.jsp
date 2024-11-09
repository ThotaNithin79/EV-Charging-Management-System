<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/background-image.jpg') center/cover no-repeat fixed;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 90%;
            max-width: 1200px;
            color: #fff; /* Text color for the whole container */
        }
        .content {
            flex: 1;
            padding: 50px;
            text-align: left;
            background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent background for content */
            border-radius: 10px;
            margin-right: 20px;
        }
        .content h2 {
            font-size: 2em;
            margin-bottom: 20px;
        }
        .content p {
            font-size: 1.1em;
            line-height: 1.6;
        }
        .register-form {
            flex: 1;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .register-form h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .register-form input[type="email"],
        .register-form input[type="password"] {
            width: 80%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ddd;
            border-radius: 25px;
            box-sizing: border-box;
            font-size: 14px;
            outline: none;
        }
        .register-form input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            cursor: pointer;
            width: 60%;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .register-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .register-form a {
            display: block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .register-form a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <h2>Welcome to Charging Point Availability for Electric Vehicles Project!</h2>
            <p>Register now to access our platform and find the best charging stations near you. Join us in promoting sustainable transportation solutions.</p>
        </div>
        <div class="register-form">
            <h2>Register</h2>
            <form id="registerForm" action="register" method="post">
                <input type="email" name="email" placeholder="Email" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                <input type="password" name="confirm_password" placeholder="Re-enter Password" required><br>
                <input type="submit" value="Register">
            </form>
            <a href="login.jsp">Already have an account? Login here</a>
        </div>
    </div>
    
    <script type="text/javascript">
        document.getElementById('registerForm').addEventListener('submit', function(event) {
            var password = document.querySelector('input[name="password"]').value;
            var confirmPassword = document.querySelector('input[name="confirm_password"]').value;

            if (password !== confirmPassword) {
                alert('Passwords do not match. Please re-enter.');
                event.preventDefault();
            }
        });

        window.onload = function() {
            <% if (session.getAttribute("registrationError") != null) { %>
                alert("Email address already registered. Please use a different email or login.");
                <% session.removeAttribute("registrationError"); %>
            <% } %>
        };
    </script>
</body>
</html>
