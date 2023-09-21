<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Delete Faculty Information</title>
        <link href="css/regStud.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1>Delete Faculty Information</h1>
            <form method="post">
                Enter faculty ID: <input type="text" name="id"><br><br>
                <input type="submit" value="Delete">
            </form>
            <%
                try {
                    // Get the faculty ID to be deleted from the query string
                    int id = Integer.parseInt(request.getParameter("id"));

                    // Connect to the database
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Coaching_Manage", "root", "Akanksha@123");

                    // Execute the SQL query to delete the faculty record
                    PreparedStatement pstmt = conn.prepareStatement("DELETE FROM faculty WHERE faculty_id = ?");
                    pstmt.setInt(1, id);
                    int affectedRows = pstmt.executeUpdate();

                    if (affectedRows > 0) {
                        out.println("<p>Faculty information has been deleted successfully.</p>");
                    } else {
                        out.println("<p>Faculty information not found.</p>");
                    }

                    // Close the statement and connection
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <p><a href="ViewFacultyToAdmin.jsp">Back to Faculty List</a></p>
        </div>
    </body>
</html>
