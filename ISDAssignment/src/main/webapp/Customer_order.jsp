<%-- 
    Document   : Customer_order
    Created on : 23 May 2025, 11:28:21 am
    Author     : Nur Fatini Jamla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Order" %>
<%@ page import="uts.isd.model.dao.DBManager" %>

<%
    DBManager manager = (DBManager) session.getAttribute("manager");
    String userId = (String) session.getAttribute("userId");
    ArrayList<Order> orders = new ArrayList<Order>();
    String message = "";
    Order foundOrder = null;

    if (manager != null && userId != null) {
        try {
            String action = request.getParameter("action");

            if ("add".equals(action)) {
                String id = request.getParameter("orderId");
                String productId = request.getParameter("productId");
                float price = Float.parseFloat(request.getParameter("orderPrice"));
                int quantity = Integer.parseInt(request.getParameter("orderQuantity"));
                String status = request.getParameter("orderStatus");
                manager.addOrder(id, userId, productId, price, quantity, status);
                message = "✅ Order added successfully.";
            } else if ("update".equals(action)) {
                String id = request.getParameter("orderId");
                String productId = request.getParameter("productId");
                float price = Float.parseFloat(request.getParameter("orderPrice"));
                int quantity = Integer.parseInt(request.getParameter("orderQuantity"));
                String status = request.getParameter("orderStatus");
                manager.updateOrder(id, userId, productId, price, quantity, status);
                message = "✅ Order updated successfully.";
            } else if ("delete".equals(action)) {
                String id = request.getParameter("orderId");
                manager.deleteOrder(id);
                message = "🗑️ Order deleted.";
            } else if ("search".equals(action)) {
                String id = request.getParameter("orderId");
                foundOrder = manager.findOrder(id);
                message = (foundOrder != null) ? "🔍 Order found." : "❌ Order not found.";
            }

            orders = manager.searchOrdersByCustomer(userId);

        } catch (Exception e) {
            message = "❗ Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Orders</title>
    <link rel="stylesheet" href="IoTBayStyles.css">
</head>
<body>

<ul>
    <li><a href="Catalog.jsp">Catalog</a></li>
    <li><a href="Customer_order.jsp">My Orders</a></li>
    <li><a href="Account.jsp">Account</a></li>
    <li><a href="logout.jsp">Logout</a></li>
</ul>

<div class="defaultDivStyle">
    <h1>My Orders</h1>
    <p style="color:green;"><%= message %></p>

    <h2>Add Order</h2>
    <form method="get" action="Customer_order.jsp">
        <input type="hidden" name="action" value="add" />
        Order ID: <input type="text" name="orderId" required /><br /><br />
        Product ID: <input type="text" name="productId" required /><br /><br />
        Price: <input type="text" name="orderPrice" required /><br /><br />
        Quantity: <input type="number" name="orderQuantity" required /><br /><br />
        Status:
        <select name="orderStatus" required>
            <option value="Unprocessed">Unprocessed</option>
            <option value="Processed">Processed</option>
            <option value="Completed">Completed</option>
            <option value="Cancelled">Cancelled</option>
        </select><br /><br />
        <input type="submit" value="Add Order" />
    </form>

    <h2>Update Order</h2>
    <form method="get" action="Customer_order.jsp">
        <input type="hidden" name="action" value="update" />
        Order ID: <input type="text" name="orderId" required /><br /><br />
        Product ID: <input type="text" name="productId" required /><br /><br />
        Price: <input type="text" name="orderPrice" required /><br /><br />
        Quantity: <input type="number" name="orderQuantity" required /><br /><br />
        Status:
        <select name="orderStatus" required>
            <option value="Unprocessed">Unprocessed</option>
            <option value="Processed">Processed</option>
            <option value="Completed">Completed</option>
            <option value="Cancelled">Cancelled</option>
        </select><br /><br />
        <input type="submit" value="Update Order" />
    </form>

    <h2>Delete Order</h2>
    <form method="get" action="Customer_order.jsp">
        <input type="hidden" name="action" value="delete" />
        Order ID: <input type="text" name="orderId" required />
        <input type="submit" value="Delete Order" />
    </form>

    <h2>Search Order by ID</h2>
    <form method="get" action="Customer_order.jsp">
        <input type="hidden" name="action" value="search" />
        Order ID: <input type="text" name="orderId" required />
        <input type="submit" value="Search" />
    </form>

    <h2>Your Orders</h2>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Product ID</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Status</th>
        </tr>
        <% if (foundOrder != null && foundOrder.getOrderCustomerId().equals(userId)) { %>
        <tr style="background-color: #f0f8ff;">
            <td><%= foundOrder.getOrderId() %></td>
            <td><%= foundOrder.getOrderProductId() %></td>
            <td><%= foundOrder.getOrderPrice() %></td>
            <td><%= foundOrder.getQuantity() %></td>
            <td><%= foundOrder.getOrderStatus() %></td>
        </tr>
        <% } %>

        <% if (orders != null && !orders.isEmpty()) {
            for (Order o : orders) { %>
            <tr>
                <td><%= o.getOrderId() %></td>
                <td><%= o.getOrderProductId() %></td>
                <td><%= o.getOrderPrice() %></td>
                <td><%= o.getQuantity() %></td>
                <td><%= o.getOrderStatus() %></td>
            </tr>
        <%  }
        } else if (foundOrder == null) { %>
            <tr><td colspan="5">No orders found.</td></tr>
        <% } %>
    </table>
</div>

</body>
</html>
