<%-- 
    Document   : register
    Created on : 28 Mar 2025, 2:18:55 pm
    Author     : lmao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    <script>
                function handleRegister(event) {
                    alert("Registration successful!");{
                    window.location.href = 'landing.jsp'; 
                }
            }
    </script>
</head>
    <body>
        <h1>Register</h1>
        <form method="post" action="index.html" onsubmit="handleRegister(event)">
        <label for="name">First Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        <label for="name">Last Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

                    <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>

                    <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br><br>

                    <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>

                    <input type="submit" value="Register">

        </form>
    </body>
</html>
