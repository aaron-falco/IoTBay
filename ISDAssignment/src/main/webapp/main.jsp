<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="uts.isd.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
%>

<ul>
    <li><a href="Catalog.jsp">Catalog</a></li>
    <li><a href="Account.jsp">Account</a></li>
    
    <% if (user != null && user.getUserType() == 0) { %>
        <li><a href="CART.jsp">🛒 My Cart</a></li>
        <li><a href="viewCustomerOrder.jsp">📜 My Orders</a></li>
        <li><a href="addPayment.jsp">Add Payment</a></li>
        <li><a href="viewPayment.jsp">View Payment</a></li>
    <% } %>
    <% if (user != null && user.getUserType() == 2) { %>
        <li><a href="MANAGERADD.jsp">Catalogue Manager</a></li>
        <li><a href="ORDERMANAGEMENT.jsp">Order Management</a></li>
    <% } %>
    <li><a href="logout.jsp">Logout</a></li>
</ul>

<div class="defaultDivStyle">
    <h2>Welcome to IoTBay</h2>

<%
    if (user == null) {
%>
    <p>You are not logged in.</p>
    <a href="login.jsp">Login</a> or <a href="register.jsp">Register</a>
<%
    } else {
%>
    <p>Email: <%= user.getEmail() %></p>
    <p>Password: <%= user.getPassword() %></p>

    <% if (user.getFirstName() != null) { %>
        <p>First Name: <%= user.getFirstName() %></p>
        <p>Last Name: <%= user.getLastName() %></p>
    <% } %>

    <p>You are 
    <%
        switch (user.getUserType()) {
            case 0: out.print("a Customer"); break;
            case 1: out.print("a Staff Member"); break;
            case 2: out.print("an Admin"); break;
            default: out.print("Unknown Role");
        }
    %>
    </p>



 
  
<% } %>

</div>
</body>
</html>
