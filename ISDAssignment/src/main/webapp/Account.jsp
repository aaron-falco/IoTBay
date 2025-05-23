<%-- 
    Document   : account
    Created on : 21 May 2025, 4:13:39 pm
    Author     : Aaron
--%>
<%@ page import="java.util.*, uts.isd.model.dao.*, uts.isd.*" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Account</title>
    </head>
    <body>
        <ul>
            <li><a href="Catalog.jsp">Catalog</a></li>
            <li><a href="main.jsp">Main</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <%
            User user = null;
            Boolean accountUpdated = null;
            DBManager db = null;
            try{
                db = (DBManager) session.getAttribute("db");
                user = (User) session.getAttribute("user");
                  
                if(session.getAttribute("accountUpdated") != null){
                    accountUpdated = (Boolean) session.getAttribute("accountUpdated");
                }
            }
            catch (Exception ex){
                out.println(ex.getMessage());
            }
            if(user == null || db == null) {%>
            <h1 style="color: red">Error with account access. Please go back to home page and login in again.</h1>
            <%}
        %>
        <div class="defaultDivStyle">
            <h1>Account Details:</h1>
            <form method="post" action="UpdateAccount.jsp">   
                <label for="userId">User ID:   </label>
                <input style="border: white;" type="text" id="userId" name="userId" value="<%= user.getUserId() %>" readonly><br><br>
                <label for="firstName">First Name:   </label>
                <input type="text" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required><br><br>
                <label for="lastName">Last Name:   </label>
                <input type="text" id="lastName" name="lastName" value="<%= user.getLastName() %>" required><br><br>
                <label for="email">Email:   </label>
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required><br><br>
                <label for="password">Password:   </label>
                <input type="text" id="password" name="password" value="<%= user.getPassword() %>" required><br><br>
                <label for="phoneNumber">Phone Number:   </label>
                <input type="tel" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() %>" pattern="04[0-9]{8}" required><br><br>            
                <input type="submit" value="Update">
            </form>
            <% if(accountUpdated != null){ 
                if(accountUpdated){%>
                <br><p>Account Updated!</p><br>
            <%      }
                else {%>
                <br><p style="color: red">Invalid details entered. Please try again.</p><br>
                <%}
            } 
            %>
            <h1>Account Login History:</h1>
            <form method="post" action="Account.jsp">
                <label for="searchDate">Search Date: </label>
                <input type="date" name="searchDate" id="searchDate">
                <br><br>
                <input type="submit" value="Search">
            </form>
            <br>
            <%
                ArrayList<UserLoginRecord> userLoginRecords = new ArrayList();
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    userLoginRecords = db.findLoginRecordFromUserIdAndDate(user.getUserId(), request.getParameter("searchDate"));
                }
                else{
                    userLoginRecords = db.findLoginRecordFromUserId(user.getUserId());
                }
            %>
            <table border="1" cellpadding="10" class="table">
                <tr>
                    <th>Record ID:</th>
                    <th>Login Date:</th>
                    <th>Login Time:</th>
                    <th>Logout Date:</th>
                    <th>Logout Time:</th>
                </tr>
            <% 
                if(!userLoginRecords.isEmpty()){
                    for (UserLoginRecord u : userLoginRecords) { %>
                    <tr>
                        <td><%= u.getUserId()%></td>
                        <td><%= u.getLoginDate() %></td>
                        <td><%= u.getLoginTime() %></td>
                        <td><%= u.getLogoutDate() %></td>
                        <td><%= u.getLogoutTime() %></td>
                    </tr>
                <% }} %>
            </table>
            <h1>Delete Account:</h1>
            <form method="post" action="DeleteAccount.jsp">
                <input type="checkbox" onclick="function enableDelete(){ document.getElementById('deleteAccount').disabled = !document.getElementById('deleteAccount').disabled; }enableDelete()">
                <input type="submit" value="DELETE ACCOUNT" id="deleteAccount" disabled>
            </form>
        </div>
        
    </body>
</html>
