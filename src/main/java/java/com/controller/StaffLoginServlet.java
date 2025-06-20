package com.controller;

import com.Model.Staff;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database connection info
    private String jdbcURL = "jdbc:mysql://localhost:3306/library";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String staffid = request.getParameter("staffid"); // now it's email
        String staffname = request.getParameter("staffname");
        String password = request.getParameter("psw");

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "SELECT * FROM staff WHERE staffid = ?, staffname = ? AND password = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, staffid);
            pst.setString(2, staffname);
            pst.setString(3, password);

            rs = pst.executeQuery();

            if (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffid(rs.getInt("staffid"));
                staff.setStaffName(rs.getString("staffname"));
                staff.setPassword(rs.getString("password"));;

                HttpSession session = request.getSession();
                session.setAttribute("staff", staff);

                response.sendRedirect("profile.jsp");

            } else {
                response.sendRedirect("login.jsp?error=Invalid credentials.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.toString()); 
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}