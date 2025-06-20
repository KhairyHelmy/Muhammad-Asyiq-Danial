package com.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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

/**
 *
 * @author Asus
 */
@WebServlet("/StaffBorrowHistory")
public class StaffBorrowHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BorrowRecord> records = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT b.borrowid, b.borrowDate, b.bookid, bk.bookName, u.userid, u.username, b.returnBy, b.status, r.returnDate " +
                         "FROM borrow b " +
                         "JOIN book bk ON b.bookid = bk.bookid " +
                         "JOIN user u ON b.userid = u.userid " +
                         "LEFT JOIN `return` r ON b.borrowid = r.borrowid " +
                         "ORDER BY b.returnBy DESC";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    BorrowRecord br = new BorrowRecord();
                    br.setBorrowid(rs.getInt("borrowid"));
                    br.setBorrowDate(rs.getDate("borrowDate")); // ✅ Make sure this column exists!
                    br.setBookid(rs.getInt("bookid"));
                    br.setBookName(rs.getString("bookName"));
                    br.setUserid(rs.getInt("userid"));
                    br.setUsername(rs.getString("username"));
                    br.setReturnBy(rs.getDate("returnBy"));
                    br.setReturnDate(rs.getDate("returnDate"));
                    br.setStatus(rs.getString("status"));
                    records.add(br);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ Set list as request attribute and forward
        request.setAttribute("borrowRecords", records);
        request.getRequestDispatcher("StaffBorrowHistory.jsp").forward(request, response);
    }
}


