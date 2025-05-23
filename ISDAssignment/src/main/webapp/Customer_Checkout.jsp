<%-- 
    Document   : Customer_Checkout
    Created on : 23 May 2025, 12:07:18 pm
    Author     : Mandu
--%>

<%@ page import="java.util.*, uts.isd.*, uts.isd.model.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    DBManager manager = (DBManager) session.getAttribute("db");
    User user = (User) session.getAttribute("user");
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
    
    String userId;
    if (user != null) {
        userId = user.getUserId();
    } else {
        // Assign guest ID for anonymous checkout
        userId = "guest_" + System.currentTimeMillis();
    }

    out.println("<p><strong>Debug - Manager:</strong> " + manager + "</p>");
    out.println("<p><strong>Debug - User ID:</strong> " + userId + "</p>");
    out.println("<p><strong>Debug - Cart:</strong> " + (cart == null ? "null" : cart.size() + " items") + "</p>");

    if (manager != null && cart != null && !cart.isEmpty()) {
        try {
            for (CartItem item : cart) {
                Product product = item.getProduct();
                int quantity = item.getQuantity();
                float price = product.getPrice() * quantity;
                String productId = product.getProductId();

                // Order ID with max 25 characters
                String orderId = "ORD" + System.currentTimeMillis() + productId;
                if (orderId.length() > 25) {
                    orderId = orderId.substring(0, 25);
                }

                manager.addOrder(orderId, userId, productId, price, quantity, "Unprocessed");
                session.setAttribute("lastOrderId", orderId);
            }

            cart.clear();
            session.setAttribute("cart", cart);
            response.sendRedirect("addPayment.jsp");

        } catch (Exception e) {
            out.println("<p style='color:red;'><strong>❌ Error placing order:</strong> " + e.getMessage() + "</p>");
        }
    } else {
%>
    <p style="color:red;"><strong>❌ Cart is empty or session expired.</strong></p>
    <a href="Catalog.jsp">← Return to Catalog</a>
<%
    }
%>
