<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Search Faculty Information</title>
        <link href="css/regStud.css" rel="stylesheet">
        
</head>
<body>
    <div class="container">
	<h1>Search Faculty Information</h1>
	<form method="get" action="SearchFacultyToAdmin.jsp">
		<label>Search by name:</label>
		<input type="text" name="search" required>
		<input type="submit" value="Search">
	</form>
	<br>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Department</th>
			<th>Phone</th>
                        <th>Address</th>
		</tr>
		<%
			try {
				// Get the search term from the form
				String search = request.getParameter("search");
				
				// Connect to the database
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Coaching_Manage", "root", "Akanksha@123");
				
				// Execute the SQL query
//				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM faculty WHERE faculty_id = ?");
//				pstmt.setString(1, search);
                                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM faculty WHERE name LIKE ?");
				pstmt.setString(1, "%" + search + "%");
				ResultSet rs = pstmt.executeQuery();
				
				// Loop through the result set and display the faculty information
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getInt("faculty_id") + "</td>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getString("email") + "</td>");
					out.println("<td>" + rs.getString("department") + "</td>");
					out.println("<td>" + rs.getString("phone") + "</td>");
                                        out.println("<td>" + rs.getString("Address") + "</td>");
					out.println("</tr>");
				}
				
				// Close the statement and connection
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
    </div>
</body>
</html>
