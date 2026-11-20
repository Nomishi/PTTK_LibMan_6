package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Reader6;

public class ReaderDAO6 extends DAO {

    public ReaderDAO6() {
        super();
    }

    public Reader6 getReaderById(int id) {
        String sql = "SELECT tblUser6id, fullName, email, phone, address, dateOfBirth, readerCode, readerType "
                   + "FROM tblReader6 WHERE tblUser6id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Reader6 r = new Reader6();
                r.setId(rs.getInt("tblUser6id"));
                r.setFullName(rs.getString("fullName"));
                r.setEmail(rs.getString("email"));
                r.setPhone(rs.getString("phone"));
                r.setAddress(rs.getString("address"));
                r.setDateOfBirth(rs.getDate("dateOfBirth"));
                r.setReaderCode(rs.getString("readerCode"));
                r.setReaderType(rs.getString("readerType"));
                return r;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateReaderProfile(Reader6 r) {
        String sql = "UPDATE tblReader6 SET fullName = ?, email = ?, phone = ?, "
                   + "address = ?, dateOfBirth = ?, readerCode = ?, readerType = ? "
                   + "WHERE tblUser6id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getFullName());
            ps.setString(2, r.getEmail());
            ps.setString(3, r.getPhone());
            ps.setString(4, r.getAddress());
            ps.setDate(5, r.getDateOfBirth());
            ps.setString(6, r.getReaderCode());
            ps.setString(7, r.getReaderType());
            ps.setInt(8, r.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}