package model;

import java.io.Serializable;

public class Supplier6 implements Serializable {
    private int id;
    private String supplierName;
    private String address;
    private String phone;
    private String email;

    public Supplier6() {
    }

    public Supplier6(int id, String supplierName, String address, String phone, String email) {
        this.id = id;
        this.supplierName = supplierName;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSupplierName() { return supplierName; }
    public void setSupplierName(String supplierName) { this.supplierName = supplierName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}