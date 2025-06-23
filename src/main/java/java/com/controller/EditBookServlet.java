package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("bookID");
        String title = request.getParameter("bookTitle");
        String author = request.getParameter("bookAuthor");
        String datePublished = request.getParameter("datePublished");
        String synopsis = request.getParameter("synopsis");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "admin");

            String sql = "UPDATE books SET bookTitle=?, bookAuthor=?, datePublished=?, synopsis=? WHERE bookID=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, author);
            stmt.setString(3, datePublished);
            stmt.setString(4, synopsis);
            stmt.setInt(5, Integer.parseInt(id));

            stmt.executeUpdate();
            conn.close();

            // Redirect to book list after successful update
            response.sendRedirect("book-listing.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating book: " + e.getMessage());
        }
    }
}


