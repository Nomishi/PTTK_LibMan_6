package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ImportDocument6;
import model.Invoice6;
import model.Supplier6;

public class ImportDocumentDAO6 extends DAO {

    public ImportDocumentDAO6() {
        super();
    }

    public List<ImportDocument6> getImportBySupplier(int supplierId, Date startDate, Date endDate) {
        List<ImportDocument6> list = new ArrayList<>();
        String sql = "SELECT i.id, i.importedDate, i.totalImportedQuantity, i.tblInvoice6id, "
                   + "s.id AS supplierId, s.supplierName "
                   + "FROM tblImportDocument6 i "
                   + "JOIN tblSupplier6 s ON i.tblSupplier6id = s.id "
                   + "WHERE i.tblSupplier6id = ? AND i.importedDate BETWEEN ? AND ? "
                   + "ORDER BY i.importedDate DESC";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, supplierId);
            ps.setDate(2, startDate);
            ps.setDate(3, endDate);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ImportDocument6 imp = new ImportDocument6();
                imp.setId(rs.getInt("id"));
                imp.setImportedDate(rs.getDate("importedDate"));
                imp.setTotalImportedQuantity(rs.getInt("totalImportedQuantity"));

                Invoice6 inv = new Invoice6();
                inv.setId(rs.getInt("tblInvoice6id"));
                imp.setInvoice(inv);

                Supplier6 sup = new Supplier6();
                sup.setId(rs.getInt("supplierId"));
                sup.setSupplierName(rs.getString("supplierName"));
                imp.setSupplier(sup);

                list.add(imp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}