<%-- 
    Document   : addtoCART
    Created on : 23 May 2025, 11:59:42 am
    Author     : Mandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Product" %>
<%@ page import="uts.isd.CartItem" %>
<%@ page import="uts.isd.model.dao.DBManager" %>

<%
    String productId = request.getParameter("productId");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    DBManager manager = (DBManager) session.getAttribute("db");
    ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<CartItem>();
    }

    boolean itemExists = false;

    if (manager != null) {
        Product product = manager.findProduct(productId);

        if (product != null) {
            for (CartItem item : cart) {
                if (item.getProduct().getProductId().equals(productId)) {
                    item.setQuantity(item.getQuantity() + quantity);
                    itemExists = true;
                    break;
                }
            }

            if (!itemExists) {
                cart.add(new CartItem(product, quantity));
            }
        }
    }

    session.setAttribute("cart", cart);
    response.sendRedirect("cart.jsp");
%>
