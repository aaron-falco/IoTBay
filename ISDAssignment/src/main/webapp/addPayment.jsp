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
<%--
    <label for="paymentId">Payment ID:</label><br>
    <input type="text" name="paymentId" required><br><br>
    
    <label for="orderId">Order ID:</label><br>
    <input type="text" name="orderId" required><br><br
--%>
    
    <label for="paymentType">Payment Type:</label><br>
    <select name="paymentType" required>
        <option value="">-- Select Payment Type --</option>
        <option value="Credit Card">Visa</option>
        <option value="Debit Card">MasterCard</option>
        <option value="PayPal">PayPal</option>
    
    </select><br><br>

    <label for="cardNumber">Card Number:</label><br>
    <input type="number" name="cardNumber" required><br><br>

    <label for="cvc">CVC:</label><br>
    <input type="number" name="cvc" min="001" max="999" required><br><br>

    <label for="expiryDate">Expiry Date (MM/YY):</label><br>
    <input type="text" name="expiryDate" id="expiryDate" placeholder="MM/YY" required 
           onblur="validateExpiryDate()"><br><br>

    <script>
    function validateExpiryDate() {
        const input = document.getElementById("expiryDate").value.trim();
        const regex = /^(0[1-9]|1[0-2])\/\d{2}$/;

        if (!regex.test(input)) {
            alert("Invalid format. Use MM/YY.");
            return false;
        }

        const [month, year] = input.split("/").map(Number);
        const currentDate = new Date();
        const currentYear = currentDate.getFullYear() % 100; // e.g. 25 for 2025
        const currentMonth = currentDate.getMonth() + 1; // getMonth() is 0-indexed

        if (year < currentYear || (year === currentYear && month < currentMonth)) {
            alert("Card has expired.");
            document.getElementById("expiryDate").value = "";
            return false;
        }

        return true;
    }
    </script>

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
