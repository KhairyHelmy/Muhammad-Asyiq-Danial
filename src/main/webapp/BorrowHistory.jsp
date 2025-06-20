<%-- 
    Document   : BorrowHistory
    Created on : 14 Jun 2025, 9:46:55 pm
    Author     : Asus
--%>

<%@page import="java.util.List"%>
<%@page import="com.Model.BorrowRecord"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Simulated login session
    session.setAttribute("userid", 3);
    session.setAttribute("username", "Hanis");

    int userId = (int) session.getAttribute("userid");
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Borrow History</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
            }
            
            .content{
                background-color: #003366;
                color: white;
            }
            
            .history-table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        .history-table th, .history-table td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        .history-table th {
            background-color: #003366;
            color: white;
        }

        select {
                width: 100%;
                padding: 10px;
                margin: 20px 0;
            }
            

        </style>
    </head>
    <body>
        <!-- Header and Navbar -->
        <div class="content">
            <h4 class="header" style="color: white" >Universiti Malaysia Terengganu Library</h4>
            <nav class="navbar navbar-expand-lg" style="font-size: 20px; background-color:#003366 !important;">
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
        
        <div class="container">
        <h2>Borrow & Return History</h2>
        <table class="history-table">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Return By</th>
                    <th>Return Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<BorrowRecord> records = (List<BorrowRecord>) request.getAttribute("borrowRecords");
                    if (records != null) {
                        for (BorrowRecord r : records) {
                            String status = (r.getReturnDate() != null) ? "Returned" : "Borrowed";
                %>
                    <tr>
                        <td><%= r.getBookid() %></td>
                        <td><%= r.getBookName() %></td>
                        <td><%= r.getReturnBy() %></td>
                        <td><%= (r.getReturnDate() != null) ? r.getReturnDate() : "-" %></td>
                        <td><%= r.getStatus() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="5">No records found.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
