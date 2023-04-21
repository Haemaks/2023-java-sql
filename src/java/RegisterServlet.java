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
            ResultSet rs = stmt.executeQuery(String.format("SELECT COUNT(*) FROM users WHERE username=\"%s\"", username));
            rs.next();
            //IF USER IS STILL NOT CREATED
            if (rs.getString(1).equals("0")) {
                ResultSet rs1 = stmt.executeQuery(String.format("INSERT INTO users (username, user_password) VALUES (\"%s\", \"%s\");",username, password));
                conn.close();
                response.getWriter().println("Successfully registered.\nWelcome " + username + " to my website!");
            }
            
            //ELSE
            else {
                response.getWriter().println("User already exists. Try logging instead.");
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().println("There\'s an error with the SQL statement");
            
        }
    }
}