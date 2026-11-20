package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Manager6;
import model.Reader6;
import model.Staff6;
import model.User6;

public class UserDAO6 extends DAO {
    public UserDAO6() {
        super();
    }

    public User6 checkLogin(String username, String password) {
        String sqlUser = "SELECT id, username, password FROM tblUser6 WHERE username = ? AND password = ?";
        try (PreparedStatement ps = con.prepareStatement(sqlUser)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");

                // 1. Kiểm tra có phải Quản lí (tblManager6) không
                String sqlManager = "SELECT e.position FROM tblManager6 m "
                                  + "JOIN tblEmployee6 e ON m.tblEmployee6id = e.tblUser6id "
                                  + "WHERE m.tblEmployee6id = ?";
                try (PreparedStatement psM = con.prepareStatement(sqlManager)) {
                    psM.setInt(1, userId);
                    ResultSet rsM = psM.executeQuery();
                    if (rsM.next()) {
                        Manager6 manager = new Manager6();
                        manager.setId(userId);
                        manager.setUserName(username);
                        manager.setPosition(rsM.getString("position"));
                        return manager;
                    }
                }

                // 2. Kiểm tra có phải Nhân viên thư viện (tblStaff6) không
                String sqlStaff = "SELECT e.position FROM tblStaff6 s "
                                + "JOIN tblEmployee6 e ON s.tblEmployee6id = e.tblUser6id "
                                + "WHERE s.tblEmployee6id = ?";
                try (PreparedStatement psS = con.prepareStatement(sqlStaff)) {
                    psS.setInt(1, userId);
                    ResultSet rsS = psS.executeQuery();
                    if (rsS.next()) {
                        Staff6 staff = new Staff6();
                        staff.setId(userId);
                        staff.setUserName(username);
                        staff.setPosition(rsS.getString("position"));
                        return staff;
                    }
                }

                // 3. Kiểm tra có phải Bạn đọc (tblReader6) không
                String sqlReader = "SELECT fullName, email, phone, address, dateOfBirth, readerCode, readerType "
                                 + "FROM tblReader6 WHERE tblUser6id = ?";
                try (PreparedStatement psR = con.prepareStatement(sqlReader)) {
                    psR.setInt(1, userId);
                    ResultSet rsR = psR.executeQuery();
                    if (rsR.next()) {
                        Reader6 reader = new Reader6();
                        reader.setId(userId);
                        reader.setUserName(username);
                        reader.setFullName(rsR.getString("fullName"));
                        reader.setEmail(rsR.getString("email"));
                        reader.setPhone(rsR.getString("phone"));
                        reader.setAddress(rsR.getString("address"));
                        reader.setDateOfBirth(rsR.getDate("dateOfBirth"));
                        reader.setReaderCode(rsR.getString("readerCode"));
                        reader.setReaderType(rsR.getString("readerType"));
                        return reader;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}