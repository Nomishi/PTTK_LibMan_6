package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Invoice6 implements Serializable {
    private int id;
    private int totalAmount;
    private List<InvoiceDetail6> dsInvoiceDetail;

    public Invoice6() {
        this.dsInvoiceDetail = new ArrayList<>();
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getTotalAmount() { return totalAmount; }
    public void setTotalAmount(int totalAmount) { this.totalAmount = totalAmount; }

    public List<InvoiceDetail6> getDsInvoiceDetail() { return dsInvoiceDetail; }
    public void setDsInvoiceDetail(List<InvoiceDetail6> dsInvoiceDetail) { this.dsInvoiceDetail = dsInvoiceDetail; }
}