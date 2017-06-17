
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlets.servletExibe.Dado;

/**
 *
 * @author lord
 */

public class servletConserta extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }
    
    public static Dado[] consertaTodos(Dado[] dado, int q) {
        for (int i = 0; i < q; i++) {
            if (dado[i].categoria.equals("fisica"))
                dado[i].categoria = "Física";
            if (dado[i].categoria.equals("saude"))
                dado[i].categoria = "Saúde";
            if (dado[i].categoria.equals("cultura"))
                dado[i].categoria = "Cultura";
            if (dado[i].categoria.equals("lazer"))
                dado[i].categoria = "Lazer";

            if (dado[i].campus.equals("pici"))
                dado[i].campus = "Pici";
            if (dado[i].campus.equals("benfica"))
                dado[i].campus = "Benfica";
            if (dado[i].campus.equals("poranga"))
                dado[i].campus = "Porangabuçu";
            if (dado[i].campus.equals("labomar"))
                dado[i].campus = "Labomar";

            if (dado[i].site.equals(""))
                dado[i].site = " - sem site - ";
            if (dado[i].email.equals(""))
                dado[i].email = " - sem email - ";
            if (dado[i].facebook.equals(""))
                dado[i].facebook = " - sem facebook - ";
            if (dado[i].tags.equals(""))
                dado[i].tags = " - sem tags - ";

        }

        return dado;
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
