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
public class UserLoginRecord implements Serializable {
    private String loginRecordId;
    private String userId;
    private String loginDate;
    private String loginTime;

    public String getLoginRecordId() {
        return loginRecordId;
    }

    public String getUserId() {
        return userId;
    }

    public String getLoginDate() {
        return loginDate;
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
    
}
