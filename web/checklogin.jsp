<%@ page import="java.sql.*" %>

<%
// Retrieve the user input
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String userType = request.getParameter("user_type");
// Set up the database connection
    String jdbcUrl = "jdbc:mysql://localhost:3306/Coaching_Manage";
    String dbUsername = "root";
    String dbPassword = "Akanksha@123";
    String driver = "com.mysql.cj.jdbc.Driver";
    Class.forName(driver);
    Connection con = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
//    out.println(userType);
    String sql = null;
    PreparedStatement stmt = null;
    ResultSet result = null;

    switch (userType) {
        case "admin":
//            out.print("admin page");
            sql = "SELECT * FROM admin WHERE A_username=? AND A_password=?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            result = stmt.executeQuery();
            if (result.next()) {
                // User exists, redirect to dashboard page
            session.setAttribute("loggedInUser", "admin");
                response.sendRedirect("admin.jsp");

//out.println("valid");
            } else {
                // User does not exist, display error message
                out.println("Invalid username or password.");
                response.sendRedirect("login.jsp");
            }

            break;
        case "student":
         try {
            sql = "SELECT sid,password FROM students WHERE sid=? AND password=?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(username));
            stmt.setString(2, password);
            result = stmt.executeQuery();

            // Check if the user exists in the database
            if (result.next()) {
                // User exists, redirect to dashboard page
                session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("studentDetail.jsp");
            } else {
                // User does not exist, display error message
                out.println("Invalid username or password.");
                response.sendRedirect("login.jsp");
            }
        } catch (NumberFormatException e) {
            // User entered non-integer username, display error message
            out.println("Invalid username. Please enter a valid integer value.");
            response.sendRedirect("login.jsp");
        }

        break;

        default:
            try {
            //out.print("faculty page");
            sql = "SELECT faculty_id,password FROM faculty WHERE faculty_id=? AND password=?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(username));
            stmt.setString(2, password);
            result = stmt.executeQuery();

// Check if the user exists in the database
            if (result.next()) {
                // User exists, redirect to dashboard page
                response.sendRedirect("faculty.html");
//out.println("valid");
            } else {
                // User does not exist, display error message
                out.println("Invalid username or password.");
            }
            break;
        }catch(Exception e){
            out.print("invalid username or password for faculty");
    }
    }

// Close the database connection
    con.close();
%>
