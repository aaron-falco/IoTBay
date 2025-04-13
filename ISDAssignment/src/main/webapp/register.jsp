<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - IoTBay</title>
</head>
<body>
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

    <br />
    <form action="landing.jsp">
        <input type="submit" value="Back to Landing Page" />
    </form>
</body>
</html>
