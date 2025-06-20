<%-- 
    Document   : CART
    Created on : 22 May 2025, 3:17:31 am
    Author     : NUR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.CartItem" %>
<%@ page import="uts.isd.Product" %>

<%
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
    float total = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        table { width: 70%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid black; text-align: center; }
        .button { padding: 8px 16px; border-radius: 5px; font-weight: bold; }
    </style>
</head>
<body>
    <div class="defaultDivStyle">
    <h1>🛒 Your Cart</h1>

    <%
        if (cart == null || cart.isEmpty()) {
    %>
        <p>Your cart is empty.</p>
        <a href="Catalog.jsp">← Back to Shop</a><br><br>
        <a href="main.jsp">🏠 Back to Main Page</a>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Product Name</th>
                <th>Price (each)</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>

            <% for (CartItem item : cart) {
                Product p = item.getProduct();
                float subtotal = item.getTotalPrice();
                total += subtotal;
            %>
            <tr>
                <td><%= p.getProductName() %></td>
                <td>$<%= String.format("%.2f", p.getPrice()) %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= String.format("%.2f", subtotal) %></td>
                <td>
                    <form action="Removefromcart.jsp" method="post">
                        <input type="hidden" name="productId" value="<%= p.getProductId() %>" />
                        <input type="submit" value="Remove" />
                    </form>
                </td>
            </tr>
            <% } %>

            <tr>
                <td colspan="3"><strong>Total</strong></td>
                <td colspan="2"><strong>$<%= String.format("%.2f", total) %></strong></td>
            </tr>
        </table>

        <form action="Customer_Checkout.jsp" method="post">
            <input type="submit" value="Checkout Now" />
        </form>
        <br />
        <a href="Catalog.jsp">← Continue Shopping</a><br><br>
        <a href="main.jsp">🏠 Back to Main Page</a>
    <%
        }
    %>
    </div>
</body>
</html>
