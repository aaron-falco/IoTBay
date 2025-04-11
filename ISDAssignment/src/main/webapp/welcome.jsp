<%-- 
    Document   : welcome
    Created on : 28 Mar 2025, 2:19:01 pm
    Author     : aaron
--%>

<%@ page import="uts.isd.User" %>
<%@ page session="true" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                User user = new User();
                user.setPassword(password);
                user.setEmail(email);

                session.setAttribute("user", user);

                response.sendRedirect("main.jsp");
            }
        %>
    </body>
</html>
