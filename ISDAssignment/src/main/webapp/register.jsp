<%-- 
    Document   : register
    Created on : 28 Mar 2025, 2:18:55?pm
    Author     : lmao
--%>

<%@ page import="uts.isd.User" %>
<%@ page session="true" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register</h1>
        <form method="post" action="register.jsp">
            <label for="firstName">First Name:</label><br>
            <input type="text" id="firstName" name="firstName" required><br><br>

            <label for="lastName">Last Name:</label><br>
            <input type="text" id="lastName" name="lastName" required><br><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="username">Username:</label><br>
            <input type="text" id="username" name="username" required><br><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br><br>



            <input type="submit" value="Register">
        </form>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");

                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setEmail(email);
                user.setDob(dob);

                session.setAttribute("user", user);
                session.setAttribute("fullName", firstName + " " + lastName);

                response.sendRedirect("main.jsp");
            }
        %>

    </body>
</html>
