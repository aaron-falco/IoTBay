<%-- 
    Document   : editPayment
    Created on : May 23, 2025, 9:40:02 AM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.dao.*, uts.isd.PaymentInfo, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Payment</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
    <%
        String paymentId = request.getParameter("paymentId");

        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager manager = new DBManager(conn);

        PaymentInfo payment = manager.getPaymentById(paymentId);

        if (payment != null) {
    %>
        <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
            <form action="updatePayment.jsp" method="post" style="border: 1px solid #ccc; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); width: 300px; background: #fff;">
                <h2 style="text-align: center;">Edit Payment Details</h2>
                
                <input type="hidden" name="paymentId" value="<%= payment.getPaymentInfoId() %>">
                <%--
                <label>Order ID:</label><br>
                <input type="text" name="orderId" value="<%= payment.getOrderId() %>" required><br><br>
                --%>
                
                <label>Payment Type:</label><br>
                <select name="paymentType" required>
                    <option value="Credit Card" <%= "Credit Card".equals(payment.getPaymentType()) ? "selected" : "" %>>MasterCard</option>
                    <option value="Debit Card" <%= "Debit Card".equals(payment.getPaymentType()) ? "selected" : "" %>>Visa</option>
                    <option value="PayPal" <%= "PayPal".equals(payment.getPaymentType()) ? "selected" : "" %>>PayPal</option>
                </select><br><br>

                <label>Card Number:</label><br>
                <input type="text" name="cardNumber" value="<%= payment.getCardNumber() %>" required><br><br>

                <label>CVC:</label><br>
                <input type="text" name="cvc" value="<%= payment.getCvc() %>" required><br><br>

                <label>Expiry Date:</label><br>
                <input type="text" name="expiryDate" value="<%= payment.getExpiryDate() %>" required><br><br>

                <label>Amount:</label><br>
                <input type="number" step="0.01" name="paymentAmount" value="<%= payment.getPaymentAmount() %>" required><br><br>

                <label>Payment Date:</label><br>
                <input type="text" name="paymentDate" value="<%= payment.getPaymentDate() %>" required><br><br>

                <button type="submit" style="width: 100%; padding: 10px; font-weight: bold;">Update Payment</button>
            </form>
        </div>
    <%
        } else {
            out.println("<p style='color:red;'>Payment record not found.</p>");
        }
    %>
    </body>
</html>
