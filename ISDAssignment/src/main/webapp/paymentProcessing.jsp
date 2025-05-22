<%-- 
    Document   : paymentProcessing
    Created on : May 22, 2025, 5:47:52 PM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.PaymentInfo" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles.css">
        <div style="width: 400px; margin: 0 auto;">
    </head>
    <body>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                try {
                    String id = request.getParameter("orderId");
                    String name = request.getParameter("paymentType");
                    String type = request.getParameter("cardNumber");
                    String desc = request.getParameter("cvc");
                    String date = request.getParameter("expiryDate");
                    int amount = Integer.parseInt(request.getParameter("paymentAmount"));
                    String paymentDate = request.getParameter("paymentDate");
                    DBManager manager = (DBManager) session.getAttribute("manager");

                if (manager != null) {
                    PaymentInfo payment = new PaymentInfo();
                    payment.setPaymentInfoId("P" + System.currentTimeMillis()); // or another ID generator
                    payment.setOrderId(id);
                    payment.setPaymentType(name);
                    payment.setCardNumber(type);
                    payment.setCvc(desc);
                    payment.setExpiryDate(date);
                    payment.setPaymentAmount(amount);
                    payment.setPaymentDate(paymentDate);

                    manager.addPayment(payment);

                        out.println("<p style='color:green;'>Payment added successfully!</p>");
                    } else {
                        out.println("<p style='color:red;'>Error: DBManager not found in session.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p>Invalid request method.</p>");
            }
        %>
        <form action="addPayment.jsp" method="get">
        <button type="submit">Back to Payment Form</button>
        </form>

    </body>
</html>
