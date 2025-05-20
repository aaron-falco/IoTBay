<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Product" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UPDATE PRODUCT</title>
    </head>
        <body>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                try {
                    String id = request.getParameter("id");
                    String name = request.getParameter("name");
                    String type = request.getParameter("type");
                    String desc = request.getParameter("desc");
                    int quant = Integer.parseInt(request.getParameter("quant"));
                    float price = Float.parseFloat(request.getParameter("price"));
                    DBManager manager = (DBManager) session.getAttribute("manager");

                    if (manager != null) {
                        manager.updateProduct(id, name, type, desc, quant, price);
                        out.println("<p style='color:green;'>Product Updated successfully!</p>");
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
