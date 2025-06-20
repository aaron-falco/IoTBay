import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import uts.isd.UserLoginRecord;

public class TestLoginRecordDB {

    private static Scanner in = new Scanner(System.in);
    private DBManager db;
    private Connection conn;

    public static void main(String[] args) {
        try {
            TestLoginRecordDB testDB = new TestLoginRecordDB();
            if (testDB.db != null) {
                testDB.runQueries();
            } else {
                System.out.println("Database not initialized.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestLoginRecordDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public TestLoginRecordDB() {
        try {
            DBConnector connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestLoginRecordDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    

    private char readChoice() {
        System.out.print("Operation C/R/U/D/O or * to exit: ");
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
                case 'O':
                    testCount();
                    break;
                default:
                    System.out.println("Unknown command");
                    break;
            }
        }
    }
    
    private void testAdd() {
        try {
            System.out.print("Record ID: ");
            String recordId = in.nextLine();
            System.out.print("User ID: ");
            String userId = in.nextLine();
            System.out.print("Login Date: ");
            String loginDate = in.nextLine();
            System.out.print("Login Time: ");
            String loginTime = in.nextLine();
            System.out.print("Logout Date: ");
            String logoutDate = in.nextLine();
            System.out.print("Logout Time: ");
            String logoutTime = in.nextLine();
            
            UserLoginRecord u = new UserLoginRecord(recordId, userId, loginDate, loginTime, logoutDate, logoutTime);

            db.addLoginRecord(u.getLoginRecordId(), u.getUserId(), u.getLoginDate(), u.getLoginTime(), u.getLogoutDate(), u.getLogoutTime());
            System.out.println("Login Record added.");
        } catch (SQLException ex) {
            Logger.getLogger(TestLoginRecordDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error adding login record.");
        }
    }

    private char testReadChoices(){
        System.out.print("I = id, d = date, * = exit: ");
        return in.nextLine().toUpperCase().charAt(0);
    }
    
    private void testRead(){
        try{
            char c;
            ArrayList<UserLoginRecord> records;
            while ((c = testReadChoices()) != '*') {
                System.out.print("Enter user ID to find: ");
                String id = in.nextLine();
                switch (c) {
                    case 'I':
                        records = db.findLoginRecordFromUserId(id);
                        System.out.println("Login Records Table:");
                        System.out.printf("%-15s %-15s %-15s %-15s %-15s %-15s\n", 
                            "Record Id", "User Id", "Login Date", "Login Time", "Logout Date", "Logout Time");
                        if(records != null){
                            for (UserLoginRecord r : records){
                                System.out.printf("%-15s %-15s %-15s %-15s %-15s %-15s\n", 
                                    r.getLoginRecordId(),
                                    r.getUserId(),
                                    r.getLoginDate(),
                                    r.getLoginTime(),
                                    r.getLogoutDate(),
                                    r.getLogoutTime()
                                );
                                System.out.println();
                            }
                        }
                        break;
                    case 'D':
                        System.out.print("Enter date to find: ");
                        String date = in.nextLine();
                        records = db.findLoginRecordFromUserIdAndDate(id, date);
                        System.out.println("Login Records Table:");
                        System.out.printf("%-15s %-15s %-15s %-15s %-15s %-15s\n", 
                            "Record Id", "User Id", "Login Date", "Login Time", "Logout Date", "Logout Time");
                        if(records != null){
                            for (UserLoginRecord r : records){
                                System.out.printf("%-15s %-15s %-15s %-15s %-15s %-15s\n", 
                                    r.getLoginRecordId(),
                                    r.getUserId(),
                                    r.getLoginDate(),
                                    r.getLoginTime(),
                                    r.getLogoutDate(),
                                    r.getLogoutTime()
                                );
                                System.out.println();
                            }
                        }
                        break;
                    default:
                        System.out.println("Unknown command");
                        break;
                }
            }
        }
        catch (SQLException ex){
            Logger.getLogger(TestLoginRecordDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error reading user.");
        }
    }

    private void testUpdate() {
        try{
            System.out.print("Record ID to update: ");
            String id = in.nextLine();
            System.out.print("New Logout Date: ");
            String date = in.nextLine();
            System.out.print("New Logout Time: ");
            String time = in.nextLine();
            
            db.updateLoginRecord(id, date, time);
            System.out.println("Record updated.");            
        }
        catch (SQLException ex){
            Logger.getLogger(TestLoginRecordDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error updating record.");
        }
    }

    private void testDelete() {
        try{
            System.out.print("Record ID to delete: ");
            String id = in.nextLine();
            
            db.deleteUserLoginRecord(id);
            System.out.println("Record deleted.");            
        }
        catch (SQLException ex){
            Logger.getLogger(TestLoginRecordDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error deleting record.");
        }
    }

    private void testCount() {
        try{
            int count = db.getRowCountUserLoginRecords();
            System.out.println("Total login records: " + count);
        }
        catch (SQLException ex){
            Logger.getLogger(TestLoginRecordDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error retrieving record count.");
        }
    }
}
