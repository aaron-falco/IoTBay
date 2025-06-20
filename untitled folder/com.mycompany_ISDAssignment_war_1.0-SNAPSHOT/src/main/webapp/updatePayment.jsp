<%-- 
    Document   : updatePayment
    Created on : May 23, 2025, 9:26:48 AM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.PaymentInfo" %>
<%@ page import="uts.isd.model.dao.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Payment</title>
    </head>
    <body>
    <%
        String id = request.getParameter("paymentId");
        String orderId = request.getParameter("orderId");
        String type = request.getParameter("paymentType");
        String card = request.getParameter("cardNumber");
        String cvc = request.getParameter("cvc");
        String expiry = request.getParameter("expiryDate");
        float amount = Float.parseFloat(request.getParameter("paymentAmount"));
        String date = request.getParameter("paymentDate");

        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager manager = new DBManager(conn);

        PaymentInfo payment = new PaymentInfo();
        payment.setPaymentInfoId(id);
        payment.setOrderId(orderId);
        payment.setPaymentType(type);
        payment.setCardNumber(card);
        payment.setCvc(cvc);
        payment.setExpiryDate(expiry);
        payment.setPaymentAmount(amount);
        payment.setPaymentDate(date);

        try {
            manager.updatePayment(payment); 
            response.sendRedirect("viewPayments.jsp");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Update failed: " + e.getMessage() + "</p>");
        }
%>

    </body>
</html>
