<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!doctype html>
<html>
<head>
<title>민턴in</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" href="/resources/css/login.css?ver4" type="text/css"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/jquery.form.min.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var msg = "${msg}";
		var s = navigator.userAgent
		var c = navigator.userAgent.indexOf("TOKEN:")
		var a = navigator.userAgent.indexOf("AL:");
		if(c != -1){
			if(a != -1){
				$("#m_push").val(navigator.userAgent.substr(c+6,a-c-6));
			}else{
				$("#m_push").val(navigator.userAgent.substr(c+6,s.length));
			}	
		}
		if(msg !="" && msg!=null){
			swal("MGL",msg)
		}
				$("#iBtn").click(function(){
				
					$("#frm").attr("action", "/Member/Login.techni").submit();
				
				});
				
	$("#frm input[type=password]").keypress(function(e) { 

	    if (e.keyCode == 13){
	    	$("#frm").attr("action", "/Member/Login.techni").submit();

	    }    
	});
	});
</script>
<body id="login_bg">
	<div id="wrap">
		<div id="login_area">
			<div id="login_form">
				<div id="login_cont">
					<img src="/resources/img/logo.svg" class="logo_img" alt="민턴in">
					<!--div class="logo_box">  ' 리마크 함
						<h4>My Good Life</h4>
					</div-->
					<h3 class="login_title">로그인</h3>
					<form id="frm" method="post">
						<input type="hidden" name="m_push" id="m_push">
						<input type="text" placeholder="아이디(이메일)" name="m_id" <c:if test="${m_id ne null }">value="${m_id }"</c:if>> 
						<input type="password" placeholder="비밀번호" name="m_pw">
					<ul class="bt_area">
						<li><span class="bt_login act-color" id="iBtn">확인</span></li>
						<li>
							<span class="bt_login sub1-color half_bt"><a href="/Member/Terms.techni" id="joinBtn" >회원가입</a></span>
							<span class="bt_login sub1-color half_bt"><a href="/Member/idSearchForm.techni" id="idSearchBtn" >ID, P/W 찾기</a></span>
						</li>
					</ul>
					</form>
					<ul id="sns-login-li">
			          <li onClick="route('naver')"><img src="/resources/img/naver.svg">네이버 로그인</li>
			          <li onClick="route('kakao')"><img src="/resources/img/kakao.svg">카카오 로그인</li>
			          <li onClick="route('google')"><img src="/resources/img/google.svg">구글 로그인</li>                    
			        </ul>
				</div>
			</div>
			<!--login_form end-->
		</div>
	</div>
	        <%
					    String clientId = "Fsb84jPDLYb_rUsVeXOo";//애플리케이션 클라이언트 아이디값";
					    String redirectURI = URLEncoder.encode("http://mgl.techni.co.kr:8081/Member/naverLogin.techni", "UTF-8");
					    SecureRandom random = new SecureRandom();
					    String state = new BigInteger(130, random).toString();
					    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					    apiURL += "&client_id=" + clientId;
					    apiURL += "&redirect_uri=" + redirectURI;
					    apiURL += "&state=" + state;
					    session.setAttribute("state", state);
			%>
	<script type="text/javascript">
	 Kakao.init('2414323fe8d134c3fab9ad7f62f99cba'); 
		function route(route){
			 if(route=="google"){ 
				location.href="${google_url}"
				/* swal("MGL","서비스 준비 중 입니다.") */
			}else if(route=="naver"){
				location.href="<%=apiURL%>";
			}else if(route=="kakao"){
				location.href="https://kauth.kakao.com/oauth/authorize?client_id=d8193c16fc0293b7a0fbae13d2cc5e62&redirect_uri=http://mgl.techni.co.kr:8081/Member/kakaoLogin.techni&response_type=code"
			} 
		}
	</script>
</body>
</html>
