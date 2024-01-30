<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
try {
    // load the driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    // create connection
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet", "root", "root");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM jsp_registration");

%>

<!DOCTYPE html>
<html>
<head>
    <title>User Data</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
    </style>
</head>
<body>
    <h2>User Data</h2>
    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>User Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Password</th>
                 <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("User_ID") %></td>
                <td><%= rs.getString("User_Name") %></td>
                <td><%= rs.getString("Email") %></td>
                <td><%= rs.getString("Phone_Number") %></td>
                <td><%= rs.getString("Password") %></td>
                <td><a href="update.jsp?userId=<%= rs.getInt("User_ID") %>">Update</a></td>
                <td><a href="delete.jsp?userId=<%= rs.getInt("User_ID") %>">Delete</a></td>
            </tr>
            <%
                }
                rs.close();
                st.close();
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            // End of scriptlet
            %>
        </tbody>
    </table>
</body>
</html>
