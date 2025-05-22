<%-- 
    Document   : addPayment
    Created on : May 22, 2025, 4:59:47 PM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddPayment</title>
        <link rel="stylesheet" href="styles.css">
        <div style="width: 400px; margin: 0 auto;">
    </head>
    <body>
        <h2>Add Payment</h2>

<%-- Display message or error if available --%>
<%
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
    if (message != null) {
%>
    <p style="color: green; font-weight: bold;"><%= message %></p>
<%
    } else if (error != null) {
%>
    <p style="color: red; font-weight: bold;"><%= error %></p>
<%
    }
%>


<form action="paymentProcessing.jsp" method="post">
    <label for="paymentId">Payment ID:</label><br>
    <input type="text" name="paymentId" required><br><br>
    
    <label for="orderId">Order ID:</label><br>
    <input type="text" name="orderId" required><br><br>
    
    <label for="paymentType">Payment Type:</label><br>
    <select name="paymentType" required>
        <option value="">-- Select Payment Type --</option>
        <option value="Credit Card">Visa</option>
        <option value="Debit Card">MasterCard</option>
        <option value="PayPal">Amex</option>
    
    </select><br><br>

    <label for="cardNumber">Card Number:</label><br>
    <input type="text" name="cardNumber" required><br><br>

    <label for="cvc">CVC:</label><br>
    <input type="text" name="cvc" required><br><br>

    <label for="expiryDate">Expiry Date (MM/YY):</label><br>
    <input type="text" name="expiryDate" required><br><br>

    <label for="paymentAmount">Amount:</label><br>
    <input type="number" name="paymentAmount" step="0.01" required><br><br>

    <label for="paymentDate">Payment Date (YYYY-MM-DD):</label><br>
    <input type="text" name="paymentDate" required><br><br>

    <input type="submit" value="Submit Payment">
    
</form>
<form action="main.jsp" method="get">
    <button type="submit">Back</button>
</form>
    </body>
</html>
