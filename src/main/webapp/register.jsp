<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration - UMT Library</title>
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

        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 5px;
            margin-bottom: 15px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #012a57;
        }

        .form-container .cancelbtn {
            background-color: #dc3545;
        }

        .form-container .cancelbtn:hover {
            background-color: #c82333;
        }

        .form-container .text-center a {
            text-decoration: none;
            color: #003366;
        }

        .footer {
            background-color: #003366;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        .footer img {
            margin: 0 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- Header and Navbar -->
<div class="content">
    <h4 class="text-center mb-0">Universiti Malaysia Terengganu Library</h4>
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

<!-- Registration Form -->
<h2 class="text-center mt-4">User Registration</h2>

<div class="form-container">
    <form action="register" method="post">

        <label for="username"><b>Full Name</b></label>
        <input type="text" placeholder="Enter Full Name" name="username" id="username" required>

        <label for="email"><b>Email</b></label>
        <input type="email" placeholder="Enter Email" name="email" id="email" required>

        <label for="phone"><b>Phone</b></label>
        <input type="text" placeholder="Enter Phone Number" name="phone" id="phone" required>

        <label for="address"><b>Address</b></label>
        <input type="text" placeholder="Enter Address" name="address" id="address" required>

        <label for="password"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" id="password" required>

        <button type="submit">Register</button>

        <button type="button" class="cancelbtn" onclick="window.location.href='login.jsp'">Back to Login</button>

    </form>
</div>

<!-- Footer -->
<div class="footer mt-5">
    <p>Connect With Us</p>
    <a href="https://www.facebook.com" target="_blank">
        <img src="facebook.png" alt="Facebook" width="50" height="50">
    </a>
    <a href="https://www.tiktok.com" target="_blank">
        <img src="Tiktok.png" alt="TikTok" width="50" height="50">
    </a>
    <hr style="border-color: white; width: 80%; margin: 15px auto;">
    <p>&copy; 3N 2025. All rights reserved.</p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
