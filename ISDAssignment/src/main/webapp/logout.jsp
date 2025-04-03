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
    <script>
        function confirmSignOut() {
            if (confirm("Are you sure you want to sign out?")) {
                window.location.href = 'index.html';
                
            }
        }
    </script>
</head>
<body>
    <%
        session.invalidate();
        %>
    <h1>Sign Out?</h1>
    <button onclick="confirmSignOut()">Sign Out</button>
</body>
</html>


