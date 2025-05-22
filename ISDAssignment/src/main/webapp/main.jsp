<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="uts.isd.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <ul>
        <li><a href="Catalog.jsp">Catalog</a></li>
        <li><a href="Account.jsp">Account</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
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
    <p>You are
<%
    switch (user.getUserType()) {
        case 0:
            out.print("a Customer");
            break;
        case 1:
            out.print("a Staff Member");
            break;
        case 2:
            out.print("an Admin");
            break;
        default:
            out.print("Not Logged In");
    }
%>
</p>
    <% if (user.getUserType() == 2) { %>
    <form action="MANAGERADD.jsp" method="post">
        <button type="submit">Edit Catalog</button>
    </form>
    <form action="ORDERMANAGEMENT.jsp" method="post">
        <button type="submit">Order Management</button>
    </form>
<% } %>

    <form action="Catalog.jsp" method="post">
        <button type="submit">Catalog</button>
    </form>
    <form action="logout.jsp" method="post">
        <button type="submit">Logout</button>
    </form>
    <form action="addPayment.jsp" method="post">
        <button type="submit">Add Payment</button>
    </form>

    <%
        }
    %>
    </div>
</body>
</html>
