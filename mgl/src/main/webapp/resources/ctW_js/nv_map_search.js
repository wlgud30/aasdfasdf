// map
       var position = new naver.maps.LatLng(37.51312, 126.8505218); //좌표값
       var map = new naver.maps.Map('map', {
       center: position,
	   scaleControl: false,
       logoControl: false,
       mapDataControl: false,
       zoomControl: true,
       zoomControlOptions: {
         style: naver.maps.ZoomControlStyle.SMALL
        },	   
       zoom: 11,   
	   mapTypeId: naver.maps.MapTypeId.NORMAL,
	   mapTypeControl: true,
       mapTypeControlOptions: {
       style: naver.maps.MapTypeControlStyle.BUTTON
       }
     });
	 var marker = new naver.maps.Marker({
     position: location,
     map: map
     });
	 var infowindow = new naver.maps.InfoWindow();
	 
function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

    infowindow.setContent('<div style="padding:20px;">' + 'geolocation.getCurrentPosition() 위치' + '</div>');

    infowindow.open(map, location);
    console.log('Coordinates: ' + location.toString());
}

function onErrorGeolocation() {
    var center = map.getCenter();

    infowindow.setContent('<div style="padding:20px;">' +
        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

    infowindow.open(map, center);
}

$(window).on("load", function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
        infowindow.open(map, center);
    }
});	 
	 
	 