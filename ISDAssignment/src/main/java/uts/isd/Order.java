/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd;

import java.io.Serializable;

/**
 *
 * @author Aaron
 */
public class Order implements Serializable{
    private String orderId;
    private String orderCustomerId;
    private String orderProductId;
    private float orderPrice;
    private int quantity;
}
