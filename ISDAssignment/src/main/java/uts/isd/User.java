package uts.isd;

import java.io.Serializable;

public class User implements Serializable{
    private String userId;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private String phoneNumber;
    private int userType;

    public User(String userId, String firstName, String lastName, String password, String email, String phoneNumber, int userType) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.userType = userType;
    }
    public User() {
        this.userId = "";
        this.firstName = "";
        this.lastName = "";
        this.password = "";
        this.email = "";
        this.phoneNumber = "";
        this.userType = 0;
    }

    public String getUserId() {
        return userId;
    }    
    
    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public int getUserType() {
        return userType;
    }
    
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }
}
