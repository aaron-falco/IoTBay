<%@ page import="uts.isd.model.Suppler" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Supplers</title>
</head>
<body>
    <h1>Suppler Information Management</h1>
    <form method="get" action="SupplerServlet">
        <input type="text" name="search" placeholder="Search..."/>
        <select name="type">
            <option value="contactName">Contact Name</option>
            <option value="company">Company</option>
        </select>
        <input type="submit" value="Search"/>
    </form>
    <a href="SupplerForm.jsp">Create New Suppler</a>
    <table border="1">
        <tr>
            <th>ID</th><th>Contact Name</th><th>Company</th><th>Email</th><th>Address</th><th>Status</th><th>Actions</th>
        </tr>
        <%
            ArrayList<Suppler> supplers = (ArrayList<Suppler>) request.getAttribute("supplers");
            if (supplers != null)
            for (Suppler s : supplers) {
        %>
        <tr>
            <td><%=s.getSupplerId()%></td>
            <td><%=s.getContactName()%></td>
            <td><%=s.getCompany()%></td>
            <td><%=s.getEmail()%></td>
            <td><%=s.getAddress()%></td>
            <td><%=s.isActive() ? "Active" : "Inactive"%></td>
            <td>
                <a href="SupplerServlet?action=edit&id=<%=s.getSupplerId()%>">Edit</a>
                <a href="SupplerServlet?action=toggle&id=<%=s.getSupplerId()%>">
                    <%= s.isActive() ? "Deactivate" : "Activate" %>
                </a>
                <a href="SupplerServlet?action=delete&id=<%=s.getSupplerId()%>" onclick="return confirm('Delete this suppler?');">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>