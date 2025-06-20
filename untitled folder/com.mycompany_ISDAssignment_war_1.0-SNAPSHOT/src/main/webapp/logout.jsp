<%-- 
    Document   : Signout
    Created on : 27 Mar 2025, 12:02:54 pm
    Author     : tomparry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Out</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        function confirmSignOut() {
            if (confirm("Are you sure you want to sign out?")) {
                window.location.href = 'goodbye.jsp';
            }
        }
        function cancel(){
            window.location.href = 'main.jsp';
        }
    </script>
</head>
<body>
    <div class="defaultDivStyle">
        <h1>Sign Out?</h1>
        <button class="button" onclick="confirmSignOut()">Sign Out</button>
        <br><br>
        <button class="button" onclick="cancel()">Cancel</button>
    </div>
</body>
</html>


