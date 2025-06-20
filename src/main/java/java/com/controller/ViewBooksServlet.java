package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewBooksServlet")
public class ViewBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // HTML Table Header
        out.println("<html><head><title>Book Table</title></head><body>");
        out.println("<h2>Book Records</h2>");
        out.println("<table border='1' cellpadding='10'>");
        out.println("<tr style='background-color:#e0e0e0;'>");
        out.println("<th>bookId</th><th>bookTitle</th><th>bookAuthor</th><th>datePublished</th><th>synopsis</th>");
        out.println("</tr>");

        try {
            // JDBC connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "admin");

            String query = "SELECT * FROM books";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("bookId") + "</td>");
                out.println("<td>" + rs.getString("bookTitle") + "</td>");
                out.println("<td>" + rs.getString("bookAuthor") + "</td>");
                out.println("<td>" + rs.getDate("datePublished") + "</td>");
                out.println("<td>" + rs.getString("synopsis") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body></html>");

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }

        out.close();
    }
}
