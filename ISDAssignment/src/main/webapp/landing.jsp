 <%-- 
    Document   : landing
    Created on : 28 Mar 2025, 2:19:40 pm
    Author     : Nur Fatini Jamla Norlijam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Landing</title>
        <link rel="stylesheet" href="IoTBayStyles.css">
    </head>
    <body>
        <div class="defaultDivStyle">
            <h1>Welcome to IoTBay!</h1>
            <p>Start your journey here – click below to register or login.</p>
            <a class="button" href="register.jsp">Register</a>
            <a class="button" href="login.jsp">Login</a>
        </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
