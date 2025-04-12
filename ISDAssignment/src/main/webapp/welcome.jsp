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
        <link rel="stylesheet" href="IoTBayStyles.css">
    </head>
    <body>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String firstName;
                String lastName;
                
                User user = new User();

                user.setPassword(password);
                user.setEmail(email);                
                
                if(request.getParameter("firstName") != null){
                    firstName = request.getParameter("firstName");
                    lastName = request.getParameter("lastName");
                    user.setFirstName(firstName);
                    user.setLastName(lastName);
                }

                session.setAttribute("user", user);

                response.sendRedirect("main.jsp");
            }
        %>
        
        <div class="defaultDivStyle">
            <p>If not automatically redirected click <a href="main.jsp">HERE</a>.</p>
        </div>
    </body>
</html>
