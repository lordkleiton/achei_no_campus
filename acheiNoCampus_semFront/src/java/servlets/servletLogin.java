/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//importações de SQL
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lord
 */
public class servletLogin extends HttpServlet {

    static String url = variaveis.variaveis.url;
    static String driver = variaveis.variaveis.driver;
    static String user = variaveis.variaveis.user;
    static String password = variaveis.variaveis.password;
    static String select = variaveis.variaveis.selectAdmin;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url, user, password);

                Statement stmt = con.createStatement();

                ResultSet result = stmt.executeQuery(select);
                
                while (result.next()) {
                    if (result.getString("login").equals(login)) {
                        if (result.getString("senha").equals(senha)){
                            HttpSession session = request.getSession(true);
                            session.setAttribute("login", login);
                            response.sendRedirect("admin.jsp");
                        } else
                            response.sendRedirect("index.jsp");
                    }
                }

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
