package uts.isd.model;

public class Suppler {
    private int supplerId;
    private String contactName;
    private String company;
    private String email;
    private String address;
    private boolean active;

    public Suppler(int supplerId, String contactName, String company, String email, String address, boolean active) {
        this.supplerId = supplerId;
        this.contactName = contactName;
        this.company = company;
        this.email = email;
        this.address = address;
        this.active = active;
    }

    // Getters and Setters
    public int getSupplerId() { return supplerId; }
    public void setSupplerId(int supplerId) { this.supplerId = supplerId; }

    public String getContactName() { return contactName; }
    public void setContactName(String contactName) { this.contactName = contactName; }

    public String getCompany() { return company; }
    public void setCompany(String company) { this.company = company; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }
}