<%-- 
    Document   : exibeFiltrado
    Created on : 10/06/2017, 16:32:48
    Author     : lord
--%>

<%@page import="java.text.MessageFormat"%>
<%@page import="servlets.servletExibe.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Achei no campus</title>
    </head>
    <body>
        
        <%

            int te = 0;

            String cate = request.getParameter("cate");
            String campus = request.getParameter("campus");

            te = servlets.servletExibe.contaCampusCategoria(campus, cate);

            Dado[] d = new Dado[te];

            d = servlets.servletExibe.exibeCampusCategoria(campus, cate);
            
            if (cate.equals("fisica"))
                cate = "Física";
            if (cate.equals("saude"))
                cate = "Saúde";
            if (cate.equals("cultura"))
                cate = "Cultura";
            if (cate.equals("lazer"))
                cate = "Lazer";
            
            if (campus.equals("pici"))
                campus = "Pici";
            if (campus.equals("benfica"))
                campus = "Benfica";
            if (campus.equals("poranga"))
                campus = "Porangabuçu";
            if (campus.equals("labomar"))
                campus = "Labomar";
            
            out.print(MessageFormat.format("<h1>Exibindo {1} no Campus do {0}</h1><br>", campus, cate));

            out.print("<p id=\"linhas\" style=\"display: none;\">");
            out.print(te);
            out.print("</p>");

            out.print("<table border=\"1\" id=\"todas\" >");
            for (int q = 0; q < te; q++) {
                out.print("<tr>");
                out.print(MessageFormat.format("<td id=\"c{0}\">", q));
                out.print(d[q].id);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"n{0}\">", q));
                out.print(MessageFormat.format("<a href=\"mapaCategoria.jsp?categoria={0}\">{1}</a>", d[q].categoria, d[q].nome));
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"c{0}\">", q));
                out.print(d[q].categoria);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"e{0}\">", q));
                out.print(d[q].endereco);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"e{0}\">", q));
                out.print(d[q].campus);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"h{0}\">", q));
                out.print(d[q].horario);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"s{0}\">", q));
                out.print(d[q].site);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"e{0}\">", q));
                out.print(d[q].email);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"f{0}\">", q));
                out.print(d[q].facebook);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"d{0}\">", q));
                out.print(d[q].descricao);
                out.print("</td>");
                out.print(MessageFormat.format("<td id=\"t{0}\">", q));
                out.print(d[q].tags);
                out.print("</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        %>
    </body>
</html>