package com.coachingM;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    private static final String INSERT_STUDENT_SQL = "INSERT INTO students (first_name, last_name, Phone, City, password, email,gender,course_name) VALUE (?, ?, ?, ?, ?, ?, ?, ?)";
//    ,gender,course

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
//        out.println("<h1>Welcome to REgister servlet</h1>");

        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String city = req.getParameter("address");
        String password = req.getParameter("password");
       String gender = req.getParameter("gender");
   String course = req.getParameter("course");

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");

            PreparedStatement statement = conn.prepareStatement(INSERT_STUDENT_SQL);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, phone);
            statement.setString(4, city);
            statement.setString(5, password);
            statement.setString(6, email);
            statement.setString(7, gender);
            statement.setString(8, course);
           

        
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h1>A new student was inserted successfully!<h1>");
                
            }
            //stmnt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.print("can't add");
            
        }

      

    }
}
