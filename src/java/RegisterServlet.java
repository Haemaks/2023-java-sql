import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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

@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("psw");
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost/website_users");
            Statement stmt  = conn.createStatement();
            
            //IF USER IS STILL NOT CREATED
            if (stmt.executeQuery(String.format("SELECT id FROM users WHERE username=\"%s\"", username)).getString(1).equals("")) {
                String q = String.format("INSERT INTO users (username, user_password) VALUES (\"%s\", \"%s\");",username, password);
                ResultSet rs = stmt.executeQuery(q);
                conn.close();
                response.getWriter().println("Successfully registered.\nWelcome " + username + " to my website!");
            }
            
            //ELSE
            else {
                response.getWriter().println("User already exists. Try logging.");
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}