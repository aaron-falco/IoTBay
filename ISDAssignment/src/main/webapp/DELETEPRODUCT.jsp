<%-- 
    Document   : DELETEPRODUCT
    Created on : 17 May 2025, 3:02:04 pm
    Author     : tomparry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Product" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE PRODUCT</title>
    </head>
    <body>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                try {
                    String id = request.getParameter("id");
                    DBManager manager = (DBManager) session.getAttribute("manager");

                    if (manager != null) {
                        manager.deleteProduct(id);
                        out.println("<p style='color:green;'>Product Deleted successfully!</p>");
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
        
                <form action="MANAGERADD.jsp" method="post">
            <button type="submit">Back</button>
        </form>
    </body>
</html>
