<%@ page language="java" import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta name="author" content="Codeconvey" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>

    <!--Only for demo purpose - no need to add.-->
    <link rel="stylesheet" href="studentDetailCss/demo.css" />

    
    <link rel="stylesheet" href="css/StudDetail.css">
</head>
<%
    String username = (String) session.getAttribute("username");
    int userId = Integer.parseInt(username);
    // Retrieve student details from the database using the username
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String jdbcUrl = "jdbc:mysql://localhost:3306/Coaching_Manage";
    String dbUsername = "root";
    String dbPassword = "Akanksha@123";
    String driver = "com.mysql.cj.jdbc.Driver";
    String name = null;
    String Lname = null;
    int sId = 0;
    String email = null;
    String gender = null;
    String course = null;
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
        stmt = conn.prepareStatement("SELECT * FROM students WHERE sid = ?");
        stmt.setString(1, username);
        rs = stmt.executeQuery();
        if (rs.next()) {
            // Display student details
            name = rs.getString("first_name");
            email = rs.getString("email");
            sId = rs.getInt("sid");
            Lname = rs.getString("last_name");
            gender = rs.getString("gender");
            course = rs.getString("course_name");
            rs.close();
            stmt.close();
            conn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Handle any exceptions
    }

%>
<div class="ScriptTop">
    <div class="rt-container">
        <div class="col-rt-4" id="float-right">

            <!-- Ad Here -->

        </div>
    </div>
</div>

<header class="ScriptHeader">
    <div class="rt-container">
        <div class="col-rt-12">
            <div class="rt-heading">
                <h1>Student Profile Page</h1>

            </div>
        </div>
    </div>
</header>

<section>
    <div class="rt-container">
        <div class="col-rt-12">
            <div class="Scriptcontent">

                <!-- Student Profile -->
                <div class="student-profile py-4">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-transparent text-center">
                                        <img class="profile_img" src="" alt="student dp">
                                        <h3> Welcome <% out.print(name);%></h3>
                                    </div>
                                    <div class="card-body">
                                        <p class="mb-0"><strong class="pr-1">Student ID:</strong><% out.print(sId);%></p>
                                        <p class="mb-0"><strong class="pr-1">Name : <% out.print(name + " " + Lname);%></strong></p>
                                        <p><a href="AdminLogout.jsp">logout</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card shadow-sm">
                                    <div class="card-header bg-transparent border-0">
                                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
                                    </div>
                                    <div class="card-body pt-0">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th width="30%">Roll</th>
                                                <td width="2%">:</td>
                                                <td><% out.print(sId);%></td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Course</th>
                                                <td width="2%">:</td>
                                                <td><% out.print(course); %></td>
                                            </tr>
                                            <tr>
                                                <th width="30%">Gender</th>
                                                <td width="2%">:</td>
                                                <td><% out.print(gender); %></td>
                                            </tr>

                                            <tr>
                                                <th width="30%">email</th>
                                                <td width="2%">:</td>
                                                <td><% out.print(email);%></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div style="height: 26px"></div>
                                <div class="card shadow-sm">
                                    <!--          <div class="card-header bg-transparent border-0">
                                                <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Other Information</h3>
                                              </div>-->
                                    <!--          <div class="card-body pt-0">
                                                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                              </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- partial -->

            </div>
        </div>
    </div>
</section>



