package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.ReaderCard6;

public class ReaderCardDAO6 extends DAO {

    public ReaderCardDAO6() {
        super();
    }

    public boolean addReaderCard(ReaderCard6 card) {
        String sql = "INSERT INTO tblReaderCard6 (registrationDate, expiryDate, tblReader6id) VALUES (?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, card.getRegistrationDate());
            ps.setDate(2, card.getExpiryDate());
            ps.setInt(3, card.getReader().getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}