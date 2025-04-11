<%-- 
    Document   : main
    Created on : 28 Mar 2025, 2:19:55 pm
    Author     : aaron
--%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="uts.isd.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>
<h2>Welcome Page</h2>
<%
        User user = (User) session.getAttribute("user");
        if (user == null) {
         %>
<p>You are not logged in</p>
<a href="register.jsp">Register</a>
        }
<%
          } else {  
    %>
<p>Hello, <%= user.getUsername() %>!</p>
<p>Your email: <%= user.getEmail() %></p>
<form action="logout.jsp" method="post">
<button type="submit">Logout</button>
</form>
</body>
</html>