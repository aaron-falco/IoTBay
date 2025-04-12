<%-- 
    Document   : login
    Created on : 28 Mar 2025, 2:19:19 pm
    Author     : aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="IoTBayStyles.css">
    </head>
    <body>
        <div class="defaultDivStyle">
        <h1>Login:</h1>        
        <form method="post" action="welcome.jsp">
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br><br>

            <input type="submit" value="Login">
        </form>
        </div>
    </body>
</html>
