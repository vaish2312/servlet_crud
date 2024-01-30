
<%@ page import="java.sql.*" %>
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

		
		Connection con = DriverManager
				.getConnection(
						"jdbc:mysql://localhost:3306/servlet","root", "root");
		String sql = "insert into jsp_registration(User_name,Email,Phone_Number,Password)values(?,?,?,?) ";
		
	      PreparedStatement ps = con.prepareStatement(sql);

		

		  String name= request.getParameter("User_Name");
          String email= request.getParameter("Email");
          String phone= request.getParameter("Phone_Number");
          String password= request.getParameter("Password");
          
          
          
          ps.setString(1,name);
          ps.setString(2,email);
          ps.setString(3,phone);
          ps.setString(4,password);
          
          
          int status=ps.executeUpdate();
          if(status>0){
        	  response.sendRedirect("read.jsp"); 
          }else{
        	  out.print("data not  succesfully inserted");
          }

	} catch (Exception e) {
		e.printStackTrace();
	}
 
 %>
     
</body>
</html>