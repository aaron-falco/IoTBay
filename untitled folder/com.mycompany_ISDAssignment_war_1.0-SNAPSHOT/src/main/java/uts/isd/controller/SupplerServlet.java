package uts.isd.controller;

import uts.isd.Suppler;
import uts.isd.model.dao.SupplerDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class SupplerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SupplerDAO supplerDAO = (SupplerDAO) request.getSession().getAttribute("supplerDAO");
        String action = request.getParameter("action");
        try {
            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Suppler suppler = supplerDAO.getSupplerById(id);
                request.setAttribute("suppler", suppler);
                request.getRequestDispatcher("SupplerForm.jsp").forward(request, response);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                supplerDAO.deleteSuppler(id);
                response.sendRedirect("SupplerServlet");
            } else if ("toggle".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Suppler suppler = supplerDAO.getSupplerById(id);
                supplerDAO.updateSuppler(id, suppler.getContactName(), suppler.getCompany(), suppler.getEmail(), suppler.getAddress(), !suppler.isActive());
                response.sendRedirect("SupplerServlet");
            } else {
                // List or Search
                String search = request.getParameter("search");
                String type = request.getParameter("type");
                ArrayList<Suppler> supplers = supplerDAO.fetchSupplers(search, type);
                request.setAttribute("supplers", supplers);
                request.getRequestDispatcher("SupplerList.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SupplerDAO supplerDAO = (SupplerDAO) request.getSession().getAttribute("supplerDAO");
        String supplerId = request.getParameter("supplerId");
        String contactName = request.getParameter("contactName");
        String company = request.getParameter("company");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        boolean active = request.getParameter("active") != null;

        try {
            if (supplerId == null || supplerId.isEmpty()) {
                // Create
                supplerDAO.addSuppler(contactName, company, email, address);
            } else {
                // Update
                supplerDAO.updateSuppler(Integer.parseInt(supplerId), contactName, company, email, address, active);
            }
            response.sendRedirect("SupplerServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}