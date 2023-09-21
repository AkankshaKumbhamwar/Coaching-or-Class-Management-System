<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Students</title>
        <link href="css/regStud.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1>Search Students</h1>
            <form method="post" action="searchStudentToAdmin.jsp">
                <label for="search">Search by ID:</label>
                <input type="text" id="search" name="search" />
                <input type="submit" value="Search" />
            </form>
            <%
                String searchId = request.getParameter("search");
            %>
           
            <%
                if (searchId != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");
                        String query = "SELECT * FROM students WHERE sid = ?";
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        pstmt.setString(1, searchId);
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                            String id = rs.getString("sid");
                            String Fname = rs.getString("first_name");
                            String Lname = rs.getString("last_name");
                            String phone = rs.getString("phone");
                            String address = rs.getString("city");
                            String password = rs.getString("password");
                            String email = rs.getString("email");
                            String gender = rs.getString("gender");
                            String Cname = rs.getString("course_name");
            %>
            <h2>Student Details</h2>
            <table>
                <tr>
                    <td>ID:</td>
                    <td><%=id%></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><%=Fname%> <%= Lname%></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><%=email%></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><%=password%></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><%=phone%></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><%=address%></td>
                </tr>
                <tr>
                    <td>Course:</td>
                    <td><%=Cname%></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><%=gender%></td>
                </tr>
            </table>
            <%
            } else {
            %>
            <p>no student found with this id <%=searchId%>.</p>
            <%
                        }
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
