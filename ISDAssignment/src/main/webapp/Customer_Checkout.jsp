<%-- 
    Document   : Customer_Checkout
    Created on : 23 May 2025, 12:07:18 pm
    Author     : Mandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.CartItem" %>
<%@ page import="uts.isd.Product" %>
<%@ page import="uts.isd.model.dao.DBManager" %>

<%
    DBManager manager = (DBManager) session.getAttribute("db");
    String userId = (String) session.getAttribute("userId");
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

    if (manager != null && cart != null && userId != null) {
        try {
            for (CartItem item : cart) {
                Product product = item.getProduct();
                int quantity = item.getQuantity();
                float price = product.getPrice() * quantity;
                String productId = product.getProductId();

                // Simple unique order ID using current time + productId
                String orderId = "ORD" + System.currentTimeMillis() + productId;

                manager.addOrder(orderId, userId, productId, price, quantity, "Unprocessed");

                // Optionally store the orderId for payment processing
                session.setAttribute("lastOrderId", orderId);
            }

            // Clear the cart
            cart.clear();
            session.setAttribute("cart", cart);

            // Redirect to payment page
            response.sendRedirect("addPayment.jsp");

        } catch (Exception e) {
            out.println("<p>Error placing order: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>Cart is empty or session expired. <a href='Catalog.jsp'>Return to Catalog</a></p>");
    }
%>
