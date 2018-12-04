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
	   mapTypeControl: true,
       mapTypeControlOptions: {
       style: naver.maps.MapTypeControlStyle.BUTTON
       }
     });
	 var marker = new naver.maps.Marker({
     position: position,
     map: map
     });