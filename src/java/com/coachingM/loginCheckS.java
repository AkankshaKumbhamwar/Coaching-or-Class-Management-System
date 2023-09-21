/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coachingM;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Akanksha
 */
public class loginCheckS {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String user_name = req.getParameter("username");
        String user_password = req.getParameter("password");

        Connection con = null;
        try {
            //load the driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            //create the  connection..
            String user = "root";
            String password = "Akanksha@123";
            String url = "jdbc:mysql://localhost:3306/admin";

            con = DriverManager.getConnection(url, user, password);
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM users WHERE username=?");
            pstmt.setString(1, user_name);
            pstmt.setString(1, user_password);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                
            } // The username and password are correct
            // Perform the necessary actions
            else {
                out.print("<h1>invalid username</h1>");
                // The username and password are incorrect
                // Show an error message or redirect the user to a login page
            }
            rs.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            //printStackTrace method in java is a tool used to handle exceptions and errors. it is a method of java's throwable class
        }
    }

}
