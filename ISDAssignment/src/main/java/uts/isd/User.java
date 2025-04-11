/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd;

import java.io.Serializable;

/**
 *
 * @author aaron
 */
public class User implements Serializable{
    private String customerId;
    private String name;
    private String password;
    private String email;
    private String dob;
    private String address;
    private String phoneNumber;
    private String lastLoginDateTime;
    // private CustomerType customerType;
    // private PaymentInformation;
    // private List<Product> cart;
    // private List<Order> orderHistory;

    public String getUsername() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getDob() {
        return dob;
    }

    public void setUsername(String username) {
        this.name = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }    
}
