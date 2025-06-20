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
public class PaymentInfo implements Serializable {
    private String paymentInfoId;
    private String paymentType;
    private String cardNumber;
    private String cvc;
    private String expiryDate;
    private float paymentAmount;
    private String paymentDate;
    private String orderId;
    
    public String getPaymentInfoId() {
        return paymentInfoId;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getCvc() {
        return cvc;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public float getPaymentAmount() {
        return paymentAmount;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentInfoId(String paymentInfoId) {
        this.paymentInfoId = paymentInfoId;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setCvc(String cvc) {
        this.cvc = cvc;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public void setPaymentAmount(float paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    public String getOrderId() {
        return orderId;
    }
    
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}
