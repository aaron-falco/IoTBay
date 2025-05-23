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
    <title>Your Shopping Cart</title>
    <style>
        table { width: 70%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid black; text-align: center; }
    </style>
</head>
<body>
    <h1>🛒 Your Cart</h1>

    <% if (cart == null || cart.isEmpty()) { %>
        <p>Your cart is empty.</p>
        <a href="Catalog.jsp">← Back to Shop</a>
    <% } else { %>
        <table>
            <tr>
                <th>Product Name</th>
                <th>Price (each)</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <% for (CartItem item : cart) {
                Product p = item.getProduct();
                float subtotal = item.getTotalPrice();
                total += subtotal;
            %>
            <tr>
                <td><%= p.getProductName() %></td>
                <td>$<%= p.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= subtotal %></td>
                <td>
        <form action="removeFromCart.jsp" method="post">
            <input type="hidden" name="productId" value="<%= p.getProductId() %>" />
            <input type="submit" value="Remove" />
        </form>
    </td>
</tr>
            </tr>
            <% } %>
            <tr>
                <td colspan="3"><strong>Total</strong></td>
                <td><strong>$<%= total %></strong></td>
            </tr>
        </table>

        <form action="Customer_Checkout.jsp" method="post">
            <input type="submit" value="Checkout Now" />
        </form>
        <br />
        <a href="Catalog.jsp">← Continue Shopping</a>
    <% } %>
</body>
</html>
