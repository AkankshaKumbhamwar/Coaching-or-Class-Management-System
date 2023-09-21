<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Change Password</title>
        <link href="css/regStud.css" rel="stylesheet">
</head>
<body>
    <div class="container">
	<h1>Change Password</h1>
	<%
		if (request.getMethod().equals("POST")) {
			try {
				// Get the current and new passwords from the form data
				String currentPassword = request.getParameter("currentPassword");
				String newPassword = request.getParameter("newPassword");
				
				// Connect to the database
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Coaching_Manage", "root", "Akanksha@123");
				
				// Check if the current password is correct
				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM admin WHERE A_password = ?");
				pstmt.setString(1, currentPassword);
				ResultSet rs = pstmt.executeQuery();
				
				if (rs.next()) {
					// Update the password if the current password is correct
					PreparedStatement updateStmt = conn.prepareStatement("UPDATE admin SET A_password = ? WHERE id = 1");
					updateStmt.setString(1, newPassword);
					updateStmt.executeUpdate();
					
					out.println("<p>Password changed successfully.</p>");
				} else {
					out.println("<p>Current password is incorrect.</p>");
				}
				
				// Close the statement and connection
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<form method="POST">
		<label for="currentPassword">Current Password:</label>
		<input type="password" id="currentPassword" name="currentPassword" required><br>
		<label for="newPassword">New Password:</label>
		<input type="password" id="newPassword" name="newPassword" required><br>
		<button type="submit">Change Password</button>
	</form>
	<p><a href="admin.html">Back to Dashboard</a></p>
    </div>
</body>
</html>
