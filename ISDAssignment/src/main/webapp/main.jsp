<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="uts.isd.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="IoTBayStyles.css">
</head>
<body>
    <div class="defaultDivStyle">
    <h2>Main Page</h2>
    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
    %>
           <p>You are not logged in</p>
           <a href="register.jsp">Register</a>
    <%
        } else {  
    %>
    
        <p>Your email: <%= user.getEmail() %></p>
        <p>Your password: <%= user.getPassword() %></p>
    
    <% if(user.getFirstName() != null){ %>
    <p>Your first name: <%= user.getFirstName() %></p>
    <p>Your last name: <%= user.getLastName() %></p>
    <%}%>
    
    <form action="logout.jsp" method="post">
        <button type="submit">Logout</button>
    </form>
    <%
        }
    %>
    </div>
</body>
</html>
