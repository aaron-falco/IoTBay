<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.Product" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manager Catalog Editor</title>
</head>
<body>
    <h1>Manager Catalog Editor</h1>

    <%
        DBManager manager = (DBManager) session.getAttribute("manager");
        ArrayList<Product> products = null;

        if (manager != null) {
            try {
                products = manager.fetchProducts();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p style='color:red;'>DBManager not found in session.</p>");
        }
    %>

    <% if (products != null && !products.isEmpty()) { %>
        <table border="1" cellpadding="10">
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
    <% } else { %>
        <p>No products found.</p>
    <% } %>

    <h3>Add Product</h3>
    <form method="post" action="ADDPRODUCT.jsp">
        <label for="id">Product ID:</label><br>
        <input type="text" id="id" name="id" required><br><br>

        <label for="name">Product Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="type">Product Type:</label><br>
        <input type="text" id="type" name="type" required><br><br>

        <label for="desc">Product Description:</label><br>
        <input type="text" id="desc" name="desc" required><br><br>

        <label for="quant">Product Quantity:</label><br>
        <input type="number" id="quant" name="quant" required><br><br>

        <label for="price">Product Price:</label><br>
        <input type="number" step="0.01" id="price" name="price" required><br><br>

        <input type="submit" value="Add">
    </form>
        <h3>Delete Product</h3>
        <form method="post" action="DELETEPRODUCT.jsp">
                    <label for="id">Product ID:</label><br>
        <input type="text" id="id" name="id" required><br><br>
                    <input type="submit" value="Delete">
    </form>
                <form action="main.jsp" method="post">
            <button type="submit">Back</button>
        </form>
</body>
</html>
