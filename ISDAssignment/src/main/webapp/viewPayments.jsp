<%-- 
    Document   : viewPayments
    Created on : May 22, 2025, 9:58:07 PM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.PaymentInfo" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Payments</title>
        <link rel="stylesheet" href="styles.css">
        <div style="width: 400px; margin: 0 auto;">
    </head>
    
    <body>
        <h2></h2>

<%
    try {
        // Connect to database
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager manager = new DBManager(conn);

        if (manager != null) {
            List<PaymentInfo> payments = manager.fetchAllPayments();

            if (payments != null && !payments.isEmpty()) {
%>
<div style="border: 2px solid #333; border-radius: 8px; padding: 20px; background-color: white; width: 90%; margin: auto; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
    <h2 style="text-align:center;">All Payments</h2>
</div>

<div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; padding: 10px 50px;">
<%
    for (PaymentInfo p : payments) {
%>
    <div style="border: 1px solid #ccc; padding: 12px; width: 250px; border-radius: 6px; background-color: #f9f9f9;">
        <p><strong>ID:</strong> <%= p.getPaymentInfoId() %></p>
        <p><strong>Order ID:</strong> <%= p.getOrderId() %></p>
        <p><strong>Type:</strong> <%= p.getPaymentType() %></p>
        <p><strong>Card:</strong> <%= p.getCardNumber() %></p>
        <p><strong>CVC:</strong> <%= p.getCvc() %></p>
        <p><strong>Expiry:</strong> <%= p.getExpiryDate() %></p>
        <p><strong>Amount:</strong> <%= p.getPaymentAmount() %></p>
        <p><strong>Date:</strong> <%= p.getPaymentDate() %></p>
    </div>
<%
                }
            } else {
                out.println("<p>No payments found.</p>");
            }
        } else {
            out.println("<p style='color:red;'>DBManager not found.</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

    <br>
    <form action="addPayment.jsp" method="get">
        <button type="submit">Back to Payment Form</button>
    </form>
    </body>
</html>
