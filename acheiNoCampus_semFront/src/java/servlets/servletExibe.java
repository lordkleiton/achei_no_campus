
package servlets;

//importações de servlet
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//importações de SQL
import java.sql.*;
import java.text.MessageFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lord
 */

public class servletExibe extends HttpServlet {

    public static class Dado {
        public String id;
        public String nome;
        public String categoria;
        public String endereco;
        public String campus;
        public String horario;
        public String site;
        public String email;
        public String facebook;
        public String descricao;
        public String tags;
        
    }
    
    static String url = variaveis.variaveis.url;
    static String user = variaveis.variaveis.user;
    static String password = variaveis.variaveis.password;
    static String driver = variaveis.variaveis.driver;
    static String selectGenerico = variaveis.variaveis.selectGenerico;
    static String selectCampus = variaveis.variaveis.selectCampus;
    static String selectCategoria = variaveis.variaveis.selectCategoria;
    static String selectCampusCategoria = variaveis.variaveis.selectCampusCategoria;
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }
    
    public static int contaTodos() {
        int numero = 0;
        
        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();

            ResultSet result = stmt.executeQuery(selectGenerico);

            while (result.next()) {
                numero++;
            }

            con.close();
            
        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return numero;

    }

    public static int contaCampus(String campus) {
        int numero = 0;

        try {
            String select = MessageFormat.format(selectCampus, campus);
            
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();

            ResultSet result = stmt.executeQuery(select);

            while (result.next()) {
                numero++;
            }

            con.close();

        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return numero;

    }

    public static int contaCategoria(String categoria) {
        int numero = 0;

        try {
            String select = MessageFormat.format(selectCategoria, categoria);

            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();

            ResultSet result = stmt.executeQuery(select);

            while (result.next()) {
                numero++;
            }

            con.close();

        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return numero;

    }

    public static int contaCampusCategoria(String campus, String categoria) {
        int numero = 0;

        try {
            String select = MessageFormat.format(selectCampusCategoria, campus, categoria);

            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();

            ResultSet result = stmt.executeQuery(select);

            while (result.next()) {
                numero++;
            }

            con.close();

        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return numero;

    }

    public static Dado exibeMapa(int identi) {
        Dado retorno = new Dado();

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();

            ResultSet result = stmt.executeQuery(selectGenerico);

            while (result.next()) {
                if (result.getString("id").equals(Integer.toString(identi))) {
                    retorno.nome = (result.getString("nome"));
                    retorno.categoria = (result.getString("categoria"));
                    retorno.endereco = (result.getString("endereco"));
                    retorno.horario = (result.getString("horario"));
                    retorno.site = (result.getString("site"));
                    retorno.email = (result.getString("email"));
                    retorno.facebook = (result.getString("facebook"));
                    retorno.descricao = (result.getString("descricao"));
                    retorno.tags = (result.getString("tags"));
                }
            }

            con.close();

        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return retorno;
    }

    public static Dado[] preenche(Dado[] r, ResultSet result, int tamanho) {
        try {
            while (result.next()) {
                for (int i = 0; i < tamanho; i++) {
                    r[i].id = (result.getString("id"));
                    r[i].nome = (result.getString("nome"));
                    r[i].categoria = (result.getString("categoria"));
                    r[i].endereco = (result.getString("endereco"));
                    r[i].campus = (result.getString("campus"));
                    r[i].horario = (result.getString("horario"));
                    r[i].site = (result.getString("site"));
                    r[i].email = (result.getString("email"));
                    r[i].facebook = (result.getString("facebook"));
                    r[i].descricao = (result.getString("descricao"));
                    r[i].tags = (result.getString("tags"));

                    result.next();
                }
            }
        } catch (Exception e) {
            System.out.println("");
        }
        return r;
    }

    public static Dado[] exibeTodos() {
        int tamanho = contaTodos();

        Dado[] r = new Dado[tamanho];

        for (int a = 0; a < tamanho; a++) {
            r[a] = new Dado();
        }

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            
            ResultSet result = stmt.executeQuery(selectGenerico);
            
            r = preenche(r, result, tamanho);
            
        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return r;

    }

    public static Dado[] exibeCampus(String campus) {
        int tamanho = contaCampus(campus);

        String select = MessageFormat.format(selectCampus, campus);

        Dado[] r = new Dado[tamanho];

        for (int a = 0; a < tamanho; a++) {
            r[a] = new Dado();
        }

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            
            ResultSet result = stmt.executeQuery(select);

            while (result.next()) {
                if (result.getString("campus").equals(campus)) {
                    for (int i = 0; i < tamanho; i++) {
                        r[i].id = (result.getString("id"));
                        r[i].nome = (result.getString("nome"));
                        r[i].categoria = (result.getString("categoria"));
                        r[i].endereco = (result.getString("endereco"));
                        r[i].campus = (result.getString("campus"));
                        r[i].horario = (result.getString("horario"));
                        r[i].site = (result.getString("site"));
                        r[i].email = (result.getString("email"));
                        r[i].facebook = (result.getString("facebook"));
                        r[i].descricao = (result.getString("descricao"));
                        r[i].tags = (result.getString("tags"));

                        result.next();
                    }
                }

            }
        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return r;

    }

    public static Dado[] exibeCategoria(String categoria) {
        int tamanho = contaCategoria(categoria);

        String select = MessageFormat.format(selectCategoria, categoria);

        Dado[] r = new Dado[tamanho];

        for (int a = 0; a < tamanho; a++) {
            r[a] = new Dado();
        }

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            
            ResultSet result = stmt.executeQuery(select);

            while (result.next()) {
                if (result.getString("categoria").equals(categoria)) {
                    for (int i = 0; i < tamanho; i++) {
                        r[i].id = (result.getString("id"));
                        r[i].nome = (result.getString("nome"));
                        r[i].categoria = (result.getString("categoria"));
                        r[i].endereco = (result.getString("endereco"));
                        r[i].campus = (result.getString("campus"));
                        r[i].horario = (result.getString("horario"));
                        r[i].site = (result.getString("site"));
                        r[i].email = (result.getString("email"));
                        r[i].facebook = (result.getString("facebook"));
                        r[i].descricao = (result.getString("descricao"));
                        r[i].tags = (result.getString("tags"));

                        result.next();
                    }
                }

            }
        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return r;

    }

    public static Dado[] exibeCampusCategoria(String campus, String categoria) {
        int tamanho = contaCampusCategoria(campus, categoria);

        String select = MessageFormat.format(selectCampusCategoria, campus, categoria);

        Dado[] r = new Dado[tamanho];

        for (int a = 0; a < tamanho; a++) {
            r[a] = new Dado();
        }

        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            
            ResultSet result = stmt.executeQuery(select);

            while (result.next()) {
                if (result.getString("campus").equals(campus) && result.getString("categoria").equals(categoria)) {
                    for (int i = 0; i < tamanho; i++) {
                        r[i].id = (result.getString("id"));
                        r[i].nome = (result.getString("nome"));
                        r[i].categoria = (result.getString("categoria"));
                        r[i].endereco = (result.getString("endereco"));
                        r[i].campus = (result.getString("campus"));
                        r[i].horario = (result.getString("horario"));
                        r[i].site = (result.getString("site"));
                        r[i].email = (result.getString("email"));
                        r[i].facebook = (result.getString("facebook"));
                        r[i].descricao = (result.getString("descricao"));
                        r[i].tags = (result.getString("tags"));

                        result.next();
                    }
                }

            }
        } catch (Exception ex) {
            Logger.getLogger(servletExibe.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        return r;

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
