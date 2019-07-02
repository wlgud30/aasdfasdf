<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!doctype html>
<html>
<head>
<title>민턴in</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/ct_css/login.css?ver3"
	type="text/css" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/jquery.form.min.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>
<script src="/resources/ct_js/js_st.js?ver2"></script>
<link rel="stylesheet" href="/resources/ct_css/css.css?ver3"
	type="text/css" />
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var msg = "${msg}";
		var s = navigator.userAgent
		var c = navigator.userAgent.indexOf("TOKEN:")
		var a = navigator.userAgent.indexOf("AL:");
		var push ="";
		if(c != -1){
			if(a != -1){
				push = navigator.userAgent.substr(c+6,a-c-6);
			}else{
				push = navigator.userAgent.substr(c+6,s.length);
			}	
		}
		if(msg !="" && msg!=null){
			swal("민턴in",msg)
		}
				$("#iBtn").click(function(){
					var method = method || "post"; 
					var path = "/Member/Login.techni";
					var form = document.createElement("form");
					form.setAttribute("method", method);
					form.setAttribute("action", path);
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "m_push");
					hiddenField.setAttribute("value", push);
					var hiddenField2 = document.createElement("input");
					hiddenField2.setAttribute("type", "hidden");
					hiddenField2.setAttribute("name", "m_id");
					hiddenField2.setAttribute("value", $("#m_id").val());
					var hiddenField3 = document.createElement("input");
					hiddenField3.setAttribute("type", "hidden");
					hiddenField3.setAttribute("name", "m_pw");
					hiddenField3.setAttribute("value", $("#m_pw").val());
					form.appendChild(hiddenField);
					form.appendChild(hiddenField2);
					form.appendChild(hiddenField3);
					document.body.appendChild(form);
					form.submit();
				
				});
				
	$("#frm input[type=password]").keypress(function(e) { 

	    if (e.keyCode == 13){
	    	$("#iBtn").click();

	    }    
	});
	});
</script>
<body id="login_bg">
	<div id="wrap">
		<div class="head_top">
			<div class="btn_back"
				onClick="location.href='http://mgl.techni.co.kr:8081/'"></div>
			<div class="tit_top"></div>
		</div>
		<!-- head_top end -->
		<div id="login_area">
			<div id="login_form">
				<div id="login_cont">
					<img src="/resources/img/logo.svg" class="logo_img" alt="민턴in">
					<h3 class="login_title">로그인</h3>
					<div class="col-inputside">
						<div>
							<input type="text" placeholder="아이디" id="m_id"
								<c:if test="${m_id ne null }">value="${m_id }"</c:if>
								class="bold_text title_ms dark_font">
						</div>
						<div>
							<input type="password" placeholder="비밀번호" id="m_pw" name="m_pw"
								class="bold_text title_ms dark_font">
						</div>
						<div class="side_data pd_ls">
							<span class="btn_st" id="iBtn">로그인</span>
						</div>
					</div>
					<hr class="gap_b">
					<div class="btn_full col2_lay">
						<div>
							<span class="btn_st btn_color1"
								onclick="location.href='/Member/JoinForm.techni'">회원가입</span>
						</div>
						<div>
							<span class="btn_st btn_colorg popwin_btn0">ID, PW 찾기</span>
						</div>
					</div>
					<hr class="gap_b">
					<h3 class="vital_text left_lay tit_mb gray_text">참고</h3>
					<p class="left_lay pd_s gray_line gray1_color">임시회원(유한회원)은
						전화번호/생년월일입니다. 임시회원은 등록일로부터 3개월 사용 가능하고 회원 가입하시면 영구회원으로 전환 가능합니다.</p>
					<hr class="gap_b">
					<p class="tiny_text thin_text">Copyright 2018. Tech & I Korea
						Co.,Ltd. All Rights Reserved.</p>
				</div>
			</div>

			<!--login_form end-->
		</div>
	</div>
	<div class="popwin_size white_bg wsize-300">
		<div class="head_top title_popup">
			<div class="tit_top">
				<h1 class="game_title">ID·PW 찾기</h1>
			</div>
			<div class="bt_top">
				<span class="btn_i la la-close" id="p_close"
					onclick="location.href='#'"></span>
			</div>
		</div>
		<!-- title_popupp end -->
		<div class="popup_body">
			<span hidden="hedden" class="popwin_btn1"></span> 
			<span hidden="hedden" class="popwin_btn2"></span>
			<p class="vital_text tit_mb">회원가입시 입력했던 정보를 입력해 주세요.</p>
			<table class="table_form mb_m">
				<tr>
					<td class="td_ti"><strong class="point_text">생년월일</strong></td>
					<td><input id="u_birth" type="number" placeholder="('-' 제외 ex)19990101)"></td>
				</tr>
				<tr>
					<td class="td_ti"><strong class="point_text">핸드폰 번호</strong></td>
					<td><input id="u_tel" type="number" placeholder="('-' 제외 ex)01012345678)"></td>
				</tr>
			</table>
			<hr class="line_both">
			<div class="btn_full">
				<span class="btn_st" onClick="searchID()">정보조회</span>
			</div>
			<!-- col2_lay end -->
		</div>
		<!-- popup_body end-->
	</div>
	<!-- wrap end -->

	<div class="popwin_size white_bg wsize-300">
		<div class="head_top title_popup">
			<div class="tit_top">
				<h1 class="game_title">조회결과</h1>
			</div>
			<div class="bt_top">
				<span class="btn_i la la-close" id="p3_close"onclick="location.href='#'"></span>
			</div>
		</div>
		<!-- title_popupp end -->
		<div class="popup_body">
			<table class="table_form mb_m">
				<tr>
					<td class="td_ti"><strong class="point_text">성명</strong></td>
					<td id="u_nm"></td>
				</tr>
				<tr>
					<td class="td_ti"><strong class="point_text">아이디</strong></td>
					<td id="u_id"></td>
				</tr>
			</table>
			<h4 class="vital_text left_lay tit_mb gray_text">참고</h4>
			<p class="sm_font pd_s gray_line gray1_color mb_m">비밀번호 초기화 하시면
				PW는 생년월일이 됩니다. 나의 정보에서 비밀번호를 변경하실 수 있습니다.</p>
			<hr class="line_both">
			<div class="btn_full">
				<span class="btn_st" onClick="pwReset()">비밀번호 초기화</span>
			</div>
			<!-- col2_lay end -->
		</div>
		<!-- popup_body end-->
	</div>
	<!-- popwin_size end -->
	<div class="popwin_size white_bg wsize-300">
		<div class="head_top title_popup">
			<div class="tit_top">
				<h1 class="game_title">조회결과</h1>
			</div>
			<div class="bt_top">
				<span class="btn_i la la-close" id="p2_close"
					onclick="location.href='#'"></span>
			</div>
		</div>
		<!-- title_popupp end -->
		<div class="popup_body">
			<p class="pd_tb cet_lay">조회된 결과가 없습니다. 다시 입력해 주세요.</p>
			<hr class="gap_s">
			<hr class="line_both">
			<div class="btn_full">
				<span class="btn_st" onclick="re_click();">ID·PW 찾기</span>
			</div>
			<!-- col2_lay end -->
		</div>
		<!-- popup_body end-->
	</div>
	<!-- popwin_size end -->

</body>
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
						$(".popwin_btn1").click();
						$("#m_id").val(data.m_id);
					} else {
						$("#p_close").click();
						$("#p2_close").click();
						$(".popwin_btn2").click();
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
						$("#p3_close").click();
						swal("민턴in","비밀번호가 초기화되었습니다.")
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
			$(".popwin_btn0").click();
		}
	</script>
</html>
