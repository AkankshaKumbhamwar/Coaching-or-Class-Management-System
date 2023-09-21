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

public class addfaculty extends HttpServlet {

    private static final String INSERT_faculty_SQL = "INSERT INTO faculty(name, email, password, department, phone, address) VALUES (?, ?, ?, ?, ?, ?)";
//    ,gender,course

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
//        out.println("<h1>Welcome to REgister servlet</h1>");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String department = req.getParameter("department");
        String phone =req.getParameter("phone");
        String address = req.getParameter("address");
//out.print(name +"   "+  email +"   "+ password +"  " + department+"  " + phone + address);
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123");

            PreparedStatement statement = conn.prepareStatement(INSERT_faculty_SQL);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, department);
            statement.setString(5, phone);
            statement.setString(6, address);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h1>A new faculty was inserted successfully!</h1>");

            }
            //stmnt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.print("email is already exist....");

        }

    }
}
