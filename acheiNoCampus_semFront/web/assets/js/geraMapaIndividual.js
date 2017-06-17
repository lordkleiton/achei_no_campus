/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
    Created on : 10/06/2017, 17:44:50
    Author     : lord
*/

//aqui eu pego as informações a serem usadas
var ende = document.getElementById('endereco').textContent;
var nome = document.getElementById('nome').textContent;
var desc = document.getElementById('descricao').textContent;

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
        zoom: 16,
        center: {lat: -34.397, lng: 150.644}
    });

    var geocoder = new google.maps.Geocoder();

    geocodeAddress(geocoder, map);

}

//função do google que pega um endereço, transforma em coordenadas
//joga pro mapa e ainda adiciona um marcador nele
function geocodeAddress(geocoder, resultsMap) {
    //pega o endereço que eu mandei
    var address = ende;
    geocoder.geocode({'address': address}, function (results, status) {
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
                document.getElementById('titulo').innerHTML = nome;
                document.getElementById('desc').innerHTML = desc;
                document.getElementById('ende').innerHTML = ende;
            });
        } else {
            alert('Não foi possível fazer a conversão de endereço pro mapa pelo seguinte motivo: ' + status);
        }
    });
}