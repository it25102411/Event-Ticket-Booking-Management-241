<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Ticket Booking</title>
</head>
<body>

    <!-- Show error message if login failed -->
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
        <p style="color:red;"><%= error %></p>
    <% } %>

    <form action="/login" method="post">
        Email: <input type="text" name="email"> <br>
        Password: <input type="password" name="password"> <br>
        <input type="submit" value="Login">
    </form>

</body>
</html>