package uts.isd.model.dao;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author tomparry
 */
public class DBConnector extends DB {
    
    public DBConnector() throws ClassNotFoundException, SQLException {
        // Load the Derby JDBC driver
        Class.forName(driver);

        // Establish the connection to the database
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/App", "isduser", "admin");

        // The URL+db will automatically append the database name, and `create=true` ensures
        // the database is created if it doesn't already exist.
    }
    
    public Connection openConnection() {
        return this.conn;
    }
    
    public void closeConnection() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }
}
