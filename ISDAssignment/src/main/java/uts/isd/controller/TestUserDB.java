package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import uts.isd.User;

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
            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TestUserDB() {
        try {
            DBConnector connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);
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
            int userType = Integer.parseInt(in.nextLine());

            db.addUser(id, firstName, lastName, email, password, phoneNumber, userType); 
            System.out.println("User added.");
        } catch (SQLException ex) {
            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error adding user.");
        }
    }
    
    private char testReadChoices(){
        System.out.print("I = id, E = email, * = exit: ");
        return in.nextLine().toUpperCase().charAt(0);
    }
    
    private void testRead(){
        try{
            char c;
            User user;
            while ((c = testReadChoices()) != '*') {
                switch (c) {
                    case 'I':
                        System.out.print("Enter user ID to find: ");
                        String id = in.nextLine();
                        user = db.findUserFromId(id);
                        if (user != null) {
                            System.out.println("User found: " + user.getEmail());
                        } else {
                            System.out.println("User not found.");
                        }
                        break;
                    case 'E':
                        System.out.print("Enter user Email to find: ");
                        String email = in.nextLine();
                        user = db.findUserFromEmail(email);
                        if (user != null) {
                            System.out.println("User found: " + user.getUserId());
                        } else {
                            System.out.println("User not found.");
                        }
                        break;
                    default:
                        System.out.println("Unknown command");
                        break;
                }
            }
        }
        catch (SQLException ex){
            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error reading user.");
        }
    }
    
    public void testUpdate(){
        try{
            System.out.print("User ID to update: ");
            String id = in.nextLine();
            System.out.print("New First Name: ");
            String firstName = in.nextLine();
            System.out.print("New Last Name: ");
            String lastName = in.nextLine();
            System.out.print("New Email: ");
            String email = in.nextLine();
            System.out.print("New Password: ");
            String password = in.nextLine();
            System.out.print("New Phone Number: ");
            String phoneNumber = in.nextLine();
            System.out.print("New User Type: ");
            int userType = Integer.parseInt(in.nextLine());

            db.updateUser(id, firstName, lastName, email, password, phoneNumber, userType);
            System.out.println("User updated.");
        }
        catch (SQLException ex){
            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error updating user.");
        }
    }
    
    public void testDelete() {
        try{
            System.out.print("User Id: ");
            String userId = in.nextLine();
            
            db.deleteUser(userId);
            System.out.println("User deleted.");
        }
        catch (SQLException ex){
            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error deleting user.");
        }
    }
    
    public void showAll(){
        try {
            ArrayList<User> users = db.fetchUsers();
            System.out.println("Users Table:");
            System.out.printf("%-10s %-25s %-25s %-40s %-50s %-12s %-10s\n", 
                "ID", "First Name", "Last Name", "Password", "Email", "Phone Number", "User Type");

            for (User u : users) {
                System.out.printf("%-10s %-25s %-25s %-40s %-50s %-12s %-1d\n",
                        u.getUserId(),
                        u.getFirstName(),
                        u.getLastName(),
                        u.getPassword(),
                        u.getEmail(),
                        u.getPhoneNumber(),
                        u.getUserType());
            }
            System.out.println();
        } catch (SQLException ex) {
            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error fetching users.");
        }
    }
}
