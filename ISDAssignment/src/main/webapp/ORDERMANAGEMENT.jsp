<%-- 
    Document   : ordersmanagement
    Created on : 22 May 2025, 1:48:22?am
    Author     : Mandu
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Order" %>
<%@ page import="uts.isd.model.dao.DBManager" %> <%-- Replace with your actual DAO --%>
<%
    DBManager manager = (DBManager) session.getAttribute("manager");
    ArrayList<Order> orders = null;
    String message = "";
    Order foundOrder = null;

    if (manager != null) {
        try {
            String action = request.getParameter("action");
            if ("add".equals(action)) {
                String id = request.getParameter("orderId");
                String customerId = request.getParameter("customerId");
                String productId = request.getParameter("productId");
                float price = Float.parseFloat(request.getParameter("orderPrice"));
                int quantity = Integer.parseInt(request.getParameter("orderQuantity"));
                manager.addOrder(id, customerId, productId, price, quantity);
                message = "Order added successfully.";

            } else if ("update".equals(action)) {
                String id = request.getParameter("orderId");
                String customerId = request.getParameter("customerId");
                String productId = request.getParameter("productId");
                float price = Float.parseFloat(request.getParameter("orderPrice"));
                int quantity = Integer.parseInt(request.getParameter("orderQuantity"));
                manager.updateOrder(id, customerId, productId, price, quantity);
                message = "Order updated successfully.";

            } else if ("delete".equals(action)) {
                String id = request.getParameter("orderId");
                manager.deleteOrder(id);
                message = "Order deleted successfully.";

            } else if ("search".equals(action)) {
                String id = request.getParameter("orderId");
                foundOrder = manager.findOrder(id);
                if (foundOrder != null) {
                    message = "Order found.";
                } else {
                    message = "Order not found.";
                }
            }

            orders = manager.fetchOrders(); // always fetch fresh list
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Order Management</title>
</head>
<body>
    <h1>Order Management</h1>
    <p style="color:green;"><%= message %></p>

    <!-- Add/Update Form -->
    <h2>Add / Update Order</h2>
    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="add" />
        Order ID: <input type="text" name="orderId" required /><br />
        Customer ID: <input type="text" name="customerId" required /><br />
        Product ID: <input type="text" name="productId" required /><br />
        Price: <input type="text" name="orderPrice" required /><br />
        Quantity: <input type="number" name="orderQuantity" required /><br />
        <input type="submit" value="Add Order" />
    </form>

    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="update" />
        <h3>Update Existing Order</h3>
        Order ID: <input type="text" name="orderId" required /><br />
        Customer ID: <input type="text" name="customerId" required /><br />
        Product ID: <input type="text" name="productId" required /><br />
        Price: <input type="text" name="orderPrice" required /><br />
        Quantity: <input type="number" name="orderQuantity" required /><br />
        <input type="submit" value="Update Order" />
    </form>

    <!-- Delete Form -->
    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="delete" />
        <h3>Delete Order</h3>
        Order ID: <input type="text" name="orderId" required />
        <input type="submit" value="Delete Order" />
    </form>

    <!-- Search Form -->
    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="search" />
        <h3>Search Order by ID</h3>
        Order ID: <input type="text" name="orderId" required />
        <input type="submit" value="Search" />
    </form>

    <!-- Order Table -->
    <h2>All Orders</h2>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Customer ID</th>
            <th>Product ID</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>
        <%
            if (foundOrder != null) {
        %>
            <tr style="background-color: #f0f8ff;">
                <td><%= foundOrder.getOrderId() %></td>
                <td><%= foundOrder.getOrderCustomerId() %></td>
                <td><%= foundOrder.getOrderProductId() %></td>
                <td><%= foundOrder.getOrderPrice() %></td>
                <td><%= foundOrder.getQuantity() %></td>
            </tr>
        <%
            }
            if (orders != null) {
                for (Order o : orders) {
        %>
            <tr>
                <td><%= o.getOrderId() %></td>
                <td><%= o.getOrderCustomerId() %></td>
                <td><%= o.getOrderProductId() %></td>
                <td><%= o.getOrderPrice() %></td>
                <td><%= o.getQuantity() %></td>
            </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
