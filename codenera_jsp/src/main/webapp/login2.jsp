<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>

<%
    String errorMessage = "";

    if (request.getMethod().equalsIgnoreCase("POST")) {
        // If the form is submitted, validate the login credentials
        String username = request.getParameter("User_Name");
        String password = request.getParameter("Password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "root");

            String sql = "SELECT * FROM user WHERE User_Name=? AND Password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Valid login
                response.sendRedirect("read.jsp"); // Redirect to a welcome page on successful login
            } else {
                // Invalid login
                errorMessage = "Invalid username or password. Please try again.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "An error occurred during login. Please try again later.";
        }
    }
%>

<h2>Login</h2>
<form action="login.jsp" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <input type="submit" value="Login">
</form>

<% if (!errorMessage.isEmpty()) { %>
    <p style="color: red;"><%= errorMessage %></p>
<% } %>

</body>
</html>
