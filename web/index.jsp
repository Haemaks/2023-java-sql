<%-- 
    Document   : index
    Created on : 3.05.2023 г., 11:26:26 ч.
    Author     : martinp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jakarta.servlet.http.Cookie"%>
             
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Home</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <header>
 
            <nav>
                <ul>
                    <%
                    Cookie[] cookies = request.getCookies();
                    String rang = "";
                    if (cookies.length != 1) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("rang")) {
                                rang = cookie.getValue(); break;
                            }
                        }
                    }
                    %>
             
                    <li><a href="/2023-java-sql/"  class="active" >Home</a></li>          
                    <li><a href="/2023-java-sql/plotline.html" >Plotline</a></li>
                    <li><a href="/2023-java-sql/encyclopaedia.jsp" >Encyclopaedia</a></li>
                
                    <%
                        if (rang.equals("admin")) {
                    %>
                    
                    <li><a href="/2023-java-sql/users_list.jsp" >Users list</a></li>
                    <li><a href="LogOutServlet">Sign Out</a></li>
                    
                    <%
                        } else if (rang.equals("user")) {
                    %>
                    
                    <li><a href="LogOutServlet">Sign Out</a></li>
                    
                    <%
                        }
                        else {
                    %>
                    
                    <li><a href="registration_form.html">Sign Up</a></li>
                    
                    <%
                        }
                    %>
                    
                </ul>
            </nav>
    </header>
    <h1>  About Avatar </h1>
                <p>Avatar is a 2009 epic science fiction film directed, written, co-produced and co-edited by James Cameron, and starring Sam Worthington, Zoe Saldana, Stephen Lang, Michelle Rodriguez and Sigourney Weaver. It is set in the mid-22nd century when humans are colonizing Pandora, a lush habitable moon of a gas giant in the Alpha Centauri star system, in order to mine the valuable mineral unobtanium. The expansion of the mining colony threatens the continued existence of a local tribe of Na'vi – a humanoid species indigenous to Pandora.</p>
        <video width="640" height="360" controls>
            <source src="Assets/Videos/avatar_film_trailer.mp4">
            Your browser does not support playing videos.
        </video>
    </body>
</html>