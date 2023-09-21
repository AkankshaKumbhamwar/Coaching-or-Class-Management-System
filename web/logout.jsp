<%-- 
    Document   : logout
    Created on : May 21, 2023, 6:18:01 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <h1>Logged out successfully!</h1>
        
        
        
        <a href="index.jsp">Go to Login</h1>
        <% 
            session.invalidate();
        %>
    </body>
</html>