<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Book Listing</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h2>List of Books</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Book ID</th>
                <th>Book Title</th>
                <th>Book Author</th>
                <th>Date Published</th>
                <th>Synopsis</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "admin");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM books");

                while(rs.next()) {
                    int bookID = rs.getInt("bookID");
        %>
            <tr>
                <td><%= bookID %></td>
                <td><%= rs.getString("bookTitle") %></td>
                <td><%= rs.getString("bookAuthor") %></td>
                <td><%= rs.getDate("datePublished") %></td>
                <td><%= rs.getString("synopsis") %></td>
                <td>
                    <!-- Borrow Book Button -->
                    <form action="BorrowServlet" method="post" style="display:inline;">
                        <input type="hidden" name="bookID" value="<%= bookID %>">
                        <input type="hidden" name="userid" value="1">
                        <button type="submit" class="btn btn-success btn-sm">Borrow</button>
                    </form>
                </td>
            </tr>
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
        %>
            <tr><td colspan="6" class="text-danger">Error loading books: <%= e.getMessage() %></td></tr>
        <%
            } finally {
                if(rs != null) try { rs.close(); } catch(Exception e) {}
                if(stmt != null) try { stmt.close(); } catch(Exception e) {}
                if(conn != null) try { conn.close(); } catch(Exception e) {}
            }
        %>
        </tbody>
    </table>
</body>
</html>


