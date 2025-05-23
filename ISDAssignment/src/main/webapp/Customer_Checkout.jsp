<%-- 
    Document   : Customer_Checkout
    Created on : 23 May 2025, 12:07:18 pm
    Author     : Mandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Product" %>
<%@ page import="uts.isd.CartItem" %>
<%@ page import="uts.isd.model.dao.DBManager" %>

<%
    DBManager manager = (DBManager) session.getAttribute("db");
    String userId = (String) session.getAttribute("userId");
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

    // Debug prints to check what's available in session
    out.println("<p>Debug - Manager: " + manager + "</p>");
    out.println("<p>Debug - User ID: " + userId + "</p>");
    out.println("<p>Debug - Cart: " + (cart != null ? cart.size() + " items" : "null") + "</p>");

    if (manager != null && userId != null && cart != null && !cart.isEmpty()) {
        try {
            for (CartItem item : cart) {
                Product product = item.getProduct();
                int quantity = item.getQuantity();
                float price = product.getPrice() * quantity;
                String productId = product.getProductId();

                // Generate order ID using timestamp + productId
                String orderId = "ORD" + System.currentTimeMillis() + productId;

                manager.addOrder(orderId, userId, productId, price, quantity, "Unprocessed");

                // Store the last order ID to session (for payment linkage)
                session.setAttribute("lastOrderId", orderId);
            }

            // Clear the cart
            cart.clear();
            session.setAttribute("cart", cart);

            // Redirect to payment page
            response.sendRedirect("addPayment.jsp");

        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ Error placing order: " + e.getMessage() + "</p>");
        }
    } else {
%>
        <p style="color:red;">❌ Cart is empty or session expired.</p>
        <a href="Catalog.jsp">← Return to Catalog</a>
<%
    }
%>
