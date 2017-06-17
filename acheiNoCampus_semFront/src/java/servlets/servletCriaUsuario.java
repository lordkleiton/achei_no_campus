
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//importações de SQL
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lord
 */

public class servletCriaUsuario extends HttpServlet {
    
    static String url = variaveis.variaveis.url;
    static String user = variaveis.variaveis.user;
    static String password = variaveis.variaveis.password;
    static String insere = variaveis.variaveis.insereUsuario;
    static String driver = variaveis.variaveis.driver;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String login = request.getParameter("login");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String modo = request.getParameter("modo");
            
            try {
                out.println("<p>Redirecionando em 5 segundos.</p>");
                if(!modo.equals("fb"))
                    out.println("<script>setTimeout("
                            + "function(){window.location = "
                            + "\"servletLoginUsuario?email=" + email + "&senha=" 
                            + senha + "&modo=" + modo + "\";}, 5000)</script>");
                else
                    out.println("<script>setTimeout("
                            + "function(){window.location = "
                            + "\"servletLoginUsuario?email=" + email + "&login="
                            + login + "&modo=" + modo + "\";}, 5000)</script>");
                
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, user, password);

                PreparedStatement ps = con.prepareStatement(insere);
                
                ps.setString(1, login);
                ps.setString(2, email);
                ps.setString(3, senha);
                
                
                ps.executeUpdate();
                ps.clearParameters();

                con.close();
            } 
            catch (Exception ex) {
                Logger.getLogger(servletExibe.class.getName()).log(
                        Level.SEVERE, null, ex);
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
