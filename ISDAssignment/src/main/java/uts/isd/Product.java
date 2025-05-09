package uts.isd;

import java.io.IOException;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.*;

public class Product implements Serializable {

    private String productId;
    private String productName;
    private String productDescription;
    private int quantity;
    private float price;

    public Product(String productId, String productName, String productDescription, int quantity, float price) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.quantity = quantity;
        this.price = price;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    // Method to get all products from the database
    public static List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String dbUrl = "jdbc:sqlite:src/main/resources/products.db"; // Path to SQLite database file
        String query = "SELECT * FROM products";

        try (Connection conn = DriverManager.getConnection(dbUrl);  // Connect to the SQLite database
             PreparedStatement ps = conn.prepareStatement(query);  // Prepare the SQL query
             ResultSet rs = ps.executeQuery()) {  // Execute the query

            while (rs.next()) {
                Product product = new Product(
                        rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("productDescription"),
                        rs.getInt("quantity"),
                        rs.getFloat("price")
                );
                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    // Method to initialize the database using the SQL script
    public static void initializeDatabase() {
        String dbPath = "src/main/resources/db.sql"; // Path to db.sql script
        String dbUrl = "jdbc:sqlite:src/main/resources/products.db"; // Path to SQLite database file

        try (Connection conn = DriverManager.getConnection(dbUrl)) {
            Statement stmt = conn.createStatement();
            
            // Read the SQL script file and execute it
            String sqlScript = new String(Files.readAllBytes(Paths.get(dbPath)), StandardCharsets.UTF_8); // Read SQL script
            stmt.execute(sqlScript);  // Execute the SQL script to create tables and insert data

            System.out.println("Database initialized successfully.");

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId='" + productId + '\'' +
                ", productName='" + productName + '\'' +
                ", productDescription='" + productDescription + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }
}
