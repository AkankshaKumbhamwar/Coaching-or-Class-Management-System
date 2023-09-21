<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="css/LoginCss.css" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Here</title>
        
</head>
<body>
    <div class="container">
	<h1>Login Page</h1>
	<form method="post" action="checklogin.jsp">
		<label for="username">Username:</label>
                <input type="text" id="username" name="username" maxlength="10" required><br><br>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required><br><br>
		<label for="user_type">Select User Type:</label>
		<select id="user_type" name="user_type">
			<option value="admin">admin</option>
			<option value="student">student</option>
			<option value="faculty">faculty</option>
		</select><br><br>
		<input type="submit" value="Login">
	</form>
    </div>
</body>
</html>
