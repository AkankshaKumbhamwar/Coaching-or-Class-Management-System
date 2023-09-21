<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Details</title>
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
        <h1>Student Details</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>LAst Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Gender</th>
                <th>Course</th>
                <th>Address</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");
                    String query = "SELECT * FROM students";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        String id = rs.getString("sid");
                        String fname = rs.getString("first_name");
                        String lname = rs.getString("last_name");
                        String gender = rs.getString("gender");
                        String email = rs.getString("email");
                        String course = rs.getString("course_name");
                        String phone = rs.getString("phone");
                        String address = rs.getString("City");

            %>
            <tr>
                <td><%=id%></td>
                <td><%=fname%></td>
                <td><%=lname%></td>
                <td><%=email%></td>
                <td><%=phone%></td>
                <td><%=gender%></td>
                <td><%=course%></td>
                <td><%=address%></td>
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
