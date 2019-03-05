<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
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
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script type="text/javascript">
function phoneFocus(){
	if($("#phone1").val().length == 3){
		$("#phone2").focus();
		if($("#phone2").val().length == 4){
			$("#phone3").focus();
		}
	}else if($("#phone1").val().length == 3 && $("#phone2").val().length ==4 ){
		$("#phone3").focus();
	}
	
}
function ymdFocus(){
	
	if($("#date1").val().length == 4){
		$("#date2").focus();
		if($("#date2").val().length == 2){
			$("#date3").focus();
		}
	}else if($("#date1").val().length == 4 && $("#date2").val().length ==2 ){
		$("#date3").focus();
	}
	
}
	$(document).ready(function() {
		
		var c = navigator.userAgent.indexOf("TOKEN:")
		var a = navigator.userAgent.indexOf("AL:");
		$("#m_push").val(navigator.userAgent.substr(c+6,a-c-6).replace(" ",""))
		
		//id 입력칸에 영문과 숫자만 입력 가능하게 하는 함수
		$("#m_id").keyup(function(event){
			if(!(event.keyCode >= 37 && event.keyCode<=40)){
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
		});
		
		$("input[name=m_birth]").keyup(function(event){
			if(!(event.keyCode >= 37 && event.keyCode<=40)){
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		$("input[name=m_tel]").keyup(function(event){
			if(!(event.keyCode >= 37 && event.keyCode<=40)){
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		
		//아이디 중복체크
		var idck = 0;
		
		$("#idChk").click(function() {
			var m_id = $("#m_id").val();
			var m_id_num = m_id.search(/[0-9]/g);
			var m_id_eng = m_id.search(/[a-zA-Z]/g);
			if(m_id_num<0 && m_id_eng<0 ){
				swal("MGL","아이디는 영어나 숫자를 사용하여야 합니다.")
			}else{
			$.ajax({
				async : true,
				type : 'post',
				data : m_id,
				url : "/Member/IdCheck.techni",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if(data.cnt > 0) {
						swal("MGL","사용 할 수 없는 아이디 입니다.");
					}else{
						swal("MGL","사용 가능한 아이디 입니다.");
						idck = 1;
					}
				},
				error : function(error){
					swal("MGL","error : " + error);
				}
			});
			}
		});
		
		/* 달력 jquery 추가 */
		
		$("#m_id").focusout(function(){
			var m_id = $("#m_id").val();
			$.ajax({
				async : true,
				type : 'post',
				data : m_id,
				url : "/Member/IdCheck.techni",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if(data.cnt > 0) {
						idck = 0;
					}
				},
				error : function(error){
				}
			});
			
		});
		
		$("#iBtn").click(function() {
			
			var id = $("#m_id").val();
			if(id == ""){
				swal("MGL", "아이디를 입력해주세요.");
				$("#m_id").focus();
				return;
			}
			if(idck ==0){
				swal("MGL","아이디 중복체크를 해주세요.");
				$("#m_id").focus();
				return;
			}
			var pw1 = $("#m_pw").val();
			var pw2 = $("#confirm_pw").val();
			
			if(pw1.length <= 5){
				swal("MGL","비밀번호는 6자 이상으로 입력해주세요.");
				$("#m_pw").val().focus();
			}
			
			if(pw1 == ""){
				swal("MGL","비밀번호를 입력해주세요.");
				$("#m_pw").val().focus();
			}
			
			if(pw1 != pw2){
				swal("MGL","비밀번호가 동일하지 않습니다.");
				$("#confirm_pw").val("").focus();
				return;
			}
			var name = $("#m_nm").val();
			if(name == ""){
				swal("MGL","이름을 입력해주세요.");
				$("#m_nm").focus();
				return;
			}
			if(!$("input[name=m_sex]:checked").val()==true){
				swal("MGL","성별을 선택해해주세요.");
				$("#check_1").focus();
				return;
			}
			var birth = $("input[name=m_birth]").val();
			if(birth == ""){
				swal("MGL","생년월일을 입력해주세요.");
				$("#m_birth").focus();
				return;
			}
			var yy = new Date().getFullYear().toString().substr(-4)
			if(Number($("#date1").val()) > yy ||Number($("#date1").val()) < 1900 ||Number($("#date2").val()) > 12 ||Number($("#date3").val()) > 31 ){
				swal("MGL","생년월일을 확인해주세요.");
				$("#m_birth").focus();
				return;
			}
			var phone1 = $("#phone1").val();
			if(phone1 == ""){
				swal("MGL","휴대전화를 입력해주세요.");
				$("#phone1").focus();
				return;
			}else if(phone1.length < 3){
				swal("MGL","휴대전화 번호를 확인해주세요.");
				$("#phone1").focus();
				return;
			}
			var phone2 = $("#phone2").val();
			if(phone2 == ""){
				swal("MGL","휴대전화를 입력해주세요.");
				$("#phone2").focus();
				return;
			}else if(phone2.length < 3){
				swal("MGL","휴대전화 번호를 확인해주세요.");
				$("#phone1").focus();
				return;
			}
			var phone3 = $("#phone3").val();
			if(phone3 == ""){
				swal("MGL","휴대전화를 입력해주세요.");
				$("#phone3").focus();
				return;
			}else if(phone3.length < 4){
				swal("MGL","휴대전화 번호를 확인해주세요.");
				$("#phone1").focus();
				return;
			}
			
			var email = $("#m_email").val();
			var ex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(email !="" && email.match(ex) == null){
				swal("MGL","이메일 주소를 확인해주세요.");
				return;
			}
			
			if($("#date2").val().length == 1){
				$("#date2").val("0"+$("#date2").val())
			}
			if($("#date3").val().length==1){
				$("#date3").val("0"+$("#date3").val());
			}
			var tel = phone1.toString() + phone2.toString() + phone3.toString();
			var m_b = $("#date1").val()+$("#date2").val()+$("#date3").val()
				$.ajax({
					async : true,
					type : 'post',
					data : JSON.stringify({"m_birth" : m_b , "m_tel" : tel}),
					url : "/Member/birthTelCheck.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if(data.cnt == 0) {
							$("#insertForm").submit();
						}else{
							swal("MGL","해당 정보로 등록된 아이디가 이미 있습니다.")
							return;
						}
					},
					error : function(error){
						swal("MGL","error : " + error);
					}
				});
			
		});
		
		$("#mSelect").change(function(){
			var mSelected = $("#mSelect").val();
			
			if(mSelected != "0"){
				$("#email2").attr("readOnly", "true");
				$("#email2").val(mSelected);
			}else{
				$("#email2").val("");
				$("#email2").removeAttr("readOnly");
			}
		});
		
		$("#1_select").change(function(){
			var lcode = $("#1_select option:selected").val();
			if(lcode == '0'){
				$("#2_select option").remove();
				return;
			}
			$.ajax({
				data: "temp="+new Date() + "&1_select=" + lcode,
				dataType : "json",
				error : function(){
					swal("MGL","데이터를 정상적으로 호출하지 못하였습니다.");
				},
				success : SetSelectClub,
				type : "GET",
				url : "/Ajax/SmallSelectClub.techni"
			});
			
		});
		
	});
	
	/* 0511 - 디자인 변경으로 인하여 이전-> 현재 코드로 validation 적용필요 모든 디자인 적용 후 #작업예정# */
	function SetSelectClub(data){
		$("#2_select option").remove();
		var clubs = data.club;
		$("#2_select").append("<option value='0'> ===선택하세요=== </option value>");
		$.each(clubs, function(key, temp){
			var code = temp.code;
			var name = temp.name;
			$("#2_select").append("<option value='" + code  +"' >" + name + "</option>");
		});
	}

	function onlyNumber(){
        if((event.keyCode<48)||(event.keyCode>57))
           event.returnValue=false;
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
					<h1>회원가입</h1>
				</div>
				<div class="bt_top">
					<span class="icon-delete icon-f btn_i i-text" onClick="location.href='/Member/LoginForm.techni'">취소</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
			<div id="container">
				<form action="/Member/MemberInsert.techni" id="insertForm" method="post">
					<input type="hidden" name = "m_push" id="m_push">
					<!-- InstanceBeginEditable name="container" -->
					<div class="content white_bg join">
					
						<table class="table_form">
							<tbody>
								<tr>
									<td>
										<div class="col-inputside">
											<div>
												<input type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디 (영어나 숫자를 포함한 6글자 이상)'"placeholder="아이디 (영어나 숫자를 포함한 6글자 이상)" maxlength="13" name="m_id" id="m_id" />
											</div>
											<div class="side_data">
												<span class="btn_st btn_wh" id="idChk">중복확인</span>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
												<input type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 (6자리)'"placeholder="비밀번호 (6자리)" name="m_pw" id="m_pw" >
									</td>
								</tr>
								<tr>
									<td>
												<input type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 중복입력'" placeholder="비밀번호 중복입력" id="confirm_pw">
									</td>
								</tr>
								<tr>
									<td><div class="col-inputside">
											<div>
												<input type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름(실명)'" placeholder="이름(실명)" name="m_nm" id="m_nm">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
									<div class="col_2input">
										<div>
												<ul class="list_check">
													<li><input type="radio" class="check_circle" id="check_1" name="m_sex" value="M">
													<label for="check_1">남</label></li>
													<li><input type="radio" class="check_circle" id="check_2" name="m_sex" value="F">
													<label for="check_2">여</label></li>
												</ul>
											</div>
											<div>
												<select id="m_tsize" name="m_tsize">
													<option value="T사이즈" selected="selected">T사이즈</option>
													<option value="80">80</option>
													<option value="85">85</option>
													<option value="90">90</option>
													<option value="95">95</option>
													<option value="100">100</option>
													<option value="105">105</option>
													<option value="110">110</option>
													<option value="115">115</option>
													<option value="120">120</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<input onfocus="this.placeholder = ''" onblur="this.placeholder = 'YYYY'"onkeyup="ymdFocus()" type="number" name="m_birth" id="date1" placeholder="YYYY" class="date1_input" maxlength="4">
										<span class="date_dot_i"></span>
										<input onfocus="this.placeholder = ''" onblur="this.placeholder = 'MM'"onkeyup="ymdFocus()" type="number" name="m_birth" id="date2" placeholder="MM" class="date2_input" maxlength="2">
										<span class="date_dot_i"></span>
										<input onfocus="this.placeholder = ''" onblur="this.placeholder = 'DD'"type="number" name="m_birth" id="date3" placeholder="DD" class="date2_input" maxlength="2">
										<span class="guide_text">(생년월일)</span>
									</td>
								</tr>
								<tr>
									<td>
										<input onfocus="this.placeholder = ''" onblur="this.placeholder = '000'"type="number" name="m_tel" id="phone1" class="phone_input" placeholder="000" onkeypress="onlyNumber();" maxlength="3" onkeyup="phoneFocus()"><span class="line_i"></span>
										<input onfocus="this.placeholder = ''" onblur="this.placeholder = '0000'"type="number" name="m_tel" id="phone2" class="phone_input" placeholder="0000" onkeypress="onlyNumber();" maxlength="4" onkeyup="phoneFocus()"><span class="line_i"></span>
										<input onfocus="this.placeholder = ''" onblur="this.placeholder = '0000'"type="number" name="m_tel" id="phone3" class="phone_input" placeholder="0000" onkeypress="onlyNumber();" maxlength="4"><span class="guide_text">(휴대전화)</span>
									</td>
								</tr>
								<tr>
									<td>
										<input onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일(e-mail)'" id ="m_email" name="m_email" type="email" placeholder="이메일(e-mail)">
										<input type="hidden"  name="m_photo" id="m_photo"/>
									</td>
								</tr>
								<!--
								 <tr>
									<td>
										<div class="select_row w100">
										<div class="selectfrom">
											<select id="1_select">
														<option value="0">지역</option>
														<option value="1001">서울시</option>
														<option value="1002">경기도</option>
														<option value="1003">충청남도</option>
														<option value="1004">충청북도</option>
														<option value="1005">강원도</option>
														<option value="1006">전라북도</option>
														<option value="1007">전라남도</option>
														<option value="1008">경상북도</option>
														<option value="1009">경상남도</option>
														<option value="1010">인천광역시</option>
														<option value="1011">대전광역시</option>
														<option value="1012">세종시</option>
														<option value="1013">대구광역시</option>
														<option value="1014">울산광역시</option>
														<option value="1015">부산광역시</option>
														<option value="1016">광주광역시</option>
														<option value="1017">제주특별자치도</option>
													</select>
											</div>
											<div class="selectfrom">
													<select id="2_select">
														<option value="클럽(모임)">클럽(모임)</option>
													</select>
												</div>
										</div>
										input type="text" class="w100" id="clubInfo" readOnly>
									</td>
								</tr>
								-->
								<tr>
									<td>
										<p class="guide_text">급수를 선택하세요</p>
										<div class="select_row">
											<select name="m_club_gd">
												<option selected="selected">클럽</option>
												<option value="자강">자강</option>
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
												<option value="초심">초심</option>
												<option value="왕초">왕초</option>
											</select> 
											<select name="m_city_gd">
												<option selected="selected">시.군.구</option>
												<option value="자강">자강</option>
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
												<option value="초심">초심</option>
												<option value="왕초">왕초</option>
											</select> 
											<select name="m_do_gd">
												<option selected="selected">시.도</option>
												<option value="자강">자강</option>
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
												<option value="초심">초심</option>
												<option value="왕초">왕초</option>
											</select> 
											<select name="m_con_gd">
												<option selected="selected">전국</option>
												<option value="자강">자강</option>
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
												<option value="초심">초심</option>
												<option value="왕초">왕초</option>
											</select>
										</div> <!-- select_row end -->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- content end -->
					<div class="btn_full pd_lrb">
						<span class="btn_st"  id="iBtn" >회원가입</span>
					</div>
					<!-- InstanceEndEditable -->
				</form>
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