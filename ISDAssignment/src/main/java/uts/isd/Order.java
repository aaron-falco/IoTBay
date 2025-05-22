/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd;

import java.io.Serializable;

public class Order implements Serializable {
    private String orderId;
    private String orderCustomerId;
    private String orderProductId;
    private float orderPrice;
    private int quantity;
    private String orderStatus;

    public Order(String id, String customerId, String productId, float price, int qty, String status) {
        this.orderId = id;
        this.orderCustomerId = customerId;
        this.orderProductId = productId;
        this.quantity = qty;
        this.orderPrice = price;
        this.orderStatus = status;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getOrderCustomerId() {
        return orderCustomerId;
    }

    public String getOrderProductId() {
        return orderProductId;
    }

    public float getOrderPrice() {
        return orderPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getOrderStatus() {                    // ✅ Added getter
        return orderStatus;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setOrderCustomerId(String orderCustomerId) {
        this.orderCustomerId = orderCustomerId;
    }

    public void setOrderProductId(String orderProductId) {
        this.orderProductId = orderProductId;
    }

    public void setOrderPrice(float orderPrice) {
        this.orderPrice = orderPrice;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setOrderStatus(String orderStatus) {    // ✅ Added setter
        this.orderStatus = orderStatus;
    }
}
