<%-- 
    Document   : deletePayment
    Created on : May 23, 2025, 9:17:59 AM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.dao.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Payment</title>
    </head>
    <body>
  <%
    String paymentId = request.getParameter("paymentId");
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager manager = new DBManager(conn);

    try {
        manager.deletePayment(paymentId);
        response.sendRedirect("viewPayments.jsp");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error deleting payment: " + e.getMessage() + "</p>");
    }
  %>
    </body>
</html>
