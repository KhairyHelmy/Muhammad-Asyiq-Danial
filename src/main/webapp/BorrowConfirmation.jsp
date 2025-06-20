<%-- 
    Document   : BorrowConfirmation
    Created on : 13 Jun 2025, 12:58:30 am
    Author     : Asus
--%>

<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Sample user session info (simulate login)
    session.setAttribute("userid", 3);
    session.setAttribute("username", "Hanis");

    int userid = (int) session.getAttribute("userid");
    String username = (String) session.getAttribute("username");

    String bookidParam = request.getParameter("bookid");
    int bookid = bookidParam != null ? Integer.parseInt(bookidParam) : 0;

    String bookName = "";
    String synopsis = "";

    if (bookid > 0) {
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT bookName, synopsis FROM book WHERE bookid = ?");
            ps.setInt(1, bookid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bookName = rs.getString("bookName");
                synopsis = rs.getString("synopsis");
            }
        } catch (Exception e) {
            out.println("<p>Error fetching book data</p>");
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Borrow Confirmation</title>
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
                text-align: left;
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

        </style>
    </head>
    <body>

        <% String msg = (String) request.getAttribute("message"); %>

        <% if (msg != null) {%>
        <div class="alert alert-success alert-dismissible fade show text-center w-100 mb-0 rounded-0"
             role="alert"
             style="
            position: absolute;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            z-index: 9999;
            opacity: 0.95;
         ">
            ✅ <%= msg%>
            <button type="button" class="btn-close" aria-label="Close"
                    onclick="window.location.href = 'BorrowBook.jsp'"></button>
        </div>
        <% } %>


        <% if (msg != null && msg.contains("successfully")) { %>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelector("button[type='submit']").disabled = true;
            });
        </script>
        <% }%>


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
        <div class="container mt-5">
            <h2>Borrow Confirmation</h2>
            <form action="BorrowBookServlet" method="post">
                <table class="table table-bordered">
                    <tr><th>User ID</th><td><%= userid%></td></tr>
                    <tr><th>Username</th><td><%= username%></td></tr>
                    <tr><th>Book ID</th><td><%= bookid%></td></tr>
                    <tr><th>Book Name</th><td><%= bookName%></td></tr>
                    <tr><th>Synopsis</th><td><%= synopsis%></td></tr>
                </table>

                <!-- Hidden fields to pass values to servlet -->
                <input type="hidden" name="userid" value="<%= userid%>">
                <input type="hidden" name="bookid" value="<%= bookid%>">

                <div class="mb-3">
                    <label for="borrowDate" class="form-label">Select Borrow Date:</label>
                    <input type="date" class="form-control" id="borrowDate" name="borrowDate"
                           onchange="setReturnBy()"
                           min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" required>
                </div>

                <div class="mb-3">
                    <label for="returnBy" class="form-label">Return By:</label>
                    <input type="text" class="form-control" id="returnBy" name="returnBy" readonly>
                </div>
                <p id="debugOutput" class="text-muted"></p>

                <button type="submit" class="btn btn-success">Confirm Borrow</button>
            </form>
        </div>

        <script>
            function setReturnBy() {
                const borrowInput = document.getElementById("borrowDate");
                const returnInput = document.getElementById("returnBy");

                const borrowDateValue = borrowInput.value;
                console.log("Selected Borrow Date:", borrowDateValue);

                if (borrowDateValue) {
                    const borrowDate = new Date(borrowDateValue);
                    console.log("Parsed Date:", borrowDate);

                    // Add 14 days
                    borrowDate.setDate(borrowDate.getDate() + 14);
                    console.log("Return By (raw):", borrowDate);

                    // Format date as dd/mm/yy
                    const dd = String(borrowDate.getDate()).padStart(2, '0');
                    const mm = String(borrowDate.getMonth() + 1).padStart(2, '0');
                    const yy = borrowDate.getFullYear().toString().slice(-2);

                    const formatted = dd + "/" + mm + "/20" + yy;
                    console.log("Formatted Return By:", formatted);

                    returnInput.value = formatted;
                } else {
                    returnInput.value = "";
                }
            }

            function handleBorrowSubmit() {
                const borrowDate = document.getElementById("borrowDate").value;
                const returnBy = document.getElementById("returnBy").value;

                if (!borrowDate || !returnBy) {
                    alert("Please select a valid borrow date first.");
                    return false;
                }

                alert("✅ Borrow successful!\n\nBorrow Date: " + borrowDate + "\nReturn By: " + returnBy);
                return false; // Prevents actual form submission for now
            }
        </script>
    </div>
</body>
</html>

