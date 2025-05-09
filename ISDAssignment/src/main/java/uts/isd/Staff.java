/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd;

public class Staff extends User{
    private String staffId;
    
    public String GetStaffId(){
        return staffId;
    }
    
    public void SetStaffId(String id){
        this.staffId = id;
    }
}
