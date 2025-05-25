



<%@ page import="java.util.ArrayList" %>
<%@ page import="uts.isd.*" %>
<%@ page import="uts.isd.model.dao.DBManager" %>
<%
    DBManager manager = (DBManager) session.getAttribute("db");
    ArrayList<Product> products = null;

    if (manager != null) {
        try {
            products = manager.fetchProducts();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Product Catalog</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <ul>
        <li><a href="main.jsp">Home</a></li>
        <li><a href="Account.jsp">Account</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
    <div class="defaultDivStyle">
        <h2>Product Catalog</h2>
        <form action="searchProduct.jsp" method="get">
        <input type="text" name="keyword" placeholder="Search by name or type" required />
        <input type="submit" value="Search" />
        </form>

    <% 
        User user = (User) session.getAttribute("user");
        if (products != null && !products.isEmpty()) { %>
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
                    <td>
                        <form action="addtoCART.jsp" method="post">
                            <input type="hidden" name="productId" value="<%= p.getProductId() %>"/>
                            <input type="number" name="quantity" value="1" min="1" max="<%= p.getQuantity() %>"/>
                            <%if(user.getUserType() == 0) { %>
                            <input type="submit" value="Add to Cart" />
                            <% } %>
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>No products found or database connection not initialized.</p>
    <% } %> 
    
<!--        <form action="main.jsp" method="post">
        <button type="submit">Back</button>
        </form>-->
    </div>
</body>
</html>
