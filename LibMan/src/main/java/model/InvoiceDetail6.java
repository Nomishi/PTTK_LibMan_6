package model;

import java.io.Serializable;

public class InvoiceDetail6 implements Serializable {
    private int id;
    private int quantity;
    private int unitPrice;
    private Document6 document;

    public InvoiceDetail6() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public int getUnitPrice() { return unitPrice; }
    public void setUnitPrice(int unitPrice) { this.unitPrice = unitPrice; }

    public Document6 getDocument() { return document; }
    public void setDocument(Document6 document) { this.document = document; }
}