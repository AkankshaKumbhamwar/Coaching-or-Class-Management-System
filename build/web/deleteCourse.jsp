<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Delete Course</title>
        <link href="css/regStud.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1>Delete Course</h1>
            <form method="post" action="deleteCourse.jsp">
                <label for="courseId">Course ID:</label>
                <input type="text" id="courseId" name="courseId" />
                <br>
                <label for="courseName">Course Name:</label>
                <input type="text" id="courseName" name="courseName" />
                <br>
                <input type="submit" value="Delete" />
            </form>
            <%
                String courseId = request.getParameter("courseId");
                String courseName = request.getParameter("courseName");
                
                if (courseId != null && courseName != null) {
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");
                        String query = "DELETE FROM courses WHERE id = ? AND Course_name = ?";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, courseId);
                        pstmt.setString(2, courseName);
                        
                        int rowsAffected = pstmt.executeUpdate();
                        
                        if (rowsAffected > 0) {
            %>
            <p>Course with ID <%=courseId%> and Name <%=courseName%> deleted successfully.</p>
            <%
                        } else {
            %>
            <p>No course found with ID <%=courseId%> and Name <%=courseName%>.</p>
            <%
                        }
                    } catch (Exception e) {
                        out.println(e);
                        e.printStackTrace();
                    } finally {
                        // Close the resources
                        if (pstmt != null) {
                            try {
                                pstmt.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (conn != null) {
                            try {
                                conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            %>
        </div>
    </body>
</html>
