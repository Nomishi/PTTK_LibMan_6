package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.TKSupplier6;

public class TKSupplierDAO6 extends DAO {

    public TKSupplierDAO6() {
        super();
    }

    public List<TKSupplier6> getSupplierStatistic(Date startDate, Date endDate) {
        List<TKSupplier6> list = new ArrayList<>();
        String sql = "SELECT s.id, s.supplierName, s.address, s.phone, s.email, "
                   + "SUM(i.totalImportedQuantity) AS importedQuantity "
                   + "FROM tblSupplier6 s "
                   + "JOIN tblImportDocument6 i ON s.id = i.tblSupplier6id "
                   + "WHERE i.importedDate BETWEEN ? AND ? "
                   + "GROUP BY s.id, s.supplierName, s.address, s.phone, s.email "
                   + "ORDER BY importedQuantity DESC";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, startDate);
            ps.setDate(2, endDate);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TKSupplier6 tk = new TKSupplier6();
                tk.setId(rs.getInt("id"));
                tk.setSupplierName(rs.getString("supplierName"));
                tk.setAddress(rs.getString("address"));
                tk.setPhone(rs.getString("phone"));
                tk.setEmail(rs.getString("email"));
                tk.setImportedQuantity(rs.getInt("importedQuantity"));
                tk.setStartDate(startDate);
                tk.setEndDate(endDate);
                list.add(tk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}