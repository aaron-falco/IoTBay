/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author aaron
 */
public class UserLoginRecord implements Serializable {
    
    private static class DateTimeGenerator{
//        LocalDateTime myObj = LocalDateTime.now(); // Create a date object
//        
//        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");        
//        String formattedDate = myObj.format(format);
//        System.out.println(formattedDate); // Display the current date
//        
//        format = DateTimeFormatter.ofPattern("hh:mm");
//        formattedDate = myObj.format(format);
//        System.out.println(formattedDate); // Display the current time
        
        public static String currentDate(){
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");        
            return LocalDateTime.now().format(format);
        }
        
        public static String currentTime(){
            DateTimeFormatter format = DateTimeFormatter.ofPattern("hh:mm");        
            return LocalDateTime.now().format(format);
        }
    }
    
    private String loginRecordId;
    private String userId;
    private String loginDate;
    private String loginTime;
    private String logoutDate;
    private String logoutTime;

    public UserLoginRecord(String loginRecordId, String userId, String loginDate, String loginTime, String logoutDate, String logoutTime) {
        this.loginRecordId = loginRecordId;
        this.userId = userId;
        this.loginDate = loginDate;
        this.loginTime = loginTime;
        this.logoutDate = logoutDate;
        this.logoutTime = logoutTime;
    }   
    
    public UserLoginRecord(String loginRecordId, String userId) {
        this.loginRecordId = loginRecordId;
        this.userId = userId;
        this.loginDate = DateTimeGenerator.currentDate();
        this.loginTime = DateTimeGenerator.currentTime();
        this.logoutDate = "";
        this.logoutTime = "";
    }   
    
//    public UserLoginRecord() {
//        this.loginRecordId = "";
//        this.userId = "";
//        this.loginDate = "";
//        this.loginTime = "";
//        this.logoutDate = "";
//        this.logoutTime = "";
//    }
//    
//    public void setLoginDateTime(){
//        this.loginDate = DateTimeGenerator.currentDate();
//        this.loginTime = DateTimeGenerator.currentTime();
//    }
    
    public void setLogoutDateTime(){
        this.logoutDate = DateTimeGenerator.currentDate();
        this.logoutTime = DateTimeGenerator.currentTime();
    }

    public String getLoginRecordId() {
        return loginRecordId;
    }

    public String getUserId() {
        return userId;
    }

    public String getLoginDate() {
        return loginDate;
    }

    public String getLogoutDate() {
        return logoutDate;
    }

    public String getLogoutTime() {
        return logoutTime;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginRecordId(String loginRecordId) {
        this.loginRecordId = loginRecordId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setLoginDate(String loginDate) {
        this.loginDate = loginDate;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public void setLogoutDate(String logoutDate) {
        this.logoutDate = logoutDate;
    }

    public void setLogoutTime(String logoutTime) {
        this.logoutTime = logoutTime;
    }
    
}
