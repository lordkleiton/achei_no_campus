<%-- 
    Document   : testeLogin
    Created on : 03/06/2017, 02:44:42
    Author     : lord
    FB ID: 306667859761619

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facebook Login JavaScript Example</title>
    </head>
    <body>
        <script>
            // This is called with the results from from FB.getLoginStatus().
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);
                // The response object is returned with a status field that lets the
                // app know the current login status of the person.
                // Full docs on the response object can be found in the documentation
                // for FB.getLoginStatus().
                if (response.status === 'connected') {
                    // Logged into your app and Facebook.
                    testAPI();
                } else {
                    // The person is not logged into your app or we are unable to tell.
                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into this app.';
                }
            }
            
            function checkLoginState() {
                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });
            }

            window.fbAsyncInit = function () {
                FB.init({
                    appId: '306667859761619',
                    cookie: true, // enable cookies to allow the server to access 
                    // the session
                    xfbml: true, // parse social plugins on this page
                    version: 'v2.8' // use graph api version 2.8
                });

                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });

            };

            // Load the SDK asynchronously
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/pt_BR/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

            // Here we run a very simple test of the Graph API after login is
            // successful.  See statusChangeCallback() for when this call is made.
            function testAPI() {
                FB.api('/me', {fields: 'name,email'}, function (response) {
                    window.location.href = "servletCriaUsuario?email=" + 
                            response.email + "&login=" + response.name + "&modo=fb";
                });
            }
        </script>

        <!--
          Below we include the Login Button social plugin. This button uses
          the JavaScript SDK to present a graphical Login button that triggers
          the FB.login() function when clicked.
        -->
        <div>Faça aqui seu login</div>
        <form action="servletLoginUsuario" method="post">
            Email: <input type="text" name="email" /><br/>
            Senha: <input type="password" name="senha" /><br/>
            <input type="text" name="modo" style="display:none;" />
            <input type="submit" value="Login" /><br/>
        </form>
        <br/>
        
        <div>Faça aqui seu cadastro</div>
        <form action="servletCriaUsuario" method="post">
            Seu nome: <input type="text" name="login" /><br/>
            Seu email: <input type="text" name="email" /><br/>
            Sua senha: <input type="password" name="senha" /><br/>
            <input type="text" name="modo" style="display:none;" />
            <input type="submit" value="Cadastrar" /><br/>
        </form>
        
        <br/>
        
        <div>Faça aqui seu login pelo facebook</div>
        <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
        </fb:login-button>
        <div id="status">
        </div>

    </body>
</html>
