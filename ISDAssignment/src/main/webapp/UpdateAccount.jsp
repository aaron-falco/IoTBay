<%-- 
    Document   : UpdateAccount
    Created on : 21 May 2025, 4:34:34 pm
    Author     : Aaron
--%>
<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account</title>
    </head>
    <body>
        <%
            DBManager db = (DBManager) session.getAttribute("db");
            User user = (User) session.getAttribute("user");
            
            
            user.setFirstName(request.getParameter("firstName"));
            user.setLastName(request.getParameter("lastName"));
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));
            user.setPhoneNumber(request.getParameter("phoneNumber"));

            db.updateUser(user.getUserId(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(), user.getPhoneNumber(), user.getUserType());

            session.setAttribute("accountUpdated", true);
            session.setAttribute("user", user);
            response.sendRedirect("Account.jsp");
        %>
    </body>
</html>
