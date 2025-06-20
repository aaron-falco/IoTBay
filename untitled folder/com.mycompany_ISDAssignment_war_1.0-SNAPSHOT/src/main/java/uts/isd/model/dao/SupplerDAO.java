package uts.isd.model.dao;

import uts.isd.Suppler;
import java.sql.*;
import java.util.*;

public class SupplerDAO {
    private Connection conn;

    public SupplerDAO(Connection conn) {
        this.conn = conn;
    }

    // Create
    public void addSuppler(String contactName, String company, String email, String address) throws SQLException {
        String sql = "INSERT INTO SUPPLER (contactName, company, email, address, active) VALUES (?, ?, ?, ?, TRUE)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, contactName);
            ps.setString(2, company);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.executeUpdate();
        }
    }

    // Read all, with optional search
    public ArrayList<Suppler> fetchSupplers(String search, String type) throws SQLException {
        ArrayList<Suppler> list = new ArrayList<>();
        String sql = "SELECT * FROM SUPPLER";
        boolean hasSearch = search != null && !search.isEmpty() && type != null && !type.isEmpty();
        if (hasSearch) {
            sql += " WHERE " + type + " LIKE ?";
        }
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            if (hasSearch) {
                ps.setString(1, "%" + search + "%");
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Suppler(
                        rs.getInt("supplerId"),
                        rs.getString("contactName"),
                        rs.getString("company"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getBoolean("active")
                    ));
                }
            }
        }
        return list;
    }

    // Read single
    public Suppler getSupplerById(int id) throws SQLException {
        String sql = "SELECT * FROM SUPPLER WHERE supplerId=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Suppler(
                        rs.getInt("supplerId"),
                        rs.getString("contactName"),
                        rs.getString("company"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getBoolean("active")
                    );
                }
            }
        }
        return null;
    }

    // Update
    public void updateSuppler(int supplerId, String contactName, String company, String email, String address, boolean active) throws SQLException {
        String sql = "UPDATE SUPPLER SET contactName=?, company=?, email=?, address=?, active=? WHERE supplerId=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, contactName);
            ps.setString(2, company);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setBoolean(5, active);
            ps.setInt(6, supplerId);
            ps.executeUpdate();
        }
    }

    // Delete
    public void deleteSuppler(int supplerId) throws SQLException {
        String sql = "DELETE FROM SUPPLER WHERE supplerId=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, supplerId);
            ps.executeUpdate();
        }
    }

    // Extra: Get all active supplers
    public ArrayList<Suppler> fetchActiveSupplers() throws SQLException {
        ArrayList<Suppler> list = new ArrayList<>();
        String sql = "SELECT * FROM SUPPLER WHERE active=TRUE";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Suppler(
                        rs.getInt("supplerId"),
                        rs.getString("contactName"),
                        rs.getString("company"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getBoolean("active")
                    ));
                }
            }
        }
        return list;
    }

    // Extra: Toggle active status
    public void toggleSupplerActive(int supplerId) throws SQLException {
        String sql = "UPDATE SUPPLER SET active = NOT active WHERE supplerId=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, supplerId);
            ps.executeUpdate();
        }
    }
}