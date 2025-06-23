/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.util.DBConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BorrowBookServlet")
public class BorrowBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String borrowDateStr = request.getParameter("borrowDate");
        String returnByStr = request.getParameter("returnBy");
        String useridStr = request.getParameter("userid");
        String bookidStr = request.getParameter("bookid");

        // Convert to correct types
        int userid = Integer.parseInt(useridStr);
        int bookid = Integer.parseInt(bookidStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO borrow (borrowDate, userid, bookid, returnBy, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setDate(1, java.sql.Date.valueOf(borrowDateStr));
            stmt.setInt(2, userid);
            stmt.setInt(3, bookid);
            stmt.setDate(4, java.sql.Date.valueOf(formatToSQLDate(returnByStr)));
            stmt.setString(5, "borrowed");

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                request.setAttribute("message", "✅ Book borrowed successfully!");
            } else {
                request.setAttribute("message", "❌ Failed to borrow the book.");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("BorrowConfirmation.jsp?bookId=" + bookid);
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();  // Log in server console
            request.setAttribute("message", "⚠️ Error: " + e.getMessage());

            // For debugging: print the input values
            System.out.println("borrowDate: " + borrowDateStr);
            System.out.println("returnBy: " + returnByStr);
            System.out.println("userid: " + userid);
            System.out.println("bookid: " + bookid);

            RequestDispatcher dispatcher = request.getRequestDispatcher("BorrowConfirmation.jsp");
            dispatcher.forward(request, response);
        }

    }

    // Helper method to convert dd/MM/yy to yyyy-MM-dd
    private String formatToSQLDate(String input) {
        try {
            java.text.SimpleDateFormat inputFormat = new java.text.SimpleDateFormat("dd/MM/yy");
            java.text.SimpleDateFormat sqlFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = inputFormat.parse(input);
            return sqlFormat.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
