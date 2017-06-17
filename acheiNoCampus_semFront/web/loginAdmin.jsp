<%-- 
    Document   : login
    Created on : 16/05/2017, 23:47:59
    Author     : lord
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tela de login do Administrador</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
          
            if (session != null && session.getAttribute("login") != null)
                response.sendRedirect("admin.jsp");

        %>
        <div>Login Admin</div>
        <form action="servletLogin" method="post">
            Usuário: <input type="text" name="login" /><br/>
            Senha: <input type="password" name="senha" /><br/>
            <input type="submit" value="Login" />
        </form>
    </body>
</html>
