

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




<%
try {
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "root");

    // Get user ID from the query parameter
    int userId = Integer.parseInt(request.getParameter("userId"));

    // Perform the delete operation
    String deleteQuery = "DELETE FROM jsp_registration WHERE User_ID=?";
    PreparedStatement deleteStatement = con.prepareStatement(deleteQuery);
    deleteStatement.setInt(1, userId);
    int rowsDeleted = deleteStatement.executeUpdate();

    deleteStatement.close();
    con.close();

    // Redirect back to the user data display page
    response.sendRedirect("read.jsp");
} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
    e.printStackTrace();
}
%>


</body>
</html>