
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>jstl tage</h1>
<c:out value="${'welcome to jsp '}"></c:out>

<h1>jstl set tags </h1>
<c:set var="i" scope="session" value="${200+200 }"></c:set>
<c:out value="${i}"></c:out>


<h1>jstl romove tags </h1>

p> before removing value = <c:out value="${i}"/></p>
<c:out value="${i}"></c:out>
<c:remove var="i"/>
<p>after removing value = <c:out value="${i}"/></p>


</body>
</html>