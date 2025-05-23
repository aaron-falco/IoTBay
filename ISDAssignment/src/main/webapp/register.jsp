<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - IoTBay</title>
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
        <li><a href="landing.jsp">Home</a></li>
    </ul>
    <div class="defaultDivStyle">        
        <h2>Register Account</h2>
        <form action="RegisterUser.jsp" method="post">
            <label for="firstName">First Name:</label><br>
            <input type="text" id="firstName" name="firstName" required ><br><br>

            <label for="lastName">Last Name:</label><br>
            <input type="text" id="lastName" name="lastName" required ><br><br>

            <label for="email">Email:</label><br />
            <input type="email" id="email" name="email" required ><br><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required ><br><br>
            
            <label for="phoneNumber">Phone Number:</label><br>
            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="0412345678" pattern="04[0-9]{8}" required>
            <br><br>
            <input type="submit" value="Register" />
            <%
                if(session.getAttribute("registrationFailed") != null){
                    %>
                        <p style="color: red"> Invalid registration details. Please try again. <p>
                        <br><br>
                    <%
                }
                else if (session.getAttribute("userEmailTaken") != null){
                    %>
                        <p style="color: red"> There is already a user registered under that email. Please <a href="login.jsp">Login</a> or try again. <p>
                        <br><br>
                    <%
                }
            %>
        </form>
        <br><br>
        <button class='button' onclick="cancel()">Cancel</button>
    </div>
</body>
</html>
