<%-- 
    Document   : viewCustomerOrder.jsp
    Created on : 23 May 2025, 1:28:54 pm
    Author     : Mandu
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Order" %>
<%@ page import="uts.isd.User" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    DBManager manager = (DBManager) session.getAttribute("db");
    User user = (User) session.getAttribute("user");
    ArrayList orders = new ArrayList(); // No diamond operator for Java 1.5

    if (manager != null && user != null) {
        try {
            orders = manager.searchOrdersByCustomer(user.getUserId());
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error fetching orders: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>User session not found or DBManager unavailable.</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <ul>
        <li><a href="main.jsp">🏠 Home</a></li>
        <li><a href="CART.jsp">🛒 My Cart</a></li>
    </ul>
    <div class="defaultDivStyle">
        <h1>📜 My Orders</h1>
        <% if (orders != null && !orders.isEmpty()) { %>
            <table border="1" cellpadding="10">
                <tr>
                    <th>Order ID</th>
                    <th>Product ID</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Status</th>
                </tr>
                <% for (int i = 0; i < orders.size(); i++) {
                       Order o = (Order) orders.get(i);
                %>
                    <tr>
                        <td><%= o.getOrderId() %></td>
                        <td><%= o.getOrderProductId() %></td>
                        <td>$<%= o.getOrderPrice() %></td>
                        <td><%= o.getQuantity() %></td>
                        <td><%= o.getOrderStatus() %></td>
                    </tr>
                <% } %>
            </table>
        <% } else { %>
            <p>You have no past orders.</p>
        <% } %>
        <br/>
        <a href="main.jsp">← Back to Main Page</a>
    </div>
</body>
</html>
