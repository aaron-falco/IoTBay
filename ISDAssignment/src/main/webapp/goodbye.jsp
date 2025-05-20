<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.*" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Goodbye!</title>
        <link rel="stylesheet" href="IoTBayStyles.css">
    </head>
    <body>
        <%
            try{
                // Connect to database
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                DBManager db = new DBManager(conn);
                
                UserLoginRecord record = (UserLoginRecord) session.getAttribute("loginRecord");
                record.setLogoutDateTime();
                
                db.updateLoginRecord(record.getLoginRecordId(), record.getLogoutDate(), record.getLogoutTime());
                
                // End session
                conn.close();
                session.invalidate();
                response.sendRedirect("landing.jsp");
            }
            catch (Exception ex){
                System.out.println(ex.getMessage());
            }
        %>
    </body>
</html>
