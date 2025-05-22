package uts.isd.model.dao;

import uts.isd.Product;
import uts.isd.UserLoginRecord;
import uts.isd.Order;
import uts.isd.User;
import java.sql.*;
import uts.isd.PaymentInfo;
import java.util.List;
import java.util.ArrayList;


public class DBManager {
    private Statement st;
    private Connection conn;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
        this.conn = conn;
    }
    
    public void disconnect(){
        try{
            conn.close();
        }
        catch (SQLException ex){
            System.out.print(ex.getMessage());
        }
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
        return records;
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
        return records;
    }

    public void addProduct(String id, String name, String type, String desc, int quantity, float price) throws SQLException {
        String query = "INSERT INTO ISDUSER.Products VALUES ('" + id + "', '" + name + "', '" + type + "', '" + desc + "', " + quantity + ", " + price + ")";
        st.executeUpdate(query);
    }

    public void addUser(String id, String firstName, String lastName, String email, String password, String phoneNumber, int userType) throws SQLException {
        String query = "INSERT INTO ISDUser.USERS VALUES ('" + id + "', '" + firstName + "', '" + lastName + "', '" + password + "', '" + email + "', '" + phoneNumber + "', " + userType + ")";
        st.executeUpdate(query);
    }
    
    public boolean registerNewCustomer(String id, String firstName, String lastName, String email, String password, String phoneNumber) throws SQLException{
        if(phoneNumber.length() != 10){
            return false;
        }
        if(phoneNumber.charAt(0) != '0' || phoneNumber.charAt(1) != '4'){
            return false;
        }
        addUser(id, firstName, lastName, email, password, phoneNumber, 0);
        return true;
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
    
    public int getRowCountUsers() throws SQLException{
        String query = "SELECT COUNT(*) FROM ISDUser.USERS";
        ResultSet rs = st.executeQuery(query);
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }        
        return count;
    }
    
    public Order findOrder(String orderId) throws SQLException {
    String fetch = "SELECT * FROM ISDUSER.Orders WHERE orderId = '" + orderId + "'";
    ResultSet rs = st.executeQuery(fetch);

    while (rs.next()) {
        String id = rs.getString(1);
        if (id.equals(orderId)) {
            String customerId = rs.getString(2);
            String productId = rs.getString(3);
            float price = rs.getFloat(4);
            int qty = rs.getInt(5);
            String status = rs.getString (6);
            return new Order(id, customerId, productId, price, qty, status);
        }
    }
    return null;
    }
    public void addOrder(String id, String customerId, String productId, float price, int quantity) throws SQLException {
        String query = "INSERT INTO ISDUSER.Orders VALUES ('" + id + "', '" + customerId + "', '" + productId + "', " + price + ", " + quantity + ")";
        st.executeUpdate(query);
    }
    public void updateOrder(String id, String customerId, String productId, float price, int quantity, String status) throws SQLException {
        String query = "UPDATE ISDUSER.Orders SET orderCustomerId = '" + customerId + "', orderProductId = '" + productId + "', orderPrice = " + price + ", orderQuantity = " + quantity + ", orderStatus = '" + status +  "' WHERE orderId = '" + id + "'";
        st.executeUpdate(query);
    }
    public void deleteOrder(String id) throws SQLException {
        st.executeUpdate("DELETE FROM ISDUSER.Orders WHERE orderId = '" + id + "'");
    }
    public ArrayList<Order> fetchOrders() throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.Orders";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Order> temp = new ArrayList<>();

        while (rs.next()) {
            String id = rs.getString(1);
            String customerId = rs.getString(2);
            String productId = rs.getString(3);
            float price = rs.getFloat(4);
            int qty = rs.getInt(5);
            String status = rs.getString (6);
            temp.add(new Order(id, customerId, productId, price, qty, status));
        }
        return temp;
    }
    public boolean checkOrder(String id) throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.Orders WHERE orderId = '" + id + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            if (rs.getString(1).equals(id)) {
                return true;
            }
        }
        return false;
    }
    public ArrayList<Order> searchOrdersByCustomer(String customerId) throws SQLException {
        String query = "SELECT * FROM ISDUSER.Orders WHERE orderCustomerId = '" + customerId + "'";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Order> results = new ArrayList<>();

        while (rs.next()) {
            String id = rs.getString("orderId");
            String productId = rs.getString("orderProductId");
            float price = rs.getFloat("orderPrice");
            int qty = rs.getInt("orderQuantity");
            String status = rs.getString("orderStatus");

            results.add(new Order(id, customerId, productId, price, qty,status));
        }
        return results;
    }

    public void cancelOrdersByUserId(String userId) throws SQLException {
        String query = "UPDATE ISDUSER.ORDERS SET orderStatus = 'Cancelled' WHERE orderCustomerId = '" + userId + "'";
        st.executeUpdate(query);
    }

    public void addPayment(PaymentInfo payment) throws SQLException {
        String query = "INSERT INTO Payments (paymentInfoId, ORDERID, paymentType, cardNumber, cvc, expiryDate, paymentAmount, paymentDate) " +
                       "VALUES ('" + payment.getPaymentInfoId() + "', '" + payment.getOrderId() + "', '" + payment.getPaymentType() + "', '" +
                       payment.getCardNumber() + "', '" + payment.getCvc() + "', '" + payment.getExpiryDate() + "', " +
                       payment.getPaymentAmount() + ", '" + payment.getPaymentDate() + "')";

        Statement st = conn.createStatement();
        st.executeUpdate(query);
    }


        // Read (Retrieve by payment ID)
        public PaymentInfo getPaymentById(String paymentInfoId) throws SQLException {
            String query = "SELECT * FROM Payments WHERE paymentInfoId = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, paymentInfoId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    return extractPaymentFromResultSet(rs);
                }
            }
            return null;
        }

        // Read (All payments for an order/user)
        public ArrayList<PaymentInfo> getPaymentsByOrderId(String orderId) throws SQLException {
            String query = "SELECT * FROM Payments WHERE orderId = ?";
            ArrayList<PaymentInfo> payments = new ArrayList<>();
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, orderId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    payments.add(extractPaymentFromResultSet(rs));
                }
            }
            return payments;
        }

        // Update
        public void updatePayment(PaymentInfo payment) throws SQLException {
            String query = "UPDATE Payments SET paymentType=?, cardNumber=?, cvc=?, expiryDate=?, paymentAmount=?, paymentDate=? " +
                           "WHERE paymentInfoId=?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, payment.getPaymentType());
                stmt.setString(2, payment.getCardNumber());
                stmt.setString(3, payment.getCvc());
                stmt.setString(4, payment.getExpiryDate());
                stmt.setFloat(5, payment.getPaymentAmount());
                stmt.setString(6, payment.getPaymentDate());
                stmt.setString(7, payment.getPaymentInfoId());
                stmt.executeUpdate();
            }
        }

        // Delete
        public void deletePayment(String paymentInfoId) throws SQLException {
            String query = "DELETE FROM Payments WHERE paymentInfoId = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, paymentInfoId);
                stmt.executeUpdate();
            }
        }

        // Helper method
        private PaymentInfo extractPaymentFromResultSet(ResultSet rs) throws SQLException {
            PaymentInfo payment = new PaymentInfo();
            payment.setPaymentInfoId(rs.getString("paymentInfoId"));
            payment.setOrderId(rs.getString("orderId"));
            payment.setPaymentType(rs.getString("paymentType"));
            payment.setCardNumber(rs.getString("cardNumber"));
            payment.setCvc(rs.getString("cvc"));
            payment.setExpiryDate(rs.getString("expiryDate"));
            payment.setPaymentAmount(rs.getFloat("paymentAmount"));
            payment.setPaymentDate(rs.getString("paymentDate"));
            return payment;
        }
        public List<PaymentInfo> fetchAllPayments() throws SQLException {
        String query = "SELECT * FROM PAYMENTS";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        List<PaymentInfo> list = new ArrayList<>();
        while (rs.next()) {
            PaymentInfo p = new PaymentInfo();
            p.setPaymentInfoId(rs.getString("paymentInfoId"));
            p.setOrderId(rs.getString("orderId"));
            p.setPaymentType(rs.getString("paymentType"));
            p.setCardNumber(rs.getString("cardNumber"));
            p.setCvc(rs.getString("cvc"));
            p.setExpiryDate(rs.getString("expiryDate"));
            p.setPaymentAmount(rs.getFloat("paymentAmount"));
            p.setPaymentDate(rs.getString("paymentDate"));
            list.add(p);
        }
        return list;
    }
        
}

