<%-- 
    Document   : ordersmanagement
    Created on : 22 May 2025, 1:48:22?am
    Author     : Mandu
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Order" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<%
    DBManager manager = (DBManager) session.getAttribute("db");
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
                String status = request.getParameter("orderStatus");
                manager.addOrder(id, customerId, productId, price, quantity, status);
                message = "Order added successfully.";

            } else if ("update".equals(action)) {
                String id = request.getParameter("orderId");
                String customerId = request.getParameter("customerId");
                String productId = request.getParameter("productId");
                float price = Float.parseFloat(request.getParameter("orderPrice"));
                int quantity = Integer.parseInt(request.getParameter("orderQuantity"));
                String status = request.getParameter("orderStatus");
                manager.updateOrder(id, customerId, productId, price, quantity, status);
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

            orders = manager.fetchOrders();
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

    <h2>Add Order</h2>
    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="add" />
        Order ID: <input type="text" name="orderId" required /><br />
        Customer ID: <input type="text" name="customerId" required /><br />
        Product ID: <input type="text" name="productId" required /><br />
        Price: <input type="text" name="orderPrice" required /><br />
        Quantity: <input type="number" name="orderQuantity" required /><br />
        Status:
        <select name="orderStatus" required>
            <option value="Unprocessed">Unprocessed</option>
            <option value="Processed">Processed</option>
            <option value="Completed">Completed</option>
            <option value="Cancelled">Cancelled</option>
        </select><br />
        <input type="submit" value="Add Order" />
    </form>

    <h2>Update Existing Order</h2>
    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="update" />
        Order ID: <input type="text" name="orderId" required /><br />
        Customer ID: <input type="text" name="customerId" required /><br />
        Product ID: <input type="text" name="productId" required /><br />
        Price: <input type="text" name="orderPrice" required /><br />
        Quantity: <input type="number" name="orderQuantity" required /><br />
        Status:
        <select name="orderStatus" required>
            <option value="Unprocessed">Unprocessed</option>
            <option value="Processed">Processed</option>
            <option value="Completed">Completed</option>
            <option value="Cancelled">Cancelled</option>
        </select><br />
        <input type="submit" value="Update Order" />
    </form>

    <h2>Delete Order</h2>
    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="delete" />
        Order ID: <input type="text" name="orderId" required />
        <input type="submit" value="Delete Order" />
    </form>

    <h2>Search Order by ID</h2>
    <form method="get" action="orders.jsp">
        <input type="hidden" name="action" value="search" />
        Order ID: <input type="text" name="orderId" required />
        <input type="submit" value="Search" />
    </form>

    <h2>All Orders</h2>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Customer ID</th>
            <th>Product ID</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Status</th>
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
                <td><%= foundOrder.getOrderStatus() %></td>
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
                <td><%= o.getOrderStatus() %></td>
            </tr>
        <%
                }
            }
        %>
    </table>

    <form action="main.jsp" method="get" style="display: inline;">
        <input type="submit" value="Main Page" />
    </form>
</body>
</html>
