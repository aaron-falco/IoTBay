package uts.isd.model.dao;

import java.sql.*;
import java.util.*;

public class StaffDAO {
    private Connection conn;

    public StaffDAO(Connection conn) {
        this.conn = conn;
    }

    public void createStaff(Staff staff) throws SQLException {
        String sql = "INSERT INTO Staff (name, email, position, address) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, staff.name);
        ps.setString(2, staff.email);
        ps.setString(3, staff.position);
        ps.setString(4, staff.address);
        ps.executeUpdate();
    }

    public List<Staff> readStaff() throws SQLException {
        List<Staff> list = new ArrayList<>();
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
        return list;
    }

    public void deleteStaff(int id) throws SQLException {
        String sql = "DELETE FROM Staff WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
    }
}
