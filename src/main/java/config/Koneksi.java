package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Koneksi {

    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName("org.postgresql.Driver");

            String url = "jdbc:postgresql://localhost:5432/cafe_kopi";
            String user = "postgres";
            String password = "admin";

            conn = DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // biar kelihatan error-nya
        }

        return conn;
    }
}
