<%-- 
    Document   : index
    Created on : 12/05/2017, 18:38:18
    Author     : lord
--%>

<%@page import="servlets.servletExibe.Dado"%>
<%@page import="servlets.servletConserta"%>
<%@page import="java.text.MessageFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Achei no campus</title>
        <style>
            div {
                border:1px solid black;
                max-width: 300px;
            }
        </style>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <h1>Todos os projetos</h1>
        <%

            //verifica se a sessão como usuario existe
            if (session != null && session.getAttribute("loginUsuario") != null) {
                out.print("<h2>Olá, " + session.getAttribute("loginUsuario") + ". Seja bem-vindo ao sistema</h1><br>");
            }

            //q = quantidade
            int q = 0;

            //verifica a quantidade que vai ser exibida
            q = servlets.servletExibe.contaTodos();

            //cria um vetor do tamanho certo pros dados a serem exibidos 
            Dado[] d = new Dado[q];

            //preenche o vetor
            d = servlets.servletExibe.exibeTodos();

            //conserta o nome das categorias e campus
            d = servlets.servletConserta.consertaTodos(d, q);

            //percorre o vetor e imprime da forma que quero
            for (int i = 0; i < q; i++) {

                out.print(MessageFormat.format("<div id=\"{0}\" class=\"projeto\">", d[i].id));
                out.print(MessageFormat.format("<h4 style=\"text-align: center;\">{0}</h4>", d[i].nome));
                out.print("Categoria: ");
                out.print(d[i].categoria);
                out.print("<br>");
                out.print("Endereço: ");
                out.print(d[i].endereco);
                out.print("<br>");
                out.print("Campus: ");
                out.print(d[i].campus);
                out.print("<br>");
                out.print("Horário: ");
                out.print(d[i].horario);
                out.print("<br>");
                out.print(d[i].site);
                out.print("<br>");
                out.print(d[i].email);
                out.print("<br>");
                out.print(d[i].facebook);
                out.print("<br>");
                out.print(d[i].descricao);
                out.print("<br>");
                out.print(d[i].tags);
                out.print("<br>");
                out.print("<br>");
                out.print("</div>");
                if (i < (q - 1)) {
                    out.print("<br>");
                }
            }
        %>
        <br><br>
        <div style="text-align: center;">
            <br><label style="">Refine sua busca:</label>
            <br><br>
            <form action="exibeFiltrado.jsp" method="post">
                <label>Campus</label>
                <select name="campus" id="campus">
                    <option value="pici">Pici</option>
                    <option value="benfica">Benfica</option>
                    <option value="poranga">Porangabuçu</option>
                    <option value="labomar">Labomar</option>
                </select>
                <br>
                <label>Categoria</label>
                <select name="cate" id="cate">
                    <option value="fisica">Física</option>
                    <option value="saude">Saúde</option>
                    <option value="cultura">Cultura</option>
                    <option value="lazer">Lazer</option>
                </select>
                <br>
                <input type="submit" value="Filtre" />
            </form>
            <br>
        </div>
        <script>

            //esse negocio aqui manipula exclusivamente o click do objeto em si
            function toJavascriptLinks(element) {
                element.href = "#";
                element.onclick = function () {
                    window.location = "exibe.jsp?id=" + this.id;
                };
            }

            //pra cada div, vai fazer um negocio
            $('.projeto').each(function (i, element) {
                toJavascriptLinks(element);
            });

        </script>
        <br><br><br>
        <a href="loginAdmin.jsp">Faça o seu login como adm</a><br/>
        <a href="loginUsuario.jsp">Faça o seu login como usuário</a>
    </body>
</html>