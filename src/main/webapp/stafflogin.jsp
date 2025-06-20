<%-- 
    Document   : stafflogin
    Created on : 11 Jun 2025, 11:00:05 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login - UMT Library</title>
  <style>
    body {font-family: Arial, Helvetica, sans-serif;}

    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #4359ea;
      box-sizing: border-box;
    }

    button {
      background-color: #04AA6D;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
    }

    button:hover {
      opacity: 0.8;
    }

    .cancelbtn {
      width: auto;
      padding: 10px 18px;
      background-color: #f44336;
    }

    .container {
      padding: 16px;
    }

    span.psw {
      float: right;
      padding-top: 16px;
    }

    .close:hover, .close:focus {
      color: red;
      cursor: pointer;
    }

    @media screen and (max-width: 300px) {
      span.psw {
        display: block;
        float: none;
      }
      .cancelbtn {
        width: 100%;
      }
    }
  </style>

  <link rel="stylesheet" href="mainpage.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>
  <div class="content white-text" style="background-color: #003166;">
    <h4 class="header">Universiti Malaysia Terengganu Library</h4>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="font-size: 20px;background-color:#003166 !important;">
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

  <h2 class="text-center mt-4">Staff Login</h2>

  <div class="container col-md-4 mx-auto border rounded shadow-sm p-4 mt-4">
    <form action="StaffLoginServlet" method="post">
      <label for="uname"><b>StaffID</b></label>
      <input type="text" placeholder="Enter UserID" name="uname" required>
      
      <label for="name"><b>Staff Name</b></label>
      <input type="text" placeholder="Enter Staff Name" name="name" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>

      <button type="submit">Login</button>
      

      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>

      <div class="mt-3">
        <button type="button" class="cancelbtn" onclick="window.location.href='index.jsp'">Cancel</button>
        
      </div>
    </form>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

