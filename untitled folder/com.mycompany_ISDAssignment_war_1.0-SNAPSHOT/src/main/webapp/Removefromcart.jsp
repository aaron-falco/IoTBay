<%-- 
    Document   : Removefromcart
    Created on : 22 May 2025, 3:32:58 am
    Author     : Mandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.CartItem" %>
<%@ page import="uts.isd.Product" %>

<%
    String productId = request.getParameter("productId");
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

    if (cart != null && productId != null) {
        for (int i = 0; i < cart.size(); i++) {
            CartItem item = cart.get(i);
            if (item.getProduct().getProductId().equals(productId)) {
                cart.remove(i);
                break; // exit after removing
            }
        }
        session.setAttribute("cart", cart);
    }

    response.sendRedirect("CART.jsp");
%>
