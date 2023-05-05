import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String user_password = request.getParameter("password");
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost/website_users");
            Statement stmt  = conn.createStatement();
            ResultSet rs1 = stmt.executeQuery(String.format("SELECT COUNT(*) FROM users WHERE username=\"%s\"", username));
            rs1.next();
        
            //IF USER ALREADY EXISTS
            if (rs1.getString(1).equals("1")) {
                
                ResultSet rs2 = stmt.executeQuery(String.format("SELECT user_password FROM users WHERE username=\"%s\"", username));
                rs2.next();
                
                //IF THE PASSWORD IS CORRECT
                if (rs2.getString(1).equals(user_password)) {
                    
                    ResultSet rs3 = stmt.executeQuery(String.format("SELECT rang FROM users WHERE username=\"%s\"", username));
                    rs3.next();
                    String user_rang = rs3.getString(1);
                    
                    Cookie c1 = new Cookie("rang", user_rang);
                    c1.setMaxAge(7200);
                    response.addCookie(c1);
                    
                    response.sendRedirect("index.jsp");
                }
                
                else {
                    response.getWriter().println("Incorrect password. Try again.");
                }
            }
        
            else {
                response.getWriter().println("User does not exist. Try registering instead.");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().println("There\'s an error with the SQL statement");
            
        } catch(ClassNotFoundException ex) {
            
        }
        
        
    }
}