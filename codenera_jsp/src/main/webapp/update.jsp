<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
try {
    // load the driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    // create connection
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "root");

    // Get user ID from the query parameter
    int userId = Integer.parseInt(request.getParameter("userId"));

    // Retrieve user details for pre-filling the form
    String selectQuery = "SELECT * FROM jsp_registration WHERE User_ID=?";
    PreparedStatement selectStatement = con.prepareStatement(selectQuery);
    selectStatement.setInt(1, userId);
    ResultSet rs = selectStatement.executeQuery();

    // Forward the user details to the update form
    if (rs.next()) {
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
   
    
</head>
<body>
    <h2>Update User</h2>
    <form action="update_process.jsp" method="post">
        <input type="hidden" name="userId" value="<%= userId %>">
        User Name: <input type="text" name="userName" value="<%= rs.getString("User_Name") %>"><br>
        Email: <input type="text" name="email" value="<%= rs.getString("Email") %>"><br>
        Phone Number: <input type="text" name="phoneNumber" value="<%= rs.getString("Phone_Number") %>"><br>
        Password: <input type="password" name="password" value="<%= rs.getString("Password") %>"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>

<%
    }

    rs.close();
    selectStatement.close();
    con.close();
} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
    e.printStackTrace();
}
%>
