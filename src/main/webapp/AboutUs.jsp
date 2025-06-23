<%-- 
    Document   : AboutUs
    Created on : 11 Jun 2025, 10:42:40 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="aboutus.css">
        <link rel="stylesheet" href="mainpage.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.19.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
            .body {
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
                p.round1 {
                    border: 2px solid black;
                    border-radius: 5px;
                    padding: 5px;
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

                @media_screen_and_(max-width: 650px) {
                    .column {
                        width: 100%;
                        display: block;
                    }
               
            </style>
        </head>
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
            <h1>About Us Page</h1>
            <div class="card">
                <div class="container">
                    <img src="history.png" alt="Logo" width="300" height="300" class="d-inline-block align-text-middle">
                    <h2><p class="round1">The History of University Malaysia Terengganu (UMT) library started with the establishment of UPM Fisheries and Maritime Science Centre (Pusat Perikanan dan Sains Samudera UPM) in May 1979. The library was manned by two library clerks. At that time, the library was just a small room in the Administration Unit. The area was 40 feet x 30 feet with 28 chairs.
                        </p></h2>
                </div>
            </div>


            In 1981, the staffs increased to 5 staffs : 1 Library Clerk, 2 Library Checkers and 2 Library Attendants. The library began to operate at night in January 1982.</p></h2>


    <p class="round1">The library has changed its location 4 times. The first move was on December 1984, from the Administration building to the Net loft building. Second moved was on June 14th, 1986 from the Net loaf building to the Hostel A building, and the third was on November 28th, 1988 from the Hostel a building to its own building, and has been used till 31 July 2004. On January 1987, the library’s staff increased to 6 persons. They were 2 Library Assistants, 
        2 Library Checkers and 2 Library Attendants
    </p>
    <p class="round1">A librarian from UPM Serdang has joins the library in 1996.

        On 5th May 1999, UPM Terengganu (UPMT) ceased to exist and replaced Kolej Universiti Terengganu (KUT). KUT attained its autonomy as a university college on 1st May 2001. KUT was officially renamed as Kolej Universiti Sains dan Teknologi Malaysia (KUSTEM) on 1st July 2001.</p>

    <div class="card">
        <div class="container">
            <h4> Mission </h4>
            <h6>To provide services and facilities to customers by offering information services, library resources supported through the use of the latest technology to support learning, teaching, consulting and research in the field of Science, Technology and Natural Resource Management.</h6>
            <h4> Vision </h4>
            <h6>Library as a knowledge reference center.</h6>
            <h4> Objectives </h4>
            <li>To provide efficient services, effective, up-to-date and user friendly to the campus community and society in general.</li>
            <li>To optimize usage of various information resources and facilities.</li>
            <li>To upgrade staff expertise (knowledge workers).</li>
            <li>To improve the distribution of cost effectiveness.</li>
            <li>To strengthen user education program towards lifelong learning.</li>
            <li>To develop, document, maintain and strengthen teaching and research resources of all disciplines either in print, multimedia and electronic format.</li>
            <li>To uphold knowledge and intellectual property of university community in turning the library as a resource and knowledge heritage.</li>
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
