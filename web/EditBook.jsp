<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="classes.Book" %> <!-- Add this line to import the Book class -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            text-align: center;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            max-width: 100%;
            text-align: left;
            margin: 15px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2>Edit Book Details</h2>

    <% 
        // Retrieve the book details from request attributes
        Book book = (Book) request.getAttribute("book");

        // If the book object is found, show the edit form
        if (book != null) { 
    %>
    <form action="BookControllerServlet" method="POST">
        <input type="hidden" name="action" value="updateBook">
        <input type="hidden" name="bookId" value="<%= book.getIsbn() %>">

        <label for="title">Book Title:</label>
        <input type="text" id="title" name="title" value="<%= book.getTitle() %>" required>

        <label for="author">Author:</label>
        <input type="text" id="author" name="author" value="<%= book.getAuthor() %>" required>

        <label for="genre">Genre:</label>
        <input type="text" id="genre" name="genre" value="<%= book.getGenre() %>" required>

        <label for="availability">Availability:</label>
        <select id="availability" name="availability" required>
            <option value="Available" <%= "available".equals(book.getAvailability()) ? "selected" : "" %>>Available</option>
            
            <option value="Reserved" <%= "reserved".equals(book.getAvailability()) ? "selected" : "" %>>Reserved</option>
        </select>

        <input type="submit" value="Update Book">
    </form>
    <% 
        } else if (request.getAttribute("errorMessage") != null) {
            // Show error message if no book is found
    %>
    <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
    <% 
        }
    %>

</body>
</html>
