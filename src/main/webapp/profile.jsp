<%@ page import="com.Model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-card {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .profile-card h2 {
            margin-bottom: 20px;
        }
        .profile-card ul {
            list-style: none;
            padding: 0;
        }
        .profile-card ul li {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("users");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<body>
    <!-- Header -->
    <div class="content white-text" style="background-color: #003166;">
        <h4 class="header">Universiti Malaysia Terengganu Library</h4>
        <nav class="navbar navbar-expand-lg" style="font-size: 20px; background-color: #003166 !important;">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <img src="logo2.png" alt="Logo" width="120" height="96" class="d-inline-block align-text-middle">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse rounded" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active white-text" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link white-text" href="aboutus.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link white-text" href="contactus.jsp">Contact Us</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle white-text" href="#" role="button" data-bs-toggle="dropdown">Collection</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="booklisting.jsp">Our Collection</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search...">
                        <a href="booklisting.jsp" class="btn border me-2 white-text" style="background-color: #012a57;">Search</a>
                        <a href="login.jsp" class="btn border me-2 white-text" style="background-color: #012a57;">Login</a>
                    </form>
                </div>
            </div>
        </nav>
    </div>

<div class="container">
    <div class="profile-card text-center">
        <h2>Welcome, <%= user.getUsername() %></h2>
        <ul class="text-start">
            <li><strong>User ID:</strong> <%= user.getUserid() %></li>
            <li><strong>Username:</strong> <%= user.getUsername() %></li>
            <li><strong>Email:</strong> <%= user.getEmail() %></li>
            <li><strong>Phone Number:</strong> <%= user.getPhone() %></li>
            <li><strong>Address:</strong> <%= user.getAddress() %></li>
        </ul>
        <a class="btn btn-danger mt-4" href="LogoutServlet"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
