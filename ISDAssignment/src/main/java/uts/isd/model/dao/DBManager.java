package uts.isd.model.dao;

import uts.isd.Product;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public Product findProduct(String productId) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.Products WHERE productId = '" + productId + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String ProductId = rs.getString(1);
            if (ProductId.equals(productId)) {
                String productName = rs.getString(2);
                String productDes = rs.getString(3);
                int productQuantity = rs.getInt(4);
                float productPrice = rs.getFloat(5);
                return new Product(ProductId, productName, productDes, productQuantity, productPrice);
            }
        }
        return null;
    }

    public void addProduct(String id, String name, String desc, int quantity, float price) throws SQLException {
        st.executeUpdate("INSERT INTO ISDUSER.Products VALUES ('" + id + "', '" + name + "','" + desc + "', " + quantity + ", " + price + ")");
        }

    public void updateProduct(String id, String name, String desc, int quantity, float price) throws SQLException {
        st.executeUpdate("UPDATE ISDUSER.Products SET productName = '" + name + "', productDescription = '" + desc + "', quantity = " + quantity + ", price = " + price + " WHERE productId = '" + id + "'");
    }

    public void deleteProduct(String id) throws SQLException {
        st.executeUpdate("DELETE FROM ISDUSER.Products WHERE productId = '" + id + "'");
    }

    public ArrayList<Product> fetchProducts() throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.Products";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList<>();

        while (rs.next()) {
            String ProductId = rs.getString(1);
            String productName = rs.getString(2);
            String productDes = rs.getString(3);
            int productQuantity = rs.getInt(4);
            float productPrice = rs.getFloat(5);
            temp.add(new Product(ProductId, productName, productDes, productQuantity, productPrice));
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
}
