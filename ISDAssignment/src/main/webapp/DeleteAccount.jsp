<%-- 
    Document   : DeleteAccount
    Created on : 22 May 2025, 12:30:46 pm
    Author     : Aaron
--%>

<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.*" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
    </head>
    <body>
        <%
            try{
                DBManager db = (DBManager) session.getAttribute("db");
                User user = (User) session.getAttribute("user");
                db.deleteUser(user.getUserId());
                db.disconnect();
                session.invalidate();
                response.sendRedirect("landing.jsp");
            }
            catch (Exception ex){
            %><p><%= ex.getMessage() %></p><%
            }
        %>
    </body>
</html>
