<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Course Details</title>
        <style>
            body{
                background-color: black;
            }
            h1{
                text-align:center;
                padding: 10px;
                background-color: whitesmoke;
                color: black;
                border-radius: 10px;
            }
            table {
                
                margin: 0 auto; /* center align the table */
                padding: 50px 50px;
                background-color: whitesmoke;
                box-shadow: 0 0 10px #5368ac; /* add shadow effect to the table */
            }
        </style>
    </head>
    <body>
        <h1>Course Details</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Course Name</th>
                <th>Teacher Name</th>
                <th>start date</th>
                <th>end date</th>
                <th>price</th>
                <th>description</th>
                <th>no. of students</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");
                    String query = "SELECT * FROM courses";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        String id = rs.getString("id");
                        String Cname = rs.getString("Course_name");
                        String Sdate = rs.getString("start_date");
                        String Edate = rs.getString("end_date");
                        String price = rs.getString("price");
                        String description = rs.getString("description");
                        String Tname = rs.getString("Teacher_name");
                        String numStudents = rs.getString("numStudents");

            %>
            <tr>
                <td><%=id%></td>
                <td><%=Cname%></td>
                <td><%=Tname%></td>
                <td><%=Sdate%></td>
                <td><%=Edate%></td>
                <td><%=price%></td>
                <td><%=description%></td>
                <td><%=numStudents%></td>
            </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    out.println(e);
                    e.printStackTrace();
                }
            %>
        </table>
    </body>
</html>
