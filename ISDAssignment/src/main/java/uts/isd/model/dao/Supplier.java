package uts.isd.model.dao;

public class Supplier {
    public int id;
    public String contactName, company, email, address;

    public Supplier(int id, String contactName, String company, String email, String address) {
        this.id = id;
        this.contactName = contactName;
        this.company = company;
        this.email = email;
        this.address = address;
    }
}
