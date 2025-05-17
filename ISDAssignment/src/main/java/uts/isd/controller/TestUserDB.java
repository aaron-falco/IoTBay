package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import uts.isd.Product;

public class TestUserDB {
    private static Scanner in = new Scanner(System.in);
    private DBManager db;
    private Connection conn;

    public static void main(String[] args) {
        try {
            TestUserDB testUserDB = new TestUserDB();
            if (testUserDB.db != null) {
                testUserDB.runQueries();
            } else {
                System.out.println("Database not initialized.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TestUserDB() {
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
                    //testRead();
                    break;
                case 'U':
                    //testUpdate();
                    break;
                case 'D':
                    //testDelete();
                    break;
                case 'S':
                    //showAll();
                    break;
                default:
                    System.out.println("Unknown command");
                    break;
            }
        }
    }
    private void testAdd() {
        try {
            System.out.print("User ID: ");
            String id = in.nextLine();
            System.out.print("First Name: ");
            String firstName = in.nextLine();
            System.out.print("Last Name: ");
            String lastName = in.nextLine();
            System.out.print("Email: ");
            String email = in.nextLine(); 
            System.out.print("Password: ");
            String password = in.nextLine();
            System.out.print("Phone Number: ");
            String phoneNumber = in.nextLine();
            System.out.print("User Type: ");
            String userType = in.nextLine();

            db.addUser(id, firstName, lastName, password, email, phoneNumber, userType); 
            System.out.println("Product added.");
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error adding product.");
        }
    }
}
