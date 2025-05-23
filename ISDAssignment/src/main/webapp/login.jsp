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
        <link rel="stylesheet" href="styles.css">
        <script>
            function cancel() {
                window.location.href = 'landing.jsp';
            }
        </script>
    </head>
    <body>
        <ul>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
        <div class="defaultDivStyle">
        <h1>Login:</h1>        
        <form method="post" action="welcome.jsp">
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br><br>
            <%
                if(session.getAttribute("loginAttemptFailed") != null){
                    %>
                        <p style="color: red"> Invalid login details. Please try again. <p>
                        <br><br>
                    <%
                }
            %>
            <input type="submit" value="Login">
        </form>
        <br><br>
        <button class='button' onclick="cancel()">Cancel</button>
        </div>
    </body>
</html>
