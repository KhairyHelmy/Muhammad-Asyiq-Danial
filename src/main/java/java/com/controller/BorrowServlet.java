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

@WebServlet("/BorrowServlet")
public class BorrowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Fungsi untuk handle POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Debug: Papar data yang diterima
            System.out.println("bookID: " + request.getParameter("bookID"));
            System.out.println("userid: " + request.getParameter("userid"));

            // Dapatkan parameter dari borang
            int bookID = Integer.parseInt(request.getParameter("bookID"));
            int userid = Integer.parseInt(request.getParameter("userid"));

            // Sambungan ke database
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/library", "root", "admin");

            // Pastikan sambungan berjaya
            if (conn == null) {
                response.getWriter().println("Database connection failed.");
                return;
            }

            // Query insert
            String sql = "INSERT INTO borrowbook (bookID, userid) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bookID);
            stmt.setInt(2, userid);

            // Jalankan query
            int rowsAffected = stmt.executeUpdate();

            // Debug: Check jika berjaya insert
            System.out.println("Rows affected: " + rowsAffected);

            // Tutup connection
            stmt.close();
            conn.close();

            // Redirect selepas berjaya
            response.sendRedirect("more-books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
