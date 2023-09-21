package com.coachingM;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addcourse")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class AddNewCourseAdmin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtain the request parameters for the course data
        String courseTitle = request.getParameter("courseName");
        String courseDescription = request.getParameter("courseDesc");
        int coursePrice = Integer.parseInt(request.getParameter("coursePrice"));
        String instructor = request.getParameter("instructor");
        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time");
        int numStudents = Integer.parseInt(request.getParameter("numStudents"));
        // Retrieve the image file from the request
        Part filePart = request.getPart("courseImage");
        InputStream fileContent = filePart.getInputStream();
        PrintWriter out = response.getWriter();
        

        // Open a database connection
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coaching_Manage", "root", "Akanksha@123"); PreparedStatement stmt = conn.prepareStatement("INSERT INTO courses (Course_name, description, price, image,start_date,end_date,numStudents,Teacher_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, courseTitle);
            stmt.setString(2, courseDescription);
            stmt.setInt(3, coursePrice);
            stmt.setBinaryStream(4, fileContent);
            stmt.setString(5, start_time);
            stmt.setString(6, end_time);
            stmt.setInt(7, numStudents);
            stmt.setString(8, instructor);
            // Use a PreparedStatement to execute the INSERT statement, passing in the data for the placeholders
            int rowsInserted = stmt.executeUpdate();

            // Retrieve the auto-generated ID of the newly inserted course
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            int courseId = 0;
            if (generatedKeys != null && generatedKeys.next()) {
                courseId = generatedKeys.getInt(1);
            }

            // Use the ID to rename and save the image file to a specific location on the server
            String fileName = "course_" + courseId + ".jpg";
            String filePath = request.getServletContext().getRealPath("/") + "images/" + fileName;

            try (FileOutputStream outputStream = new FileOutputStream(filePath)) {
                int read = 0;
                byte[] bytes = new byte[1024];
                while ((read = fileContent.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            }

            out.println("<h1>Course added successfully!</h1>");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            out.println(ex);
            out.println("This course already exist...");
        } finally {
            // Close the input stream
            if (fileContent != null) {
                fileContent.close();
            }
        }
    }
}
