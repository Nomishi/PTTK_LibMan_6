package model;

import java.io.Serializable;
import java.sql.Date;

public class ImportDocument6 implements Serializable {
    private int id;
    private Date importedDate;
    private int totalImportedQuantity;
    private Invoice6 invoice;
    private Staff6 staff;
    private Supplier6 supplier;

    public ImportDocument6() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getImportedDate() { return importedDate; }
    public void setImportedDate(Date importedDate) { this.importedDate = importedDate; }

    public int getTotalImportedQuantity() { return totalImportedQuantity; }
    public void setTotalImportedQuantity(int totalImportedQuantity) { this.totalImportedQuantity = totalImportedQuantity; }

    public Invoice6 getInvoice() { return invoice; }
    public void setInvoice(Invoice6 invoice) { this.invoice = invoice; }

    public Staff6 getStaff() { return staff; }
    public void setStaff(Staff6 staff) { this.staff = staff; }

    public Supplier6 getSupplier() { return supplier; }
    public void setSupplier(Supplier6 supplier) { this.supplier = supplier; }
}