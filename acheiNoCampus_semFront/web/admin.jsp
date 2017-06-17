<%-- 
    Document   : admin
    Created on : 16/05/2017, 21:34:47
    Author     : lord
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.MessageFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Adiciona
        <form action="servletAdmin"  method="post" > 
            Nome <input type="text" name="nome"><br>
            <input type="radio" name="categoria" value="fisica"><label for="fisica"> Física</label><br>
            <input type="radio" name="categoria" value="saude"><label for="saude"> Saúde</label><br>
            <input type="radio" name="categoria" value="cultura"><label for="cultura"> Cultura</label><br>
            <input type="radio" name="categoria" value="lazer"><label for="lazer"> Lazer</label><br>
            Endereço <input type="text" name="endereco"><br>
            <input type="radio" name="campus" value="pici"><label for="pici"> Campus do Pici</label><br>
            <input type="radio" name="campus" value="benfica"><label for="benfica"> Campus do Benfica</label><br>
            <input type="radio" name="campus" value="poranga"><label for="poranga"> Campus do Porangabuçu</label><br>
            <input type="radio" name="campus" value="labomar"><label for="labomar"> Labomar</label><br>
            Horario <input type="text" name="horario"><br>
            Site <input type="text" name="site"><br>
            Email <input type="text" name="email"><br>
            Facebook <input type="text" name="facebook"><br>
            Descricao <input type="text" name="descricao"><br>
            Tags <input type="text" name="tags">

            <br>
            <input type="submit" value="Adiciona">
        </form>
        
        <br><br><br>
        Exclui
        <form action="servletAdmin"  method="post" > 
            ID<input type="text" name="id">
            <br>
            <input type="submit" value="Exclui">
        </form>
        <br><br><br>
        <form action="servletLogout" method ="post">
            <input type="submit" value="Logout">
        </form>
        
    </body>
</html>
