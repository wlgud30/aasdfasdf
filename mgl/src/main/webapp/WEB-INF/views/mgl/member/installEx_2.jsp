<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>MGL</title>
<%-- <% out.clear(); %> --%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon_180.png">
<link rel="icon" type="/resources/image/png" sizes="196x196" href="/resources/img/favicon_196.png">
<link rel="icon" type="/resources/image/png" sizes="32x32" href="/resources/img/favicon_32.png">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="/resources/css/jquery.mobile-1.4.5.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/install.css" type="text/css" />
<script src="/resources/js/jquery-1.11.0.min.js"></script>
<script src="/resources/js/jquery.mobile-1.4.5.js"></script>
<script src="/resources/js/customSwipePage.js?ver2"></script>

<script>
/* 	
	
	$(document).ready(function(){
		location.href='/Board/Download.techni';
		
	}); */
	
	function down(){
		location.href='/Board/Download.techni';
	}
</script>
</head>
<body>
<div id="wrap">
<header>
<div class="head_top">
<div class="logob_top"><img src="/resources/img/logo_b.svg" alt="MGLB"></div>
<div class="tit_top"><h1>설치 안내</h1></div>
<div class="bt_top">
  <span class="prev icon-left-arrow icon-f btn_circle"></span>
  <span class="next icon-right-arrow icon-f btn_circle"></span>
</div>
</div><!-- head_top end -->
</header>
<div id="container">
<section data-role="page" id="/Install/apkDownload2.techni" class="eventPage" data-title="다운로드 &amp; 설치" data-prev="/Install/apkDownload.techni" data-dom-cache="true">
  <div class="content white_bg">
  <h4 class="guide_m">현재 Beta Open 된 MGL-B는 <br class="short-w-view">테스트 기간입니다. <br>
    정식 Open 전까지 임시로 사용하는 <br class="short-w-view">다운로드 화면입니다. <br>
  <span class="text_gray"><span class="main_color">참조)</span> 안드로이드 폰만 가능 <br>(추후 ios 사용 가능하게 처리)</span>
  </h4>
  <div class="btn_full"><span class="btn_st" onclick="location.href='/Board/Download.techni'">APK file 다운로드</span></div>
  </div><!-- content end -->
  <div class="content white_bg">
  <h4 class="title_g tit_mbig">MGL-B 설치 화면</h4>
  <ul class="col2_lay">
  <li><img src="/resources/img/install_img_1.jpg" alt="보안을 위해 알 수 없는 출처에서 구매한 앱은 휴대전화에 설치되지 않도록 설정되어 있습니다. → 설정"></li>
  <li><img src="/resources/img/install_img_2.jpg" alt="잠금화면 및 보안, 출처를 알 수 없는 앱, Play 스토어 외에 다른  출처의 애플리케이션을 설치할 수 있도록 허용합니다."></li>
  <li><img src="/resources/img/install_img_3.jpg" alt="출처를 알 수 없는 앱, 출처를 알 수 없는 앱을 설치하면 디바이스 및 개인 데이터가 손상될 수 있습니다. 허용 버튼을 누르면, 출처를 알 수 없는 앱을 설치 한 후 발생할 수 있는 디바이스 및 데이터 손상에 대한 책임이 모두 사용자에게 있다는 것에 동의하는 것으로 간주됩니다. 이번에만 설치 허용"></li>
  <li><img src="/resources/img/install_img_4.jpg" alt="이 애플리케이션을 철치하시겠습니까? 특별한 액센스 권한이 필요하지 않습니다."></li>
  <li><img src="/resources/img/install_img_5.jpg" alt="설치중"></li>    
  <li><img src="/resources/img/install_img_6.jpg" alt="intro 첫화면"></li>
  </ul>
  </div><!-- content end -->
</section>
</div><!-- container end -->
<div id="ft_area"> </div>
</div><!-- wrap end -->
</body>
</html>
