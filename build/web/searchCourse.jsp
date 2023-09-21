<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Courses</title>
        <link href="css/regStud.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1>Search Course</h1>
            <form method="post" action="searchCourse.jsp">
                <label for="search">Search by course name:</label>
                <input type="text" id="search" name="search" />
                <input type="submit" value="Search" />
            </form>
            <%
                String searchCn = request.getParameter("search");
                if (searchCn != null) {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");
String query = "SELECT * FROM courses WHERE Course_name LIKE ?";
                        PreparedStatement pstmt = conn.prepareStatement(query);
pstmt.setString(1, "%" + searchCn + "%");
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                           String id = rs.getString("id");
                        String Cname = rs.getString("Course_name");
                        String Sdate = rs.getString("start_date");
                        String Edate = rs.getString("end_date");
                        String price = rs.getString("price");
                        String description = rs.getString("description");
                        String Tname = rs.getString("Teacher_name");
                        String numStudents = rs.getString("numStudents");
            %>
            <h2>Student Details</h2>
            
                <table>
                <tr>
                    <td>ID:</td>
                    <td><%=id%></td>
                </tr>
                <tr>
                    <td>Course Name:</td>
                    <td><%=Cname%></td>
                </tr>
                <tr>
                    <td>Start date:</td>
                    <td><%=Sdate%></td>
                </tr>
                <tr>
                    <td>End date:</td>
                    <td><%=Edate%></td>
                </tr>
                <tr>
                    <td>price:</td>
                    <td><%=price%></td>
                </tr>
                <tr>
                    <td>Teacher name:</td>
                    <td><%=Tname%></td>
                </tr>
                <tr>
                    <td>Number of students:</td>
                    <td><%=numStudents%></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><%= description%></td>
                </tr>
            </table>
            <%
            } else {
             %>
            <p>there is no courses available of this name <%=searchCn%>.</p>
            <%
                        }
                        conn.close();
rs.close();
pstmt.close();
                    } catch (Exception e) {
                        out.println(e);
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </body>
</html>
