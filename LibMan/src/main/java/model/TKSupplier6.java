package model;

import java.sql.Date;

public class TKSupplier6 extends Supplier6 {
    private int importedQuantity;
    private Date startDate;
    private Date endDate;

    public TKSupplier6() {
        super();
    }

    public int getImportedQuantity() { return importedQuantity; }
    public void setImportedQuantity(int importedQuantity) { this.importedQuantity = importedQuantity; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
}