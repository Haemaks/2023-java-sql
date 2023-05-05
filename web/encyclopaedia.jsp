<%-- 
    Document   : encyclopaedia
    Created on : 28.04.2023 г., 11:44:51 ч.
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
        <link rel="stylesheet" href="styles.css">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="/2023-java-sql/" >Home</a></li>            
                    <li><a href="/2023-java-sql/plotline.html" >Plotline</a></li>            
                    <li><a href="/2023-java-sql/encyclopaedia.html"  class="active" >Encyclopaedia</a></li>
                    <li><a href="/2023-java-sql/registration_form.html">Sign up</a></li>
                
                </ul>
            </nav>
        </header>
        <h1>  Encyclopaedia</h1>
         <h1>Pandora's flora and fauna</h1>
        <p>The ecology of the lush moon Pandora, which teems with a biodiversity of bioluminescent species ranging from hexapodal animals to other types of exotic fauna and flora, forms a vast neural network spanning the entire lunar surface into which the Na'vi and other creatures can connect. The strength of this collective consciousness is illustrated when the human invaders are defeated in battle by the Pandoran ecology, after the Na'vi are nearly defeated.</p>
        <h2>Fauna</h2>
        
        <%
        String id = request.getParameter("userId");
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
        
        <table id="fauna_table">
            <tr>
                <td><b>id</b></td>
                <td><b>name</b></td>
                <td><b>description</b></td>
            </tr>
            <%
            try{ 
                connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                stmt=connection.createStatement();
                String sql ="SELECT * FROM pandora_species";

                resultSet = stmt.executeQuery(sql);
                 while(resultSet.next()){
             %>
             <tr>

                <td><%=resultSet.getString("id") %></td>
                <td><%=resultSet.getString("name") %></td>
                <td><%=resultSet.getString("description") %></td>
            </tr>
            
            <% 
                }

                } catch (Exception e) {
                e.printStackTrace();
                }
            %>
            
        </table>
    </body>
</html>
