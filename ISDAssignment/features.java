package iotbay.mvc;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

class DBUtil {
    public static Connection connect() throws SQLException {
        return DriverManager.getConnection("jdbc:derby://localhost:1527/iotbaydb", "iotuser", "iotpass");
    }
}

// Staff Information Management
class Staff {
    public int id;
    public String name, email, position, address;

    public Staff(int id, String name, String email, String position, String address) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.position = position;
        this.address = address;
    }
}

class StaffDAO {
    public static void createStaff(Staff staff) throws SQLException {
        try (Connection conn = DBUtil.connect()) {
            String sql = "INSERT INTO Staff (name, email, position, address) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staff.name);
            ps.setString(2, staff.email);
            ps.setString(3, staff.position);
            ps.setString(4, staff.address);
            ps.executeUpdate();
        }
    }

    public static List<Staff> readStaff() throws SQLException {
        List<Staff> list = new ArrayList<>();
        try (Connection conn = DBUtil.connect()) {
            String sql = "SELECT * FROM Staff";
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()) {
                list.add(new Staff(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("position"),
                    rs.getString("address")
                ));
            }
        }
        return list;
    }

    public static void updateStaffStatus(int id, boolean active) throws SQLException {
        try (Connection conn = DBUtil.connect()) {
            String sql = "UPDATE Staff SET active=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setBoolean(1, active);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public static void deleteStaff(int id) throws SQLException {
        try (Connection conn = DBUtil.connect()) {
            String sql = "DELETE FROM Staff WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}

// Supplier Information Management
class Supplier {
    public int id;
    public String contactName, company, email, address;

    public Supplier(int id, String contactName, String company, String email, String address) {
        this.id = id;
        this.contactName = contactName;
        this.company = company;
        this.email = email;
        this.address = address;
    }
}

class SupplierDAO {
    public static void createSupplier(Supplier supplier) throws SQLException {
        try (Connection conn = DBUtil.connect()) {
            String sql = "INSERT INTO Supplier (contactName, company, email, address) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, supplier.contactName);
            ps.setString(2, supplier.company);
            ps.setString(3, supplier.email);
            ps.setString(4, supplier.address);
            ps.executeUpdate();
        }
    }

    public static List<Supplier> readSuppliers() throws SQLException {
        List<Supplier> list = new ArrayList<>();
        try (Connection conn = DBUtil.connect()) {
            String sql = "SELECT * FROM Supplier";
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()) {
                list.add(new Supplier(
                    rs.getInt("id"),
                    rs.getString("contactName"),
                    rs.getString("company"),
                    rs.getString("email"),
                    rs.getString("address")
                ));
            }
        }
        return list;
    }

    public static void updateSupplierStatus(int id, boolean active) throws SQLException {
        try (Connection conn = DBUtil.connect()) {
            String sql = "UPDATE Supplier SET active=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setBoolean(1, active);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public static void deleteSupplier(int id) throws SQLException {
        try (Connection conn = DBUtil.connect()) {
            String sql = "DELETE FROM Supplier WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}

// Data Management Logic

class DataManager {
    public static void bulkImportStaff(List<Staff> staffList) throws SQLException {
        for (Staff s : staffList) {
            StaffDAO.createStaff(s);
        }
    }

    public static void bulkImportSuppliers(List<Supplier> supplierList) throws SQLException {
        for (Supplier s : supplierList) {
            SupplierDAO.createSupplier(s);
        }
    }

    public static void exportAllDataToCSV(String filePath) throws Exception {
        try (PrintWriter writer = new PrintWriter(new File(filePath))) {
            writer.println("StaffID,Name,Email,Position,Address");
            for (Staff s : StaffDAO.readStaff()) {
                writer.printf("%d,%s,%s,%s,%s\n", s.id, s.name, s.email, s.position, s.address);
            }
            writer.println("SupplierID,ContactName,Company,Email,Address");
            for (Supplier s : SupplierDAO.readSuppliers()) {
                writer.printf("%d,%s,%s,%s,%s\n", s.id, s.contactName, s.company, s.email, s.address);
            }
        }
    }
}
