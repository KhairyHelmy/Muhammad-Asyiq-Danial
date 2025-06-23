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

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String bookTitle = request.getParameter("bookTitle");
        String bookAuthor = request.getParameter("bookAuthor");
        String datePublished = request.getParameter("datePublished");
        String synopsis = request.getParameter("synopsis"); // ikut nama form & DB

        System.out.println("DEBUG - bookTitle: " + bookTitle); // Tambah log
        System.out.println("DEBUG - bookAuthor: " + bookAuthor);
        System.out.println("DEBUG - datePublished: " + datePublished);
        System.out.println("DEBUG - synopsis: " + synopsis);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library", "root", "admin");

            String sql = "INSERT INTO books (bookTitle, bookAuthor, datePublished, synopsis) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, bookTitle);
            stmt.setString(2, bookAuthor);
            stmt.setString(3, datePublished);
            stmt.setString(4, synopsis);

            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("book-listing.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
