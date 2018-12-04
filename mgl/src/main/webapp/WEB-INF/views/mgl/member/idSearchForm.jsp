<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon_180.png">
<link rel="icon" type="image/png" sizes="152x152" href="/resources/img/favicon_152.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon_32.png">        
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="/resources/img/favicon_144.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/resources/css/css.css?ver1" type="text/css" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js_st.js?ver1"></script>
<script src="/resources/js/jquery.form.min.js"></script>
<script src="/resources/js/Navi.js?ver2"></script>
<script src="/resources/js/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/prettydropdowns.css?ver2" type="text/css" />
<script src="/resources/js/jquery.prettydropdowns.js?ver2"></script>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script>
	function searchID(){
		var birth = $("#birth_1").val()+$("#birth_2").val()+$("#birth_3").val()
		var tel = $("#tel_1").val()+$("#tel_2").val()+$("#tel_3").val()
		alert(birth);
		$.ajax({
			async : true,
			type : 'post',
			data : JSON.stringify({"m_tel" : tel,"m_birth" : birth}),
			url : "/Member/IDsearch.techni",
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.m_id.length>3){
						alert(data.m_id)
						}else{
							swal("MGL","죄송합니다. 다시 시도해 주세요.")
						}
						
					},
	error : function(error){
		swal("MGL","error : " + error);
	}			
	})
	}
</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo" onclick="location.href='/Member/LoginForm.techni'">
				</div>
				<div class="tit_top">
					<h1>ID, PW 찾기</h1>
				</div>
				<div class="bt_top"></div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="pd_lrb">
				<span class="point_text">회원가입시 입력했던 정보를 입력해 주세요</span>
			</div>
			<div class="content white_bg join">
				<table class="table_form">
					<tr>
						<td class="td_ti"><strong class="point_text">생년월일</strong></td>
						<td>
							<input id = "birth_1" type="text" placeholder="YYYY" class="date1_input" maxlength="4">
							<span class="date_dot_i"></span>
							<input id = "birth_2"  type="text" placeholder="MM" class="date2_input" maxlength="2">
							<span class="date_dot_i"></span>
							<input id = "birth_3"  type="text" placeholder="DD" class="date2_input" maxlength="2">
						</td>
					</tr>
					<tr>
						<td class="td_ti"><strong class="point_text">휴대전화</strong></td>
						<td>
							<input id = "tel_1" type="text" class="phone_input" placeholder="000" maxlength="3">
							<span class="line_i"></span>
							<input id = "tel_2"   type="text" class="phone_input" placeholder="0000" maxlength="4">
							<span class="line_i"></span>
							<input id = "tel_3"  type="text" class="phone_input" placeholder="0000" maxlength="4">
						</td>
					</tr>
				</table>
				<div class="btn_full">
					<span class="btn_st" onClick="searchID()">확 인</span>
				</div>
			</div>
			<!-- content end -->
			<div class="content white_bg pwdata_check">
				<h4 class="title_m">정보확인</h4>
				<table class="table_form join">
					<tr>
						<td class="td_ti"><strong class="point_text">아이디</strong></td>
						<td>abcd@abcde.co.kr</td>
					</tr>
					<tr>
						<td class="td_ti"><strong class="point_text">이 름</strong></td>
						<td>홍길동</td>
					</tr>
				</table>
				<div class="btn_full">
					<span class="btn_st" onClick="location.href='#;'">비밀번호 초기화</span>
				</div>
			</div>
			<!-- content end -->

			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>