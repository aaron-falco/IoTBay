<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="uts.isd.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="uts.isd.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    
    <%
        // Initialize the database (you can put this in a separate method to call when needed)
        Product.initializeDatabase();  // Calls the method to initialize the database from db.sql

        // Retrieve all products from the database
        List<Product> products = Product.getAllProducts();

        // Set the products list as a request attribute to use with JSTL
        pageContext.setAttribute("products", products);
    %>

    <!-- Display products using JSTL -->
    <table border="1">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.productName}</td>
                    <td>${product.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
