<%-- 
    Document   : testeC
    Created on : 06/06/2017, 01:23:44
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
        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #map {
                height: 100%;
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
        </style>
        <title>Gerenciador de lugares</title>
    </head>
    <body>
        <script src="https://maps.googleapis.com/maps/api/js?key=SUA_KEY_DO_GOOGLE_MAPS_AQUI&callback=initMap"
        async defer></script>
        <%

            int te = 0;

            String cate = request.getParameter("categoria");

            te = servlets.servletExibe.contaCategoria(cate);

            Dado[] d = new Dado[te];

            d = servlets.servletExibe.exibeCategoria(cate);

            out.print("<p id=\"linhas\" style=\"display: none;\">");
            out.print(te);
            out.print("</p>");

            out.print("<table border=\"1\" id=\"todas\" >");
            for (int q = 0; q < te; q++) {
                out.print("<tr>");
                out.print(MessageFormat.format("<td id=\"n{0}\">", q));
                out.print(d[q].nome);
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
        <div id="map"></div>
        <script>

            //aqui eu pego as informações a serem usadas
            //var ende = document.getElementById('endereco').textContent;
            //var nome = document.getElementById('nome').textContent;
            //var desc = document.getElementById('descricao').textContent;

            //aqui são a quantidade de linhas da tabela
            var linhas = document.getElementById("todas").rows.length;

            console.log(linhas);

            var issoae = new Array(linhas);

            for (var s = 0; s < linhas; s++)
                issoae[s] = document.getElementById('e' + s).textContent;

            for (var w = 0; w < linhas; w++)
                console.log(issoae[w]);

            //esqueleto da caixa de informação do mapa
            var contentString = '<div id="content">' +
                    '<div id="siteNotice"></div>' +
                    '<h1 id="titulo" class="firstHeading"></h1>' +
                    '<div id="bodyContent">' +
                    '<p id="desc"></p>' +
                    '<p id="ende"></p>' +
                    '</div>' +
                    '</div>';

            //cria um mapa qualquer
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 15,
                    center: {lat: -3.7460047, lng: -38.5749665}
                });

                var geocoder = new google.maps.Geocoder();

                geocodeAddress(geocoder, map);

            }

            //função do google que pega um endereço, transforma em coordenadas
            //joga pro mapa e ainda adiciona um marcador nele
            function geocodeAddress(geocoder, resultsMap) {
                //pega o endereço que eu mandei
                //var address = ende;
                var tst = new Array(linhas);
                for (var l = 0; l < linhas; l++) {
                    tst[l] = issoae[l];
                    geocoder.geocode({'address': tst[l]}, function (results, status) {
                        if (status === 'OK') {
                            resultsMap.setCenter(results[0].geometry.location);
                            var marker = new google.maps.Marker({
                                map: resultsMap,
                                position: results[0].geometry.location
                            });

                            var infowindow = new google.maps.InfoWindow({
                                content: contentString
                            });

                            //abre a caixa de informações quando clica no marcador
                            marker.addListener('click', function () {
                                infowindow.open(map, marker);
                                //document.getElementById('titulo').innerHTML = nome;
                                //document.getElementById('desc').innerHTML = desc;
                                //document.getElementById('ende').innerHTML = ende;
                            });
                        } else {
                            alert('Não foi possível fazer a conversão de endereço pro mapa pelo seguinte motivo: ' + status);
                        }
                    });
                }
            }
        </script>

    </body>
</html>
