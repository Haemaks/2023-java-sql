<%-- 
    Document   : users_list
    Created on : 5.05.2023 г., 11:49:25 ч.
    Author     : martinp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users List</title>
    </head>
    <body>
        <%
            //IF THE USER HAS NOT SIGNED IN
            if (request.getCookies().length = 1) {    
        %>
        
        <h1>You don't have access to this webpage!</h1>
        
        <%
            } else {

        String driverName = "org.mariadb.jdbc.Driver";
        String connectionUrl = "jdbc:mariadb://localhost/";
        String dbName = "website_users";
        String userId = "martinp";
        String password = "";

        try {
            Class.forName(driverName);
            } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection connection = DriverManager.getConnection(connectionUrl);
        Statement stmt = connection.createStatement();
        ResultSet resultSet = null;
        %>
        
        <table>
            <tr>
                <td><b>Username<\b><\td>
                <td><b>Rang<\b><\td>
            </tr>
               <%
                try{ 
                connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                stmt=connection.createStatement();
                String sql ="SELECT username, rang FROM users";

                 resultSet = stmt.executeQuery(sql);
                 while(resultSet.next()){
                %>
            <tr>
                <td><%=resultSet.getString("username") %></td>
                <td><%=resultSet.getString("rang") %></td>
            </tr>
            
            <% 
                }

                } catch (Exception e) {
                e.printStackTrace();
                }
            %>
            
        </table>
            
            <%
                }
            %>
    </body>
</html>
