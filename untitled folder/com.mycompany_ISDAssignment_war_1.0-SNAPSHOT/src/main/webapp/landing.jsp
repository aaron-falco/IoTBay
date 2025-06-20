 <%-- 
    Document   : landing
    Created on : 28 Mar 2025, 2:19:40 pm
    Author     : Nur Fatini Jamla Norlijam
--%>
<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.Product" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Landing</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>

        <ul>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
        <div class="defaultDivStyle">
            <h1>Welcome to IoTBay!</h1>
<!--        <p>Start your journey here – click below to register or login.</p>
            <a class="button" href="register.jsp">Register</a>
            <a class="button" href="login.jsp">Login</a>-->
        </div>
        
                <%
            try{
                // Connect to database
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                DBManager db = new DBManager(conn);
                
                session.setAttribute("db", db);
            }
            catch (Exception ex){
                out.print(ex.getMessage());
                %>
                <h2>Developer Note: Please create a JavaDB in the services window, named App with the username: isduser and password: admin. Then run the db.SQL file included in the project</h2>
                <%
            }
        %>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
