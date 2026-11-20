package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    private static final String URL = "jdbc:mysql://localhost:3306/libman_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";       
    private static final String PASSWORD = "1314177155";

    protected Connection con;

    public DAO() {
        try {
            // Load driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Khởi tạo kết nối
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức kiểm tra kết nối (tùy chọn)
    public Connection getConnection() {
        return con;
    }
}