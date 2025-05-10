package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import uts.isd.Product;

public class TestDB {

    private static Scanner in = new Scanner(System.in);
    private DBManager db;
    private Connection conn;

    public static void main(String[] args) {
        try {
            TestDB testDB = new TestDB();
            if (testDB.db != null) {
                testDB.runQueries();
            } else {
                System.out.println("Database not initialized.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TestDB() {
        try {
            DBConnector connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private char readChoice() {
        System.out.print("Operation C/R/U/D/S or * to exit: ");
        return in.nextLine().toUpperCase().charAt(0);
    }

    private void runQueries() throws SQLException {
        char c;
        while ((c = readChoice()) != '*') {
            switch (c) {
                case 'C':
                    testAdd();
                    break;
                case 'R':
                    testRead();
                    break;
                case 'U':
                    testUpdate();
                    break;
                case 'D':
                    testDelete();
                    break;
                case 'S':
                    showAll();
                    break;
                default:
                    System.out.println("Unknown command");
                    break;
            }
        }
    }

    private void testAdd() {
        try {
            System.out.print("Product ID: ");
            String id = in.nextLine();
            System.out.print("Name: ");
            String name = in.nextLine();
            System.out.print("Description: ");
            String desc = in.nextLine();
            System.out.print("Quantity: ");
            int qty = Integer.parseInt(in.nextLine());
            System.out.print("Price: ");
            float price = Float.parseFloat(in.nextLine());

            db.addProduct(id, name, desc, qty, price);
            System.out.println("Product added.");
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error adding product.");
        }
    }

    private void testRead() {
        try {
            System.out.print("Enter product ID to find: ");
            String id = in.nextLine();
            Product product = db.findProduct(id);
            if (product != null) {
                System.out.println("Product found: " + product.getProductName());
            } else {
                System.out.println("Product not found.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error reading product.");
        }
    }

    private void testUpdate() {
        try {
            System.out.print("Product ID to update: ");
            String id = in.nextLine();
            System.out.print("New Name: ");
            String name = in.nextLine();
            System.out.print("New Description: ");
            String desc = in.nextLine();
            System.out.print("New Quantity: ");
            int qty = Integer.parseInt(in.nextLine());
            System.out.print("New Price: ");
            float price = Float.parseFloat(in.nextLine());

            db.updateProduct(id, name, desc, qty, price);
            System.out.println("Product updated.");
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error updating product.");
        }
    }

    private void testDelete() {
        try {
            System.out.print("Product ID to delete: ");
            String id = in.nextLine();
            db.deleteProduct(id);
            System.out.println("Product deleted.");
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error deleting product.");
        }
    }

private void showAll() {
    try {
        ArrayList<Product> products = db.fetchProducts();
        System.out.println("Products Table:");
        // Using printf to format the output properly
        products.forEach((product) -> {
            System.out.printf("%-20s %-30s %-50s %-10d %-10.2f\n", 
                product.getProductId(), 
                product.getProductName(), 
                product.getProductDescription(), 
                product.getQuantity(), 
                product.getPrice());
        });
        System.out.println();
    }
    catch(SQLException ex) {
        Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
    }
}

}
