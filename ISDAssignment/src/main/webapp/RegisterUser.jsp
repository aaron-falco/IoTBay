<%-- 
    Document   : RegisterUser
    Created on : 22 May 2025, 8:20:18 pm
    Author     : Aaron
--%>
<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
    </head>
    <body>
        <%
            try {
                // Connect to database
                  DBManager db = (DBManager) session.getAttribute("db");
                  
                  //Check if email exists already
                  if(db.findUserFromEmail(request.getParameter("email")) != null){
                    session.setAttribute("userEmailTaken", true);
                    response.sendRedirect("register.jsp");
                    %>
                    <div class="defaultDivStyle">
                        <p>If not automatically redirected click <a href="register.jsp">HERE</a>.</p>
                    </div>
                    <%
                  }
                  
                  User newUser = new User();
                  newUser.setUserId("U" + String.valueOf(db.getRowCountUsers()));
                  newUser.setFirstName(request.getParameter("firstName"));
                  newUser.setLastName(request.getParameter("lastName"));
                  newUser.setEmail(request.getParameter("email"));
                  newUser.setPassword(request.getParameter("password"));
                  newUser.setPhoneNumber(request.getParameter("phoneNumber"));
                  newUser.setUserType(0);
                  
                  if(db.registerNewCustomer(newUser.getUserId(), newUser.getFirstName(), newUser.getLastName(),newUser.getEmail(), newUser.getPassword(), newUser.getPhoneNumber())){
                    session.setAttribute("user", newUser);
                    int recordIdInt = db.getRowCountUserLoginRecords() + 1;
                    String recordId = "UR" + String.valueOf(recordIdInt);
                    String userId = newUser.getUserId();

                    UserLoginRecord loginRecord = new UserLoginRecord(recordId, userId);
                    db.addLoginRecord(recordId, userId, loginRecord.getLoginDate(), loginRecord.getLoginTime(), "", "");
                    session.setAttribute("loginRecord", loginRecord);
                    
                    response.sendRedirect("main.jsp");
                  }
                  else{
                    %>
                    <div class="defaultDivStyle">
                        <p>If not automatically redirected click <a href="login.jsp">HERE</a>.</p>
                    </div>
                    <%
                    session.setAttribute("registrationFailed", true);
                    response.sendRedirect("register.jsp");
                  }
            }
            catch (Exception ex){
                out.print(ex.getMessage());
            }
        %>
    </body>
</html>
