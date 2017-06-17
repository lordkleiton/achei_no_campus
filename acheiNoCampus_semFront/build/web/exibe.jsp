<%-- 
    Document   : exibe
    Created on : 12/05/2017, 15:24:54
    Author     : lord
--%>

<%--
    Minha key do Google Maps: AIzaSyA6_6yiYvclHBE3E0kdtsPkDqxax7nAks8
--%>

<%@page import="servlets.servletExibe.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/css/mapa.css">
        <title>Achei no campus</title>
    </head>
    <body>
        <%
            //tenta pegar o id da página e jogar pras funções
            try {

                //tenta pegar a id da pagina
                String id_pagina = request.getParameter("id");

                //converte a string id em int id
                int id_p = Integer.valueOf(id_pagina);

                //instancia minha classe de dados
                Dado dado = new Dado();

                //tenta preencher com a id que foi passada
                dado = servlets.servletExibe.exibeMapa(id_p);

                //se o nome não for vazio
                if (!dado.nome.equals("")) {

                    //declara os scripts que vão ser usados
                    out.print("<div id=\"map\"></div>");
                    out.print("<script src=\"https://maps.googleapis.com/maps/ap"
                            + "i/js?key=AIzaSyA6_6yiYvclHBE3E0kdtsPkDqxax7nAks8&"
                            + "callback=initMap\" async defer></script>");
                    out.print("<script src=\"assets/js/geraMapaIndividual.js\" d"
                            + "efer></script>");

                    //imprime a tabela invisível que vai ser usada pelo mapa
                    out.print("<table border=\"1\">");
                    out.print("<tr>");
                    out.print("<td id=\"nome\">");
                    out.print(dado.nome);
                    out.print("</td>");
                    out.print("<td id=\"categoria\">");
                    out.print(dado.categoria);
                    out.print("</td>");
                    out.print("<td id=\"endereco\">");
                    out.print(dado.endereco);
                    out.print("</td>");
                    out.print("<td id=\"horario\">");
                    out.print(dado.horario);
                    out.print("</td>");
                    out.print("<td id=\"site\">");
                    out.print(dado.site);
                    out.print("</td>");
                    out.print("<td id=\"email\">");
                    out.print(dado.email);
                    out.print("</td>");
                    out.print("<td id=\"facebook\">");
                    out.print(dado.facebook);
                    out.print("</td>");
                    out.print("<td id=\"descricao\">");
                    out.print(dado.descricao);
                    out.print("</td>");
                    out.print("<td id=\"tags\">");
                    out.print(dado.tags);
                    out.print("</td>");
                    out.print("</tr>");
                    out.print("</table>");
                }
            } //caso aconteça qualquer erro em qualquer lugar (nesse caso sempre
            //vai ser relacionado ao id da pagina), mostra uma mensagem de erro
            catch (Exception E) {
                out.print("<h1>Erro - A página não pôde ser carregada</h1>");
                out.print("<h4>Razões possíveis:</h4>");
                out.print("<ul>");
                out.print("<li> A id do projeto é inválida");
                out.print("<li> A id do projeto está vazia");
                out.print("<li> O projeto não existe");
                out.print("</ul>");
            }
        %>
    </body>
</html>
