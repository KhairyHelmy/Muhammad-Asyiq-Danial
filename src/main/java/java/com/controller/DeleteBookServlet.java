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

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookID = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library", "root", "admin");

            String sql = "DELETE FROM books WHERE bookID=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bookID);
            stmt.executeUpdate();

            conn.close();
            response.sendRedirect("book-listing.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

