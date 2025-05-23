<%-- 
    Document   : Customer_order
    Created on : 23 May 2025, 11:28:21 am
    Author     : Nur Fatini Jamla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Order" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<%@ page import="uts.isd.User" %>

<%
    DBManager manager = (DBManager) session.getAttribute("db");
    User user = (User) session.getAttribute("user");
    ArrayList<Order> orders = null;
    String message = "";

    if (manager != null && user != null) {
        try {
            String action = request.getParameter("action");
            String customerId = user.getUserId();

            if ("searchById".equals(action)) {
                String orderId = request.getParameter("orderId");
                Order found = manager.findOrder(orderId);
                orders = new ArrayList<>();
                if (found != null && found.getOrderCustomerId().equals(customerId)) {
                    orders.add(found);
                    message = "🔍 Order found.";
                } else {
                    message = "❌ Order not found or does not belong to you.";
                }
            } else if ("searchByDate".equals(action)) {
                String date = request.getParameter("date");
                orders = manager.searchOrdersByDate(customerId, date);
                message = "📅 Orders filtered by date.";
            } else if ("cancel".equals(action)) {
                String cancelId = request.getParameter("orderId");
                manager.cancelOrder(cancelId);
                message = "🗑️ Order cancelled.";
                orders = manager.searchOrdersByCustomer(customerId);
            } else if ("edit".equals(action)) {
                String id = request.getParameter("orderId");
                String productId = request.getParameter("productId");
                float price = Float.parseFloat(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                manager.updateOrder(id, customerId, productId, price, quantity, "Unprocessed");
                message = "✏️ Order updated.";
                orders = manager.searchOrdersByCustomer(customerId);
            } else {
                orders = manager.searchOrdersByCustomer(customerId);
            }
        } catch (Exception e) {
            message = "❗ Error: " + e.getMessage();
        }
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
        <li><a href="CART.jsp">🛒 Cart</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>

    <div class="defaultDivStyle">
        <h2>📦 My Orders</h2>
        <p style="color:green;"><%= message %></p>

        <form method="get" action="customer_orders.jsp">
            <input type="hidden" name="action" value="searchById" />
            Search by Order ID: 
            <input type="text" name="orderId" required />
            <input type="submit" value="Search" />
        </form>

        <form method="get" action="customer_orders.jsp">
            <input type="hidden" name="action" value="searchByDate" />
            Search by Order Date (e.g., 2025):
            <input type="text" name="date" required />
            <input type="submit" value="Search by Date" />
        </form>

        <br/>

        <table border="1">
            <tr>
                <th>Order ID</th>
                <th>Product ID</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <%
                if (orders != null && !orders.isEmpty()) {
                    for (Order o : orders) {
            %>
                <tr>
                    <td><%= o.getOrderId() %></td>
                    <td><%= o.getOrderProductId() %></td>
                    <td>$<%= o.getOrderPrice() %></td>
                    <td><%= o.getQuantity() %></td>
                    <td><%= o.getOrderStatus() %></td>
                    <td>
                    <% if ("Unprocessed".equals(o.getOrderStatus())) { %>
                        <!-- Edit form -->
                        <form method="get" action="customer_orders.jsp" style="display:inline;">
                            <input type="hidden" name="action" value="edit" />
                            <input type="hidden" name="orderId" value="<%= o.getOrderId() %>" />
                            <input type="text" name="productId" value="<%= o.getOrderProductId() %>" required />
                            <input type="number" name="quantity" value="<%= o.getQuantity() %>" min="1" required />
                            <input type="text" name="price" value="<%= o.getOrderPrice() %>" required />
                            <input type="submit" value="Update" />
                        </form>
                        <!-- Cancel form -->
                        <form method="get" action="customer_orders.jsp" style="display:inline;">
                            <input type="hidden" name="action" value="cancel" />
                            <input type="hidden" name="orderId" value="<%= o.getOrderId() %>" />
                            <input type="submit" value="Cancel" />
                        </form>
                    <% } else { %>
                        🔒 Finalised
                    <% } %>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr><td colspan="6">No orders found.</td></tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
