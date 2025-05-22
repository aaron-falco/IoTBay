<%@ page import="model.dao.Supplier" %>
<%@ page import="java.util.List" %>
<html>
<head><title>Manage Suppliers</title></head>
<body>
    <h2>Supplier List</h2>
    <table border="1">
        <tr><th>ID</th><th>Contact Name</th><th>Company</th><th>Email</th><th>Address</th></tr>
        <%
            List<Supplier> supplierList = (List<Supplier>) request.getAttribute("supplierList");
            for (Supplier s : supplierList) {
        %>
        <tr>
            <td><%= s.id %></td>
            <td><%= s.contactName %></td>
            <td><%= s.company %></td>
            <td><%= s.email %></td>
            <td><%= s.address %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
