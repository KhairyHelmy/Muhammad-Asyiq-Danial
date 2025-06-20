/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.Model.BorrowRecord;
import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet("/BorrowHistory")
public class BorrowHistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        // Simulated session (for testing only)
        int userid = 3;  // Change this to a valid test user ID from your database
        String username = "Hanis";
        //int userId = (Integer) session.getAttribute("userid");

        List<BorrowRecord> records = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT b.bookid, bk.bookName, b.returnBy, r.returnDate, b.status "
                    + "FROM borrow b "
                    + "JOIN book bk ON b.bookid = bk.bookid "
                    + "LEFT JOIN return r ON b.borrowid = r.borrowid "
                    + "WHERE b.userid = ? "
                    + "ORDER BY b.returnBy DESC";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, userid);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    BorrowRecord br = new BorrowRecord();
                    br.setBookid(rs.getInt("bookid"));
                    br.setBookName(rs.getString("bookName"));
                    br.setReturnBy(rs.getDate("returnBy"));
                    br.setReturnDate(rs.getDate("returnDate"));
                    br.setStatus(rs.getString("status"));
                    records.add(br);
                }
                System.out.println("Borrow records size: " + records.size());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("borrowRecords", records);
        request.getRequestDispatcher("BorrowHistory.jsp").forward(request, response);
    }
}
