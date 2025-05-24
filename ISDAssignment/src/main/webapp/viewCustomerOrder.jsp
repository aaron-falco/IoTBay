<%-- 
    Document   : viewCustomerOrder.jsp
    Created on : 23 May 2025, 1:28:54 pm
    Author     : Mandu
--%>

<%@ page import="java.util.*, uts.isd.Order, uts.isd.User, uts.isd.model.dao.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    DBManager manager = (DBManager) session.getAttribute("db");
    User user = (User) session.getAttribute("user");
    ArrayList orders = new ArrayList(); // Java 1.5 compatible

    String keyword = request.getParameter("keyword");
    String message = "";

    if (manager != null && user != null) {
        try {
            if (keyword != null && !keyword.trim().isEmpty()) {
                orders = manager.searchOrdersByCustomerAndKeyword(user.getUserId(), keyword);
                message = "🔍 Showing results for: " + keyword;
            } else {
                orders = manager.searchOrdersByCustomer(user.getUserId());
            }
        } catch (Exception e) {
            message = "❌ Error: " + e.getMessage();
        }
    } else {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<ul>
    <li><a href="main.jsp">🏠 Home</a></li>
    <li><a href="Catalog.jsp">🛍 Catalog</a></li>
    <li><a href="CART.jsp">🛒 My Cart</a></li>
    <li><a href="logout.jsp">Logout</a></li>
</ul>

<div class="defaultDivStyle">
    <h1>📜 My Orders</h1>

    <form method="get" action="viewCustomerOrder.jsp">
        <input type="text" name="keyword" placeholder="Search by Order ID or Date..." />
        <input type="submit" value="Search" />
    </form>

    <p style="color:green;"><%= message %></p>

    <% if (orders == null || orders.isEmpty()) { %>
        <p>No orders found.</p>
    <% } else { %>
        <table border="1" cellpadding="10">
            <tr>
                <th>Order ID</th>
                <th>Product ID</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <%
                for (int i = 0; i < orders.size(); i++) {
                    Order o = (Order) orders.get(i);
            %>
            <tr>
                <td><%= o.getOrderId() %></td>
                <td><%= o.getOrderProductId() %></td>
                <td>$<%= o.getOrderPrice() %></td>
                <td><%= o.getQuantity() %></td>
                <td><%= o.getOrderStatus() %></td>
                <td>
                <% if ("Unprocessed".equals(o.getOrderStatus())) { %>
                    <!-- Update Form -->
                    <form method="post" action="updateOrder.jsp">
                        <input type="hidden" name="orderId" value="<%= o.getOrderId() %>" />
                        <input type="text" name="productId" value="<%= o.getOrderProductId() %>" required />
                        <input type="number" name="quantity" value="<%= o.getQuantity() %>" min="1" required />
                        <input type="text" name="price" value="<%= o.getOrderPrice() %>" required />
                        <input type="submit" value="Update" />
                    </form>
                    <!-- Cancel Button -->
                    <form method="post" action="cancelOrder.jsp" style="margin-top: 5px;">
                        <input type="hidden" name="orderId" value="<%= o.getOrderId() %>" />
                        <input type="submit" value="Cancel" />
                    </form>
                <% } else { %>
                    🔒 Finalised
                <% } %>
                </td>
            </tr>
            <% } %>
        </table>
    <% } %>
</div>
</body>
</html>
