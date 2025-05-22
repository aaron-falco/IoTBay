/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

import uts.isd.PaymentInfo;
import uts.isd.model.dao.DBConnector;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Steven
 */
public class PaymentDAO {
    private Connection conn;

    public PaymentDAO(Connection conn) {
        this.conn = conn;
    }

    // Create (Insert)
    public void addPayment(PaymentInfo payment) throws SQLException {
        String query = "INSERT INTO Payments(paymentInfoId, orderId, paymentType, cardNumber, cvc, expiryDate, paymentAmount, paymentDate) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, payment.getPaymentInfoId());
            stmt.setString(2, payment.getOrderId());
            stmt.setString(3, payment.getPaymentType());
            stmt.setString(4, payment.getCardNumber());
            stmt.setString(5, payment.getCvc());
            stmt.setString(6, payment.getExpiryDate());
            stmt.setFloat(7, payment.getPaymentAmount());
            stmt.setString(8, payment.getPaymentDate());
            stmt.executeUpdate();
        }
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
}
