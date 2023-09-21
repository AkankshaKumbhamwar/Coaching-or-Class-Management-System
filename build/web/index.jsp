<%
//    HttpSession session = request.getSession(false);   
session.setAttribute("loggedInUser", null);
session.invalidate();
        request.setAttribute("logoutStatus", true);
    %>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>sgbau</title>

        <link href="css/index.css" rel="stylesheet" />
    </head>

    <body>

        <!-- header section starts -->
        <header class="header_section">
            <nav class="navbar navbar-expand-lg custom_nav-container pt-3" style='align-content: right'>
                <ul class="navbar-nav  ">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.html"> About </a>
                    </li>
<!--                    <li class="nav-item">
                        <a class="nav-link" href="registerStudent.html">Student Registration </a>
                    </li>-->
                </ul>
            </nav>
        </header>
        <!-- end header section -->
       
        <section style="background-image: url('images/bg1.jpg')">
            <div class="container">
                <br><br>
                <h1>
                    Welcome To <br>
                    
                        Coaching Management Portal
                    
                </h1>
                <p>
                   It is a Offline coaching management portal which manage by admin 
                </p>
                <div class="btn-box">
                    <a href="login.jsp" class="btn-1">
                        Login
                    </a>
                </div>
            </div>
        </section>

    </body>