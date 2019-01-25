<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js_st.js?ver1"></script>
<script src="/resources/js/jquery.form.min.js"></script>
<script src="/resources/js/Navi.js?ver1"></script>
<script src="/resources/js/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/prettydropdowns.css?ver2" type="text/css" />
<script src="/resources/js/jquery.prettydropdowns.js?ver2"></script>
<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="152x152" href="/resources/img/favicon_152.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon_32.png">        
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="/resources/img/favicon_144.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/css.css?ver1" type="text/css" />
</head>
<body>
	        <%
					    String clientId = "Fsb84jPDLYb_rUsVeXOo";//애플리케이션 클라이언트 아이디값";
					    String redirectURI = URLEncoder.encode("http://mgl.techni.co.kr:8081/Member/naverInsert.techni", "UTF-8");
					    SecureRandom random = new SecureRandom();
					    String state = new BigInteger(130, random).toString();
					    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					    apiURL += "&client_id=" + clientId;
					    apiURL += "&redirect_uri=" + redirectURI;
					    apiURL += "&state=" + state;
					    session.setAttribute("state", state);
			%>
<div id="wrap">
  <header>
    <div class="head_top"> <!-- InstanceBeginEditable name="head_top" -->
      <div class="btn_back" onClick="history.back();"></div>
      <div class="tit_top">
        <h1>가입방법 선택</h1>
      </div>
      <div class="bt_top"></div>
      <!-- InstanceEndEditable --> </div>
    <!-- head_top end --> 
  </header>
  <div id="container"> <!-- InstanceBeginEditable name="container" -->
    <div class="content white_bg join">
      <h4 class="title_m">SNS 회원가입</h4>
        <ul class="box_line_li ar_right">
          <li onClick="location.href='<%=apiURL%>'"><div class="sns_logo"><img src="/resources/img/naver.svg"></div><div>네이버 계정으로 회원가입</div></li>
          <li onClick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=d8193c16fc0293b7a0fbae13d2cc5e62&redirect_uri=http://mgl.techni.co.kr:8081/Member/kakaoLogin.techni&response_type=code'"><div class="sns_logo"><img src="/resources/img/kakao.svg"></div><div>카카오 계정으로 회원가입</div></li> 
<!--           <li onClick="googleClikc()"><div class="sns_logo"><img src="/resources/img/naver.svg"></div><div>네이버 계정으로 회원가입</div></li>
          <li onClick="googleClikc()"><div class="sns_logo"><img src="/resources/img/kakao.svg"></div><div>카카오 계정으로 회원가입</div></li> -->
          <li onClick="googleClikc()"><div class="sns_logo"><img src="/resources/img/google.svg"></div><div>구글 계정으로 회원가입</div></li>
          <li onClick="location.href='/Member/JoinForm.techni'"><div class="sns_logo"><img src="/resources/img/logo.png"></div><div>일반 회원가입</div></li>                    
        </ul>
    </div>
    <!-- content end -->
    <!-- <div class="content white_bg pwdata_check">
      <h4 class="title_m">ID, Password 회원가입</h4>
      <div class="btn_full">
        <span class="btn_st" onClick="location.href='/Member/JoinForm.techni'">회원가입</span>
      </div>
    </div> -->
    <!-- content end --> 
    
    <!-- InstanceEndEditable --> </div>
  <!-- container end -->
  <div id="ft_area"><!-- InstanceBeginEditable name="ft_area" --> <!-- InstanceEndEditable --> </div>
</div>
<script type="text/javascript">
function googleClikc(){
	location.href="${google_url}";
}
</script>
<!-- wrap end -->
</body>
</html>