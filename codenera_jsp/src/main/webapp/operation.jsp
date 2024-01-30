<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% int count = 0; %>
    <% int sum = 0; %>

    <%-- Loop through numbers 1 to 10 --%>
    <%
        for (int i = 1; i <= 10; i++) {
            if (i % 2 == 0) {
           
                out.println(i + "<br>");

                
                count++;
                sum += i;
            }
        }
    %>

    <%-- Print count and sum --%>
    <p>Total count of even numbers: <%= count %></p>
    <p>Sum of even numbers: <%= sum %></p>

</body>
</html>