<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Delete Student</title>
        <link href="css/regStud.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
        <h1>Delete Student</h1>
        <form method="post">
            Enter Student ID: <input type="text" name="id"><br><br>
            <input type="submit" value="Delete">
        </form>
        <%
            if (request.getMethod().equals("POST")) {
                String id = request.getParameter("id");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");
                    String query = "DELETE FROM students WHERE sid=?";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setString(1, id);
                    int rowsAffected = stmt.executeUpdate();
                    out.println(rowsAffected + " rows deleted.");
                    conn.close();
                } catch (Exception e) {
                    out.println(e);
                    e.printStackTrace();
                }
            }
        %>
        </div>
    </body>
</html>
