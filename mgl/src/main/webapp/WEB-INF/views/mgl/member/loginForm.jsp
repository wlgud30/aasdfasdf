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
<link rel="stylesheet" href="/resources/css/login.css?ver5" type="text/css"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/jquery.form.min.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>
<script src="/resources/js/js_st.js?ver2"></script>
<link rel="stylesheet" href="/resources/css/css.css?ver1" type="text/css" />
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
			swal("민턴in",msg)
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
						<input type="text" id="m_id" placeholder="아이디(이메일)" name="m_id" <c:if test="${m_id ne null }">value="${m_id }"</c:if>> 
						<input type="password" placeholder="비밀번호" name="m_pw">
					<ul class="bt_area">
						<li><span class="bt_login act-color" id="iBtn">확인</span></li>
						<li>
							<span class="bt_login sub1-color half_bt" onclick="location.href='/Member/Terms.techni'" id="joinBtn">회원가입</span>
							<span class="bt_login sub1-color half_bt popwin_btn1">ID, P/W 찾기</span>
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
		<div id="popwin_wrap">
			<div class="popwin_size white_bg wsize-300">
				<div class="head_top title_popup">
					<div class="tit_top">
						<h1 class="game_title">ID/PW 찾기</h1>
					</div>
					<div class="bt_top">
						<span class="btn_i la la-close" onclick="" id="p_close"></span>
					</div>
				</div>
				<!-- title_popupp end -->
				<div class="popup_body">
					<span hidden="hedden" class="popwin_btn2"></span>
					<span hidden="hedden" class="popwin_btn3"></span>
					<table class="table_form mb_m">
						<tr>
							<td class="td_ti"><strong class="point_text">생년월일&nbsp;&nbsp;:</strong></td>
							<td><input type="number" id="u_birth"></td>
						</tr>
						<tr>
							<td class="td_ti"><strong class="point_text">휴대전화&nbsp;&nbsp;:</strong></td>
							<td><input type="number" id="u_tel"></td>
						</tr>
					</table>
					<hr class="line_both">
					<div class="btn_full">
						<div>
							<span class="btn_st close_popup" onClick="searchID()">정보 조회</span>
						</div>
					</div>
					<!-- col2_lay end -->
				</div>
				<!-- popup_body end-->
			</div>
		</div>
		<div id="popwin_wrap">
			<div class="popwin_size white_bg wsize-300">
				<div class="head_top title_popup">
					<div class="tit_top">
						<h1 class="game_title">조회 결과</h1>
					</div>
					<div class="bt_top">
						<span class="btn_i la la-close" onclick=""></span>
					</div>
				</div>
				<!-- title_popupp end -->
				<div class="popup_body">
					<table class="table_form mb_m">
						<tr>
							<td class="td_ti"><strong class="point_text">성명&nbsp;&nbsp;:</strong></td>
							<td id="u_nm"></td>
						</tr>
						<tr>
							<td class="td_ti"><strong class="point_text">I&nbsp;&nbsp;&nbsp;D&nbsp;&nbsp;:</strong></td>
							<td id="u_id"></td>
						</tr>
					</table>
					<div style="text-align: center">
						<span style="font-size: 12px; color: gray; text-align: center;">비밀번호초기화 시 비밀번호는 생년월일로 설정 됩니다.</span>
					</div>
					<hr class="line_both">
					<div class="btn_full">
						<div>
							<span class="btn_st close_popup" onClick="pwReset()">비밀번호 초기화</span>
						</div>
					</div>
					<!-- col2_lay end -->
				</div>
				<!-- popup_body end-->
			</div>
		</div>
		<div id="popwin_wrap">
			<div class="popwin_size white_bg wsize-300">
				<div class="head_top title_popup">
					<div class="tit_top">
						<h1 class="game_title">조회 결과</h1>
					</div>
					<div class="bt_top">
						<span class="btn_i la la-close" id="p2_close"></span>
					</div>
				</div>
				<!-- title_popupp end -->
				<div class="popup_body">
					<div style="text-align: center">
						<span style="font-size: 13px; color: gray; text-align: center;">조회된 결과가 없습니다. 다시 입력해 주세요.</span>
					</div>
					<hr class="line_both">
					<div class="btn_full">
						<div>
							<span class="btn_st close_popup" onclick="re_click();">ID,P/W 찾기</span>
						</div>
					</div>
					<!-- col2_lay end -->
				</div>
				<!-- popup_body end-->
			</div>
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
			 /* if(route=="google"){ 
				location.href="${google_url}" */
				 swal("민턴in","서비스 준비 중 입니다.") 
			<%-- }else if(route=="naver"){
				location.href="<%=apiURL%>";
			}else if(route=="kakao"){
				location.href="https://kauth.kakao.com/oauth/authorize?client_id=d8193c16fc0293b7a0fbae13d2cc5e62&redirect_uri=http://mgl.techni.co.kr:8081/Member/kakaoLogin.techni&response_type=code"
			}  --%>
		}
		function searchID() {
			var birth = $("#u_birth").val().split("-").join("");
			var tel = $("#u_tel").val().split("-").join("");
			$("#u_birth").val("");
			$("#u_tel").val("");
			$.ajax({
				async : true,
				type : 'post',
				data : JSON.stringify({
					"m_tel" : tel,
					"m_birth" : birth
				}),
				url : "/Member/IDsearch.techni",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
						$("#u_nm").text(data.m_nm);
						$("#u_id").text(data.m_id);
						$("#p_close").click();
						$(".popwin_btn2").click();
						$("#m_id").val(data.m_id);
					} else {
						$("#p_close").click();
						$("#p2_close").click();
						$(".popwin_btn3").click();
					}

				},
				error : function(error) {
					swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
				}
			})
		}
		function pwReset() {
			$.ajax({
				async : true,
				type : 'post',
				data : JSON.stringify({
					"m_id" : $("#u_id").text()
				}),
				url : "/Member/PwReset.techni",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if (data.cnt > 0) {
					} else {
						swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
					}

				},
				error : function(error) {
					swal("민턴in", "죄송합니다. 다시 시도해 주세요.")
				}
			})
		}
		function re_click(){
			$("#p_close").click();
			$("#p2_close").click();
			$(".popwin_btn1").click();
		}
	</script>
</body>
</html>
