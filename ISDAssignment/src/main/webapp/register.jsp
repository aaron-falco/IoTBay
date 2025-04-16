<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - IoTBay</title>
    <link rel="stylesheet" href="IoTBayStyles.css">
    <script>
        function cancel() {
            window.location.href = 'landing.jsp';
        }
    </script>
</head>
<body>
    <div class="defaultDivStyle">
        <h2>Register Account</h2>
        <form action="welcome.jsp" method="post">
            <label for="firstName">First Name:</label><br />
            <input type="text" id="firstName" name="firstName" required /><br /><br />

            <label for="lastName">Last Name:</label><br />
            <input type="text" id="lastName" name="lastName" required /><br /><br />

            <label for="email">Email:</label><br />
            <input type="email" id="email" name="email" required /><br /><br />

            <label for="password">Password:</label><br />
            <input type="password" id="password" name="password" required /><br /><br />

            <input type="submit" value="Register" />
        </form>
        <br><br>
        <button class='button' onclick="cancel()">Cancel</button>
    </div>
</body>
</html>
