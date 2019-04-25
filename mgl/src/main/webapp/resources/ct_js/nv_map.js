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
	 
	 var contentString = [
        '<div class="iw_inner">',
        '       <a href="04-01_club_info_view4.html">',		
        '   <h4>클럽명 타이틀</h4>',
        '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
        '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
        '   </p>',		
        '       <p class="bd_link main_color">상세 정보 보기</p>',
		'       </a>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString,
    borderColor: "#5f71d4",
    borderWidth: 1,
    anchorSize: new naver.maps.Size(10, 10)
});;

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});