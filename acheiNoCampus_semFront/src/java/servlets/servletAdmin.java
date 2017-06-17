package servlets;

//importações de servlets
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

public class servletAdmin extends HttpServlet {
    
    static String url = variaveis.variaveis.url;
    static String user = variaveis.variaveis.user;
    static String password = variaveis.variaveis.password;
    static String insere = variaveis.variaveis.insereAdmin;
    static String driver = variaveis.variaveis.driver;
    static String delete = variaveis.variaveis.delete;

    //aqui são as ações do servlet
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String nome = request.getParameter("nome");
            String categoria = request.getParameter("categoria");
            String endereco = request.getParameter("endereco");
            String campus = request.getParameter("campus");
            String horario = request.getParameter("horario");
            String site = request.getParameter("site");
            String email = request.getParameter("email");
            String facebook = request.getParameter("facebook");
            String descricao = request.getParameter("descricao");
            String tags = request.getParameter("tags");
            String id = request.getParameter("id");

            HttpSession session = request.getSession();

            if (session != null && session.getAttribute("login") != null) {
                if (nome != null && categoria != null && endereco != null && horario != null && descricao != null && campus != null) {
                    insere(nome, categoria, endereco, campus, horario, site, email, facebook, descricao, tags);
                    response.sendRedirect("index.jsp");
                } else {
                    exclui(id);
                    response.sendRedirect("index.jsp");
                }
            }

        }
    }

    //----------------------------------- MySQL -------------------------------------
    
    
    public static void insere(String nome, String categoria,
            String endereco, String campus, String horario, String site, String email,
            String facebook, String descricao, String tags) {
        try {
            Class.forName(driver);

            Connection con = DriverManager.getConnection(url, user, password);
            PreparedStatement ps = con.prepareStatement(insere);
            
            ps.setString(1, nome);
            ps.setString(2, categoria);
            ps.setString(3, endereco);
            ps.setString(4, campus);
            ps.setString(5, horario);
            ps.setString(6, site);
            ps.setString(7, email);
            ps.setString(8, facebook);
            ps.setString(9, descricao);
            ps.setString(10, tags);

            ps.executeUpdate();
            ps.clearParameters();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(servletAdmin.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

    }

    public static void exclui(String id) {
        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            PreparedStatement ps = con.prepareStatement(delete);

            ps.setString(1, id);
            ps.executeUpdate();
            con.close();
            
        } catch (Exception ex) {
            Logger.getLogger(servletAdmin.class.getName()).log(
                    Level.SEVERE, null, ex);
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
