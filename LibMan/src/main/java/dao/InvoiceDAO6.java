package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Document6;
import model.Invoice6;
import model.InvoiceDetail6;

public class InvoiceDAO6 extends DAO {

    public InvoiceDAO6() {
        super();
    }

    public Invoice6 getInvoiceById(int invoiceId) {
        Invoice6 invoice = null;
        String sqlInvoice = "SELECT id, totalAmount FROM tblInvoice6 WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sqlInvoice)) {
            ps.setInt(1, invoiceId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                invoice = new Invoice6();
                invoice.setId(rs.getInt("id"));
                invoice.setTotalAmount(rs.getInt("totalAmount"));

                List<InvoiceDetail6> details = new ArrayList<>();
                String sqlDetail = "SELECT d.id AS detailId, d.quantity, d.unitPrice, "
                                 + "doc.id AS docId, doc.documentName, doc.author "
                                 + "FROM tblInvoiceDetail6 d "
                                 + "JOIN tblDocument6 doc ON d.tblDocument6id = doc.id "
                                 + "WHERE d.tblInvoice6id = ?";

                try (PreparedStatement psDetail = con.prepareStatement(sqlDetail)) {
                    psDetail.setInt(1, invoiceId);
                    ResultSet rsDetail = psDetail.executeQuery();

                    while (rsDetail.next()) {
                        Document6 doc = new Document6();
                        doc.setId(rsDetail.getInt("docId"));
                        doc.setDocumentName(rsDetail.getString("documentName"));
                        doc.setAuthor(rsDetail.getString("author"));

                        InvoiceDetail6 detail = new InvoiceDetail6();
                        detail.setId(rsDetail.getInt("detailId"));
                        detail.setQuantity(rsDetail.getInt("quantity"));
                        detail.setUnitPrice(rsDetail.getInt("unitPrice"));
                        detail.setDocument(doc);

                        details.add(detail);
                    }
                }
                invoice.setDsInvoiceDetail(details);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoice;
    }
}