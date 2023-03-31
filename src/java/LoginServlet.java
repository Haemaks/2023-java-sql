import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");
        if (username.equals("Martin") && password.equals("1234")) response.getWriter().println("Successfully logged in!");
        else response.getWriter().println("Unsuccessful attempt to login " + username + " " + password);
    }
}