<%-- 
    Document   : listaCategoria
    Created on : 08/06/2017, 19:52:42
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
        <title>JSP Page</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <h1>Categorias</h1>
        <br>
        <%

            int te = 0;

            String cate = request.getParameter("categoria");

            te = servlets.servletExibe.contaCategoria(cate);

            Dado[] d = new Dado[te];

            d = servlets.servletExibe.exibeCategoria(cate);

            out.print("<p id=\"linhas\" style=\"display: none;\">");
            out.print(te);
            out.print("</p>");

            out.print("<table border=\"1\" id=\"todas\"  style=\"display: none;\">");
            for (int q = 0; q < te; q++) {
                out.print("<tr>");
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
            

            for (int q = 0; q < te; q++) {
                out.print("<div  style=\"border:1px solid black; max-width: 300px;\" >");
                out.print(MessageFormat.format("<h4 style=\"text-align: center;\">{0}</h4>", d[q].nome));
                out.print("Categoria: ");
                out.print(d[q].categoria);
                out.print("<br>");
                out.print("Endereço: ");
                out.print(d[q].endereco);
                out.print("<br>");
                out.print("Campus: ");
                out.print(d[q].campus);
                out.print("<br>");
                out.print("Horário: ");
                out.print(d[q].horario);
                out.print("<br>");
                out.print(d[q].site);
                out.print("<br>");
                out.print(d[q].email);
                out.print("<br>");
                out.print(d[q].facebook);
                out.print("<br>");
                out.print(d[q].descricao);
                out.print("<br>");
                out.print(d[q].tags);
                out.print("<br>");
                out.print("<br>");
                out.print("</div>");
                if (q < (te - 1))
                    out.print("<br>");
            }

        %>
        <script>
            function toJavascriptLinks(element){
                element.href="#";
                element.onclick = function(){
                                    alert('Yeah!');
                                  };
            }

            $('div').each(function(i, element){toJavascriptLinks(element);});
        </script>
    </body>
</html>
