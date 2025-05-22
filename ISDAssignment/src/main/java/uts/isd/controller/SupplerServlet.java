package controller;

import model.dao.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class SupplierServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBManager.getConnection()) {
            SupplierDAO dao = new SupplierDAO(conn);
            List<Supplier> supplierList = dao.readSuppliers();
            request.setAttribute("supplierList", supplierList);
            request.getRequestDispatcher("ManageSupplier.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
