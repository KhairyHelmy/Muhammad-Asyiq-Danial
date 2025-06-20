<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
<h2>Add New Book</h2>
<form action="AddBookServlet" method="post">
    <div class="mb-3">
        <label>Title:</label>
        <input type="text" name="bookTitle" id="bookTitle" class="form-control" required />
    </div>
    <div class="mb-3">
        <label>Author:</label>
        <input type="text" name="bookAuthor" id="bookAuthor" class="form-control" required />
    </div>
    <div class="mb-3">
        <label>Date Published:</label>
        <input type="date" name="datePublished" id="datePublished" class="form-control" required />
    </div>
    <div class="mb-3">
        <label>Synopsis:</label>
        <textarea name="synopsis" id="synopsis" class="form-control" required></textarea> <!-- ikut nama column dalam DB -->
    </div>
    <button type="submit" class="btn btn-success">Save Book</button>
</form>
</body>
</html>
