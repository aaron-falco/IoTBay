<%-- 
    Document   : updateOrder
    Created on : 24 May 2025, 7:06:36 am
    Author     : Mandu
--%>

<%@ page import="uts.isd.model.dao.DBManager" %>
<%@ page import="uts.isd.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    DBManager manager = (DBManager) session.getAttribute("db");
    User user = (User) session.getAttribute("user");

    if (manager != null && user != null) {
        try {
            String orderId = request.getParameter("orderId");
            String productId = request.getParameter("productId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));
            String status = "Unprocessed";

            manager.updateOrder(orderId, user.getUserId(), productId, price, quantity, status);
            response.sendRedirect("viewCustomerOrder.jsp");

        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ Error updating order: " + e.getMessage() + "</p>");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
