<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
try {
    // load the driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    // create connection
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "root");

    // Get user details from the form
    int userId = Integer.parseInt(request.getParameter("userId"));
    String userName = request.getParameter("userName");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String password = request.getParameter("password");

    // Perform the update operation
    String updateQuery = "UPDATE jsp_registration SET User_Name=?, Email=?, Phone_Number=?, Password=? WHERE User_ID=?";
    PreparedStatement updateStatement = con.prepareStatement(updateQuery);
    updateStatement.setString(1, userName);
    updateStatement.setString(2, email);
    updateStatement.setString(3, phoneNumber);
    updateStatement.setString(4, password);
    updateStatement.setInt(5, userId);
    int rowsUpdated = updateStatement.executeUpdate();

    updateStatement.close();
    con.close();

    // Redirect back to the user data display page
    response.sendRedirect("read.jsp");
} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
    e.printStackTrace();
}
%>
