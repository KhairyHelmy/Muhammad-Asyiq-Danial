/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
@WebServlet("/UpdateBorrowStatus")
public class UpdateBorrowStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int borrowid = Integer.parseInt(request.getParameter("borrowid"));

        try (Connection con = DBConnection.getConnection()) {
            // 1. Update borrow table
            String updateBorrow = "UPDATE borrow SET status = 'Returned' WHERE borrowid = ?";
            try (PreparedStatement ps = con.prepareStatement(updateBorrow)) {
                ps.setInt(1, borrowid);
                ps.executeUpdate();
            }

            // 2. Insert return record
            String insertReturn = "INSERT INTO `return` (borrowid, returnDate) VALUES (?, CURDATE())";
            try (PreparedStatement ps2 = con.prepareStatement(insertReturn)) {
                ps2.setInt(1, borrowid);
                ps2.executeUpdate();
            }

            // 3. Optional: Make book available again
            String updateBook = "UPDATE book SET status = 'available' WHERE bookid = (SELECT bookid FROM borrow WHERE borrowid = ?)";
            try (PreparedStatement ps3 = con.prepareStatement(updateBook)) {
                ps3.setInt(1, borrowid);
                ps3.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ Redirect back to history page
        response.sendRedirect("StaffBorrowHistory");
    }
}


