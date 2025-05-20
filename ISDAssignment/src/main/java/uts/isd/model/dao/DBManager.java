package uts.isd.model.dao;

import uts.isd.Product;
import uts.isd.UserLoginRecord;
import uts.isd.PaymentInfo;
import uts.isd.Order;
import uts.isd.User;
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

    public User findUserFromId(String searchId) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.Users WHERE userId = '" + searchId + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String userId = rs.getString(1);
            if (userId.equals(searchId)) {
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String password = rs.getString(4);
                String email = rs.getString(5);
                String phoneNumber = rs.getString(6);
                int userType = rs.getInt(7);
                return new User(userId, firstName, lastName, password, email, phoneNumber, userType);
            }
        }
        return null;
    }

    public User findUserFromEmail(String searchEmail) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.Users WHERE email = '" + searchEmail + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String email = rs.getString(5);
            if (searchEmail.equals(email)) {
                String userId = rs.getString(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String password = rs.getString(4);
                String phoneNumber = rs.getString(6);
                int userType = rs.getInt(7);
                return new User(userId, firstName, lastName, password, email, phoneNumber, userType);
            }
        }
        return null;
    }
    
    public ArrayList<UserLoginRecord> findLoginRecordFromUserId(String searchUserId) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.UserLoginRecords WHERE userId = '" + searchUserId + "'";        
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<UserLoginRecord> records = new ArrayList<>();
        while (rs.next()) {
            String userId = rs.getString(2);
            if (searchUserId.equals(userId)) {
                records.add(new UserLoginRecord(
                        rs.getString(1),
                        userId,
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                        
                ));
            }
        }
        if(records.isEmpty()) { return null; }
        else { return records; }
    }
    
    public ArrayList<UserLoginRecord> findLoginRecordFromUserIdAndDate(String searchUserId, String searchDate) throws SQLException{
        String fetch = "SELECT * FROM ISDUSER.UserLoginRecords WHERE userId = '" + searchUserId + "' AND loginDate = '" + searchDate + "'";        
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<UserLoginRecord> records = new ArrayList<>();
        while (rs.next()) {
            String userId = rs.getString(2);
            String loginDate = rs.getString(3);
            if (searchUserId.equals(userId) && searchDate.equals(loginDate)) {
                records.add(new UserLoginRecord(
                        rs.getString(1),
                        userId,
                        loginDate,
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                        
                ));
            }
        }
        if(records.isEmpty()) { return null; }
        else { return records; }
    }

    public void addProduct(String id, String name, String type, String desc, int quantity, float price) throws SQLException {
        String query = "INSERT INTO ISDUSER.Products VALUES ('" + id + "', '" + name + "', '" + type + "', '" + desc + "', " + quantity + ", " + price + ")";
        st.executeUpdate(query);
    }

    public void addUser(String id, String firstName, String lastName, String email, String password, String phoneNumber, int userType) throws SQLException {
        String query = "INSERT INTO ISDUser.USERS VALUES ('" + id + "', '" + firstName + "', '" + lastName + "', '" + password + "', '" + email + "', '" + phoneNumber + "', " + userType + ")";
        st.executeUpdate(query);
    }
    
    public void addLoginRecord(String recordId, String userId, String loginDate, String loginTime, String logoutDate, String logoutTime) throws SQLException {
        String query = "INSERT INTO ISDUser.USERLOGINRECORDS VALUES ('" + recordId + "', '" + userId + "', '" + loginDate + "', '" + loginTime + "', '" + logoutDate + "', '" + logoutTime + "')";
        st.executeUpdate(query);
    }

    public void updateProduct(String id, String name, String type, String desc, int quantity, float price) throws SQLException {
        String query = "UPDATE ISDUSER.Products SET productName = '" + name + "', productType = '" + type + "', productDescription = '" + desc + "', quantity = " + quantity + ", price = " + price + " WHERE productId = '" + id + "'";
        st.executeUpdate(query);
    }
    
    public void updateUser(String userId, String firstName, String lastName, String email, String password, String phoneNumber, int userType) throws SQLException{
        String query = "UPDATE ISDUser.USERS SET firstName = '" + firstName + "', lastName = '" + lastName + "', password = '" + password + "', email = '" + email + "', phoneNumber = '" + phoneNumber + "', userType = " + userType + " WHERE userId = '" + userId + "'";
        st.executeUpdate(query);
    }
    
    public void updateLoginRecord(String recordId, String logoutDate, String logoutTime) throws SQLException {
        String query = "UPDATE ISDUser.USERLOGINRECORDS SET logoutDate = '" + logoutDate + "', logoutTime = '" + logoutTime + "' WHERE loginRecordId = '" + recordId + "'";
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
    
    public void deleteUser(String userId) throws SQLException {
        st.executeUpdate("DELETE FROM ISDUSER.USERS WHERE userId = '" + userId + "'");
    }
    
    public void deleteUserLoginRecord(String recordId) throws SQLException {
        st.executeUpdate("DELETE FROM ISDUSER.USERLOGINRECORDS WHERE loginRecordId = '" + recordId + "'");
    }
    
    public ArrayList<User> fetchUsers() throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.USERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> temp = new ArrayList<>();

        while (rs.next()) {
            String userId = rs.getString(1);
            String firstName = rs.getString(2);
            String lastName = rs.getString(3);
            String password = rs.getString(4);
            String email = rs.getString(5);
            String phoneNumber = rs.getString(6);
            int userType = rs.getInt(7);
            temp.add(new User(userId, firstName, lastName, password, email, phoneNumber, userType));
        }
        return temp;
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
    
    public int getRowCountUserLoginRecords() throws SQLException {
        String query = "SELECT COUNT(*) FROM ISDUser.USERLOGINRECORDS";
        ResultSet rs = st.executeQuery(query);
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        
        return count;
    }
}

