<%-- 
    Document   : welcome
    Created on : 28 Mar 2025, 2:19:01 pm
    Author     : aaron
--%>
<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.User" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
class SelectExample {
   static final String DB_URL = "jdbc:derby://localhost:1527//IoTBay [ on APP]";
   static final String USER = "";
   static final String PASS = "";
   static final String QUERY = "SELECT * FROM USERS";
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" href="IoTBayStyles.css">
    </head>
    <body>
        <%
            try {
                // Connect to database
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                DBManager db = new DBManager(conn);
                
                // Setup database connection classes as session variables?
                
                // If POST form sent to page     
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    
                    User user = db.findUserFromEmail(email);
                    
                    // If user with email doesn't exist or if the password doesn't match
                    if(user == null || !password.equals(user.getPassword())){
                        session.setAttribute("loginAttempFailed", true);
                        response.sendRedirect("login.jsp");
                    }
                    else{
                        session.setAttribute("user", user);
                        response.sendRedirect("main.jsp");
                    }
                    %>
                    <div class="defaultDivStyle">
                        <p>If not automatically redirected click <a href="main.jsp">HERE</a>.</p>
                    </div>
                    <%
                }
                else{
                    response.sendRedirect("login.jsp");
                    %>
                    <div class="defaultDivStyle">
                        <p>If not automatically redirected click <a href="login.jsp">HERE</a>.</p>
                    </div>
                <%}
            }
            catch (Exception ex){
                System.out.println(ex.getMessage());
            }
        %>
    </body>
</html>
