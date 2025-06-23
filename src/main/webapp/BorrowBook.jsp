<%-- 
    Document   : BorrowBook
    Created on : 12 Jun 2025, 2:39:06 am
    Author     : Asus
--%>

<%@page import="com.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrow Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
        }

        .content {
            background-color: #003166;
            color: white;
        }

        .form-container {
            margin: 50px auto;
            width: 50%;
            text-align: center;
        }

        .btn-submit {
            background-color: #012a57;
            color: white;
        }

        .btn-submit:hover {
            background-color: #01458a;
        }

        select {
            width: 100%;
            padding: 10px;
            margin: 20px 0;
        }

        body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
            }

            html {
                box-sizing: border-box;
            }

            *, *:before, *:after {
                box-sizing: inherit;
            }

            .column {
                float: left;
                width: 33.3%;
                margin-bottom: 16px;
                padding: 0 8px;
            }

            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                margin: 8px;
            }

            .about-section {
                padding: 10px;
                text-align: center;
                background-color: #474e5d;
                color: white;
            }

            .container {
                padding: 0 16px;
                text-align: center;
            }

            .container::after, .row::after {
                content: "";
                clear: both;
                display: table;
            }

            .title {
                color: grey;
            }

            .button {
                border: none;
                outline: 0;
                display: inline-block;
                padding: 8px;
                color: white;
                background-color: #000;
                text-align: center;
                cursor: pointer;
                width: 100%;
            }

            .button:hover {
                background-color: #555;
            }

            @media screen and (max-width: 650px) {
                .column {
                    width: 100%;
                    display: block;
                }
            }
    </style>
</head>
<body>

<!-- Header and Navbar -->
<div class="content white-text">
    <h4 class="header" style="color: white;">Universiti Malaysia Terengganu Library</h4>
    <nav class="navbar navbar-expand-lg" style="font-size: 20px; background-color:#003166 !important;">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">
                <img src="logo2.png" alt="Logo" width="120" height="96">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse rounded" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" style="color:white" href="Homepage1.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" style="color:white" href="AboutUs.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" style="color:white" href="ContactUs.jsp">Contact Us</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="color:white" href="#" role="button" data-bs-toggle="dropdown">Collection</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="book listing.html">Our Collection</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                    <a href="book listing.html" class="btn border me-2" style="background-color: #012a57; color:white">Search</a>
                    <a href="login.html" class="btn border me-2" style="background-color: #012a57; color:white">Login</a>
                </form>
            </div>
        </div>
    </nav>
</div>

<!-- Book Dropdown -->
<div class="form-container">
    <h2>Select a Book to Borrow</h2>
    <form action="BorrowConfirmation.jsp" method="post">
        <label for="bookid">Choose Book:</label>
        <select name="bookid" id="bookid" required>
            <option value="" disabled selected>-- Select Book --</option>
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    conn = DBConnection.getConnection();
                    String query = "SELECT bookid, bookName FROM book WHERE status = 'available'";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        int bookid = rs.getInt("bookid");
                        String bookName = rs.getString("bookName");
            %>
            <option value="<%= bookid %>"><%= bookName %></option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option disabled>Error loading books</option>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
        </select>
        <button type="submit" class="btn btn-submit">Select</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
