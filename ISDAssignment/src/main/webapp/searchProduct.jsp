<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.Product" %>
<%@ page import="java.sql.*" %>
<%
    String keyword = request.getParameter("keyword");

    if (keyword != null && !keyword.trim().isEmpty()) {
        try {
            // Setup DB connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            // Fetch results
            ArrayList<Product> products = db.searchProductsByNameOrType(keyword);
%>
            <h2>Search Results for "<%= keyword %>":</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <% for (Product p : products) { %>
                    <tr>
                        <td><%= p.getProductId() %></td>
                        <td><%= p.getProductName() %></td>
                        <td><%= p.getProductType() %></td>
                        <td><%= p.getProductDescription() %></td>
                        <td><%= p.getQuantity() %></td>
                        <td>$<%= p.getPrice() %></td>
                    </tr>
                <% } %>
            </table>
<%
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>Please enter a search keyword.</p>");
    }
%>
<button onclick="window.location.href='Catalog.jsp'">Back</button>