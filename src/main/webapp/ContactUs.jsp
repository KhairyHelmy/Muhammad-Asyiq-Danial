<%-- 
    Document   : ContactUs
    Created on : 11 Jun 2025, 11:33:17 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <title>JSP Page</title>

        <style>
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
        <div class="content white-text" style="background-color: #003166;"> <!-- Navigation-->

            <h4 class="header" style="color : white">Universiti Malaysia Terengganu Library</h4>
            <nav class="navbar navbar-expand-lg bg-body-tertiary" style="font-size: 20px;
                 background-color:#003166 ! important;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html" >
                        <img src="logo2.png" alt="Logo" width="120" height="96" class="d-inline-block align-text-middle">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse rounded"  id="navbarSupportedContent" >
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 " >
                            <li class="nav-item">
                                <a class="nav-link active white-text" aria-current="page" style="color:white" href="Homepage1.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link white-text " style="color:white" href="AboutUs.jsp" >About Us</a>
                            </li>
                            <li>
                                <a class="nav-link white-text " style="color:white" href="ContactUs.jsp" >Contact Us</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle white-text" href="#" role="button" 
                                   data-bs-toggle="dropdown" style="color:white" aria-expanded="false">Collection</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" style="color:white" href="book listing.html">Our Collection</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex" role="search" >
                            <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                            <a href="book listing.html" class="btn border me-2 white-text" style="background-color: #012a57; color:white">Search</a>
                            <a href="login.html" class="btn border me-2 white-text" style="background-color: #012a57; color:white">Login</a>
                        </form>

                    </div>
                </div>

            </nav>
        </div> <!--End Navigation Div-->
        <div class="about-section">
            <h1>Contact Us Page</h1>
        </div>

    </body>
</html>

<div class="card">

    <div class="container">
        <h3>Perpustakaan Sultanah Nur Zahirah<p>Universiti Malaysia Terengganu<p>
                Mengabang Telipot<p>
                21030 Kuala Nerus<p>
                Terengganu Darul Iman</h2>
            <p>Tel : 09-6684264 (Adminstrative Office)</p>
            <p>Tel : 09-6684185 (User and Information Services Division)</p>
            <p>Fax : 09-6684179<p>
            <p>psnz@umt.edu.my</p>

            <img src="PSNZ.jpg" alt="" style="width:10%">
            <p><a href="mailto:psnz@umt.edu.my"><button class="button">Contact</button></a></p>
    </div>
</div>
</div>

<div class="end white-text"> <!--End Page-->
    <!-- <h4>Connect With Us</h4>
    <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
    <a href="#" target="_blank"><i class="fab fa-twitter"></i></a> -->
    <div class="endcontainer">
        <p>Connect With Us</p>
        <a href="https://www.facebook.com">
            <img src="facebook.png" alt="Your Image" width="50" height="50">
        </a>
        <a href="https://www.tiktok.com">
            <img src="Tiktok.png" alt="Your Image" width="50" height="50">
        </a>
        <hr>
    </div>
    <div class="copyright">
        <p>&copy; 3N 2025. All rights reserved.</p>
    </div>
</div> <!--End Page's End-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 

</body>
</html> 
