/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import uts.isd.PaymentInfo;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.PaymentDAO;



/**
 *
 * @author Steven
 */
@WebServlet(name = "AddPayment", urlPatterns = {"/AddPayment"})
public class AddPayment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPayment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String paymentId = request.getParameter("paymentInfoId");
    String orderId = request.getParameter("orderId");
    String type = request.getParameter("paymentType");
    String card = request.getParameter("cardNumber");
    if (!card.matches("\\d{12,16}")) {
        request.setAttribute("error", "Card number must be 12 to 16 digits.");
        request.getRequestDispatcher("addPayment.jsp").forward(request, response);
        return; // Stop further execution
    }

    String cvc = request.getParameter("cvc");
    String expiry = request.getParameter("expiryDate");
    float amount = Float.parseFloat(request.getParameter("paymentAmount"));
    String date = request.getParameter("paymentDate");

    PaymentInfo payment = new PaymentInfo();
    payment.setPaymentInfoId(paymentId);
    payment.setOrderId(orderId);
    payment.setPaymentType(type);
    payment.setCardNumber(card);
    payment.setCvc(cvc);
    payment.setExpiryDate(expiry);
    payment.setPaymentAmount(amount);
    payment.setPaymentDate(date);

    try {
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        PaymentDAO paymentDAO = new PaymentDAO(conn);

        paymentDAO.addPayment(payment);

        request.setAttribute("message", "Payment added successfully.");
        request.getRequestDispatcher("viewPayments.jsp").forward(request, response);
    } 
    catch (Exception e) {
        e.printStackTrace(); // still prints to server log
        request.setAttribute("error", "Error adding payment: " + e.getMessage());
        request.getRequestDispatcher("addPayment.jsp").forward(request, response);
    }

}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
