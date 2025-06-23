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
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "admin");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM books");
                while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("bookID") %></td>
                <td><%= rs.getString("bookTitle") %></td>
                <td><%= rs.getString("bookAuthor") %></td>
                <td><%= rs.getDate("datePublished") %></td>
                <td><%= rs.getString("synopsis") %></td>
                <td>
                    <a href="edit-form.jsp?id=<%= rs.getInt("bookID") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="DeleteBookServlet?id=<%= rs.getInt("bookID") %>" class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                </td>
            </tr>
        <%
                }
                conn.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</body>
</html>
