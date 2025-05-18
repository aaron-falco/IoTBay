package uts.isd.model.dao;

import uts.isd.Product;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private Statement st;
    private Connection conn;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
        this.conn = conn;
    }

public Product findProduct(String productId) throws SQLException {
    String fetch = "SELECT * FROM ISDUSER.Products WHERE productId = '" + productId + "'";
    ResultSet rs = st.executeQuery(fetch);
    while (rs.next()) {
        String ProductId = rs.getString(1);
        if (ProductId.equals(productId)) {
            String productName = rs.getString(2);
            String productType = rs.getString(3);
            String productDes = rs.getString(4);
            int productQuantity = rs.getInt(5);
            float productPrice = rs.getFloat(6);
            return new Product(ProductId, productName, productType, productDes, productQuantity, productPrice);
        }
    }
    return null;
}


public void addProduct(String id, String name, String type, String desc, int quantity, float price) throws SQLException {
    String query = "INSERT INTO ISDUSER.Products VALUES ('" + id + "', '" + name + "', '" + type + "', '" + desc + "', " + quantity + ", " + price + ")";
    st.executeUpdate(query);
}


public void updateProduct(String id, String name, String type, String desc, int quantity, float price) throws SQLException {
    String query = "UPDATE ISDUSER.Products SET productName = '" + name + "', productType = '" + type + "', productDescription = '" + desc + "', quantity = " + quantity + ", price = " + price + " WHERE productId = '" + id + "'";
    st.executeUpdate(query);
}

public void deleteProduct(String id) throws SQLException {
    String query = "DELETE FROM ISDUSER.Products WHERE productId = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, id);
    int rowsAffected = ps.executeUpdate();

    if (rowsAffected == 0) {
        throw new SQLException("No product found with ID: " + id);
    }
}

    public ArrayList<Product> fetchProducts() throws SQLException {
    String fetch = "SELECT * FROM ISDUSER.Products";
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<Product> temp = new ArrayList<>();

    while (rs.next()) {
        String ProductId = rs.getString(1);
        String productName = rs.getString(2);
        String productType = rs.getString(3);
        String productDes = rs.getString(4);
        int productQuantity = rs.getInt(5);
        float productPrice = rs.getFloat(6);
        temp.add(new Product(ProductId, productName, productType, productDes, productQuantity, productPrice));
    }
    return temp;
}


    public boolean checkProduct(String id) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.Products WHERE productId = '" + id + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String productId = rs.getString(1);
            if (productId.equals(id)) {
                return true;
            }
        }
        return false;
    }

public ArrayList<Product> searchProductsByNameOrType(String keyword) throws SQLException {
    String query = "SELECT * FROM ISDUSER.Products WHERE LOWER(productName) LIKE LOWER('%" + keyword + "%') OR LOWER(productType) LIKE LOWER('%" + keyword + "%')";
    ResultSet rs = st.executeQuery(query);
    ArrayList<Product> results = new ArrayList<>();

    while (rs.next()) {
        String id = rs.getString("productId");
        String name = rs.getString("productName");
        String type = rs.getString("productType");
        String desc = rs.getString("productDescription");
        int qty = rs.getInt("quantity");
        float price = rs.getFloat("price");

        results.add(new Product(id, name, type, desc, qty, price));
    }
    return results;
}
}

