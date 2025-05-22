package uts.isd.model.dao;

import java.sql.*;
import java.util.*;

public class SupplerDAO {
    private Connection conn;

    public SupplerDAO(Connection conn) {
        this.conn = conn;
    }

    public void createSupplier(Supplier supplier) throws SQLException {
        String sql = "INSERT INTO Supplier (contactName, company, email, address) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, supplier.contactName);
        ps.setString(2, supplier.company);
        ps.setString(3, supplier.email);
        ps.setString(4, supplier.address);
        ps.executeUpdate();
    }

    public List<Supplier> readSuppliers() throws SQLException {
        List<Supplier> list = new ArrayList<>();
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
        return list;
    }

    public void deleteSupplier(int id) throws SQLException {
        String sql = "DELETE FROM Supplier WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }
}
