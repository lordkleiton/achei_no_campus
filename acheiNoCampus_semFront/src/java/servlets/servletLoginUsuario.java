
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author lord
 */

public class servletLoginUsuario extends HttpServlet {

    static String url = variaveis.variaveis.url;
    static String user = variaveis.variaveis.user;
    static String password = variaveis.variaveis.password;
    static String driver = variaveis.variaveis.driver;
    static String select = variaveis.variaveis.selectUsuario;
    
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
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, user, password);

                Statement stmt = con.createStatement();

                ResultSet result = stmt.executeQuery(select);
                
                int contador = 1;
                
                while (result.next()) {
                    if(!modo.equals("fb")){
                        if (result.getString("email").equals(email)) {
                            if (result.getString("senha").equals(senha)){
                                login = result.getString("login");
                                contador = 0;
                                out.println(contador);
                                break;
                            } else
                                contador++;
                        } else
                                contador++;
                    }
                    else
                        if (result.getString("email").equals(email)) {
                            if (result.getString("login").equals(login)){
                                login = result.getString("login");
                                contador = 0;
                            }
                        }
                }
                
                if (contador == 0){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("loginUsuario", login);
                    response.sendRedirect("index.jsp");
                }
                else
                    out.println("oh shit niBBa");

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
