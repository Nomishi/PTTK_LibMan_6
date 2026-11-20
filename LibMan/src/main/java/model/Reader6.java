package model;

import java.sql.Date;

public class Reader6 extends User6 {
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private Date dateOfBirth;
    private String readerType;
    private String readerCode;

    public Reader6() {
        super();
    }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getReaderType() { return readerType; }
    public void setReaderType(String readerType) { this.readerType = readerType; }

    public String getReaderCode() { return readerCode; }
    public void setReaderCode(String readerCode) { this.readerCode = readerCode; }
}