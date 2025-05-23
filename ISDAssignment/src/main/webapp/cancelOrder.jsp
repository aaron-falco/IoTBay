<%-- 
    Document   : cancelOrder
    Created on : 24 May 2025, 7:09:29 am
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
            manager.cancelOrder(orderId);
            response.sendRedirect("viewCustomerOrder.jsp");
        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ Error cancelling order: " + e.getMessage() + "</p>");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
