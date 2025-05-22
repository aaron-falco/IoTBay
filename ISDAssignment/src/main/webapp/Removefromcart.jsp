<%-- 
    Document   : Removefromcart
    Created on : 22 May 2025, 3:32:58 am
    Author     : Mandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%
    String productId = request.getParameter("productId");
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

    if (cart != null && productId != null) {
        cart.removeIf(item -> item.getProduct().getProductId().equals(productId));
        session.setAttribute("cart", cart);
    }

    response.sendRedirect("cart.jsp");
%>
