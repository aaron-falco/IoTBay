<%-- 
    Document   : viewPayments
    Created on : May 22, 2025, 9:58:07 PM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, uts.isd.model.dao.DBManager, uts.isd.PaymentInfo" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Payments</title>
        <link rel="stylesheet" href="IoTBayStyles.css">
        <div style="width: 400px; margin: 0 auto;">
    </head>
    <body>
        <h2>All Payments</h2>

<%
    DBManager manager = (DBManager) session.getAttribute("manager");

    if (manager != null) {
        List<PaymentInfo> payments = manager.fetchAllPayments();

        if (payments != null && !payments.isEmpty()) {
%>
        <table>
            <tr>
                <th>ID</th><th>Order ID</th><th>Type</th><th>Card</th>
                <th>CVC</th><th>Expiry</th><th>Amount</th><th>Date</th>
            </tr>
<%
            for (PaymentInfo p : payments) {
%>
            <tr>
                <td><%= p.getPaymentInfoId() %></td>
                <td><%= p.getOrderId() %></td>
                <td><%= p.getPaymentType() %></td>
                <td><%= p.getCardNumber() %></td>
                <td><%= p.getCvc() %></td>
                <td><%= p.getExpiryDate() %></td>
                <td><%= p.getPaymentAmount() %></td>
                <td><%= p.getPaymentDate() %></td>
            </tr>
<%
            }
        } else {
            out.println("<p>No payments found.</p>");
        }
    } else {
        out.println("<p style='color:red;'>DBManager not found in session.</p>");
    }
%>
    </table>

    <br>
    <form action="addPayment.jsp" method="get">
        <button type="submit">Back to Payment Form</button>
    </form>
    </body>
</html>
