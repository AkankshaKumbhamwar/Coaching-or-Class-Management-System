<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>View Faculty Information</title>
<!--        <link href="css/regStud.css"  rel="stylesheet">
        <link href="studentDetailCss/style.css" rel="stylesheet">-->
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
    <div class="container">
	<h1>Faculty Information</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
                        <th>Password</th>
			<th>Department</th>
			<th>Phone</th>
                        <th>Address</th>
		</tr>
		<%
			try {
				// Connect to the database
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Coaching_Manage", "root", "Akanksha@123");
				
				// Execute the SQL query
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM faculty");
				
				// Loop through the result set and display the faculty information
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getInt("faculty_id") + "</td>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getString("email") + "</td>");
                                        out.println("<td>" + rs.getString("password") + "</td>");
					out.println("<td>" + rs.getString("department") + "</td>");
					out.println("<td>" + rs.getString("phone") + "</td>");
                                        out.println("<td>" + rs.getString("address") + "</td>");
					out.println("</tr>");
				}
				
				// Close the statement and connection
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
    </div>
</body>
</html>
