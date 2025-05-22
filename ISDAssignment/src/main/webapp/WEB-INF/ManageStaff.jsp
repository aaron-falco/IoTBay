<%@ page import="model.dao.Staff" %>
<%@ page import="java.util.List" %>
<html>
<head><title>Manage Staff</title></head>
<body>
    <h2>Staff List</h2>
    <table border="1">
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Position</th><th>Address</th></tr>
        <%
            List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
            for (Staff s : staffList) {
        %>
        <tr>
            <td><%= s.id %></td>
            <td><%= s.name %></td>
            <td><%= s.email %></td>
            <td><%= s.position %></td>
            <td><%= s.address %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
