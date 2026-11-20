package model;

import java.io.Serializable;
import java.sql.Date;

public class ReaderCard6 implements Serializable {
    private int id;
    private Date registrationDate;
    private Date expiryDate;
    private Reader6 reader;

    public ReaderCard6() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getRegistrationDate() { return registrationDate; }
    public void setRegistrationDate(Date registrationDate) { this.registrationDate = registrationDate; }

    public Date getExpiryDate() { return expiryDate; }
    public void setExpiryDate(Date expiryDate) { this.expiryDate = expiryDate; }

    public Reader6 getReader() { return reader; }
    public void setReader(Reader6 reader) { this.reader = reader; }
}