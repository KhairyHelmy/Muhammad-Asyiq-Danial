<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String title = "", author = "", date = "", synopsis = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "admin");
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM books WHERE bookID = ?");
        stmt.setInt(1, Integer.parseInt(id));
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            title = rs.getString("bookTitle");
            author = rs.getString("bookAuthor");
            date = rs.getString("datePublished");
            synopsis = rs.getString("synopsis");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Edit Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>Edit Book</h2>
<form action="EditBookServlet" method="post">
    <input type="hidden" name="bookID" value="<%= id %>" />
    <div class="mb-3">
        <label>Title:</label>
        <input type="text" name="bookTitle" class="form-control" value="<%= title %>" required />
    </div>
    <div class="mb-3">
        <label>Author:</label>
        <input type="text" name="bookAuthor" class="form-control" value="<%= author %>" required />
    </div>
    <div class="mb-3">
        <label>Date Published:</label>
        <input type="date" name="datePublished" class="form-control" value="<%= date %>" required />
    </div>
    <div class="mb-3">
        <label>Synopsis:</label>
        <textarea name="synopsis" class="form-control" required><%= synopsis %></textarea>
    </div>
    <button type="submit" class="btn btn-success">Update Book</button>
    <a href="book-listing.jsp" class="btn btn-secondary">Cancel</a>
</form>
</body>
</html>
