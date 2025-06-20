<%@ page import="uts.isd.model.Suppler" %>
<%
    Suppler suppler = (Suppler) request.getAttribute("suppler");
    boolean isEdit = suppler != null;
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= isEdit ? "Edit" : "New" %> Suppler</title>
</head>
<body>
    <h1><%= isEdit ? "Edit" : "Create" %> Suppler</h1>
    <form method="post" action="SupplerServlet">
        <% if (isEdit) { %>
            <input type="hidden" name="supplerId" value="<%= suppler.getSupplerId() %>"/>
        <% } %>
        Contact Name: <input type="text" name="contactName" value="<%= isEdit ? suppler.getContactName() : "" %>" required/><br>
        Company: <input type="text" name="company" value="<%= isEdit ? suppler.getCompany() : "" %>" required/><br>
        Email: <input type="email" name="email" value="<%= isEdit ? suppler.getEmail() : "" %>" required/><br>
        Address: <input type="text" name="address" value="<%= isEdit ? suppler.getAddress() : "" %>" required/><br>
        <% if (isEdit) { %>
            Active: <input type="checkbox" name="active" <%= suppler.isActive() ? "checked" : "" %> /><br>
        <% } %>
        <input type="submit" value="<%= isEdit ? "Update" : "Create" %>"/>
    </form>
    <a href="SupplerServlet">Back to list</a>
</body>
</html>