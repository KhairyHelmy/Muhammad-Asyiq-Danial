<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            background-color: #f8f9fa;
        }

        .content {
            background-color: #003366;
            color: white;
            padding: 10px 0;
        }

        .navbar .nav-link {
            color: white !important;
        }

        .navbar .dropdown-menu a {
            color: black !important;
        }

        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 5px;
            margin-bottom: 15px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #012a57;
        }

        .login-container .cancelbtn {
            background-color: #dc3545;
        }

        .login-container .cancelbtn:hover {
            background-color: #c82333;
        }

        .login-container .links {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<!-- Header and Navbar -->
<div class="content">
    <h4 class="header">Universiti Malaysia Terengganu Library</h4>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">
                <img src="logo2.png" alt="Logo" width="120" height="96">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse rounded" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="Homepage1.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="AboutUs.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact Us</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Collection</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="book listing.html">Our Collection</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                    <a href="book listing.html" class="btn btn-light me-2">Search</a>
                    <a href="login.html" class="btn btn-light me-2">Login</a>
                </form>
            </div>
        </div>
    </nav>
</div>

<!-- Login Form -->
<h2 class="text-center mt-4">User Login</h2>

<div class="login-container">
    <form action="LoginServlet" method="post">
        <label for="uname"><b>User ID</b></label>
        <input id="uname" type="text" placeholder="Enter User ID" name="uname" required>

        <label for="psw"><b>Password</b></label>
        <input id="psw" type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit">Login</button>

        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" checked="checked" name="remember" id="rememberMe">
            <label class="form-check-label" for="rememberMe"> Remember me </label>
        </div>

        <button type="button" class="cancelbtn" onclick="window.location.href = 'index.html'">Cancel</button>

        <div class="links mt-3">
            <span>New user? <a href="register.jsp">Register here</a></span><br>
            <span>I'm staff, <a href="stafflogin.jsp">login here</a></span>
        </div>

        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger mt-3">
                <%= request.getParameter("error") %>
            </div>
        <% } %>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
