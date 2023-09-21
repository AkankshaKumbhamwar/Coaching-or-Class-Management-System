<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    Boolean logoutStatus = (Boolean) request.getAttribute("logoutStatus");
    if (logoutStatus != null && logoutStatus) {
        response.sendRedirect("index.jsp"); // Redirect to index.jsp if logoutStatus is true
//        request.setAttribute("logoutStatus", true");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Coaching Management System - Admin</title>

        <!-- responsive style -->
        <link href="css/AdminCss.css" rel="stylesheet" />
    </head>
    <body>
        <header >  <h1>Welcome Admin!</h1></header>
        <br><br>
        <div class="container-wrapper">
            <div class="container-one">

                <h2>Student Management</h2>
                <ul>
                    <li><a href="registerStudent.html">Add New Student</a></li>
                    <li><a href="ViewStudentToAdmin.jsp">View All Students</a></li>
                    <li><a href="searchStudentToAdmin.jsp">Search Students</a></li>
                    <li><a href="deleteStudentToAdmin.jsp">Delete Student</a></li>
                </ul>

            </div>
            <div class="container-two">

                <h2>Faculty Management</h2>
                <ul>
                    <li><a href="addfaculty.html">Add New Faculty</a></li>
                    <li><a href="ViewFacultyToAdmin.jsp">View All Faculty</a></li>
                    <li><a href="SearchFacultyToAdmin.jsp">Search Faculty</a></li>
                    <li><a href="deleteFacultyToAdmin.jsp">Delete Faculty</a></li>
                </ul>
            </div>
        </div>
        <div class="container-wrapper">
            <div class="container-one">

                <h2>Course Management</h2>
                <ul>
                    <li><a href="AddNewCourseAdmin.html">Add New Course</a></li>
                    <li><a href="ViewCourseAdmin.jsp">View All Courses</a></li>
                    <li><a href="searchCourse.jsp">Search Courses</a></li>
                    <li><a href="deleteCourse.jsp">Delete Course</a></li>
                </ul>

            </div>
            <div class="container-two">

                <h2>Account Management</h2>
                <ul>
                    <li><a href="changePasswordAdmin.jsp">Change Password</a></li>
                    <li><form action="logout.jsp" method="POST">
                            <input type="submit" value="Logout">
                            
                        </form></li>
                </ul>

            </div>
        </div>
    </body>
</html>
