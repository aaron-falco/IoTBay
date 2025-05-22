<%-- 
    Document   : welcome
    Created on : 28 Mar 2025, 2:19:01 pm
    Author     : aaron
--%>
<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" href="IoTBayStyles.css">
    </head>
    <body>
        <%
            try {
                // Connect to database
//                DBConnector connector = new DBConnector();
//                Connection conn = connector.openConnection();
//                DBManager db = new DBManager(conn);
                  DBManager db = (DBManager) session.getAttribute("db");
                
                // If POST form sent to page     
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    
                    User user = db.findUserFromEmail(email);
                    
                    // If user with email doesn't exist or if the password doesn't match
                    if(user == null || !password.equals(user.getPassword())){
                        session.setAttribute("loginAttemptFailed", true);
                        //conn.close();
                        response.sendRedirect("login.jsp");
                        %>
                        <div class="defaultDivStyle">
                            <p>If not automatically redirected click <a href="login.jsp">HERE</a>.</p>
                        </div>
                        <%
                    }
                    else{
                        session.setAttribute("user", user);
                        int recordIdInt = db.getRowCountUserLoginRecords() + 1;
                        String recordId = "UR" + String.valueOf(recordIdInt);
                        String userId = user.getUserId();
                        
                        UserLoginRecord loginRecord = new UserLoginRecord(recordId, userId);
                        db.addLoginRecord(recordId, userId, loginRecord.getLoginDate(), loginRecord.getLoginTime(), "", "");
                        session.setAttribute("loginRecord", loginRecord);
                        
                        //conn.close();
                        response.sendRedirect("main.jsp");
                        
                        %>
                        <div class="defaultDivStyle">
                            <p>If not automatically redirected click <a href="main.jsp">HERE</a>.</p>
                        </div>
                        <%
                    }
                }
                else{
                    //conn.close();
                    response.sendRedirect("login.jsp");
                    %>
                    <div class="defaultDivStyle">
                        <p>If not automatically redirected click <a href="login.jsp">HERE</a>.</p>
                    </div>
                <%}
            }
            catch (Exception ex){
                System.out.println(ex.getMessage());
            }
        %>
    </body>
</html>
