<%-- 
    Document   : register
    Created on : 28 Mar 2025, 2:18:55?pm
    Author     : lmao
--%>


<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="IoTBayStyles.css">
    </head>
    <body>
        <div class="defaultDivStyle">
        <h1>Register</h1>
        <form method="post" action="welcome.jsp">
            <label for="firstName">First Name:</label><br>
            <input type="text" id="firstName" name="firstName" required><br><br>

            <label for="lastName">Last Name:</label><br>
            <input type="text" id="lastName" name="lastName" required><br><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br><br>

            <input type="submit" value="Register">
        </form>
        </div>
    </body>
</html>
