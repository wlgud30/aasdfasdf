<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div id="wrap">
	  <header>
	    <div class="head_top"> <!-- InstanceBeginEditable name="head_top" -->
	      <div class="logo_top"><img src="/resources/img/logo.svg" alt="민턴in" class="logo" onClick="location.href='/Member/LoginForm.techni'"></div>
	      <div class="tit_top">
	        <h1>SNS 회원가입</h1>
	      </div>
	      <div class="bt_top"><span class="icon-delete icon-f btn_i i-text" onclick="location.href='/Member/LoginForm.techni'">취소</span></div>
	      <!-- InstanceEndEditable --> </div>
	    <!-- head_top end --> 
	  </header>
	  <div id="container"> <!-- InstanceBeginEditable name="container" -->
	    <script>	
	    $(document).ready(function(){	
	    var aa = $(location).attr('pathname').slice(-6, -5); 
		$('.col_3_step').navi_depth({pageNum:aa})
	     });
	    </script>  
	    <div class="content white_bg join">
	    <form action="/Member/MemberSnsInsert.techni" id="insertForm" method="post">
			<input type="hidden" name = "m_push" id="m_push">
			<input type="hidden" name = "m_id" id="m_id" value="${m_id}">
			<input type="hidden" name = "m_pw" id="m_pw" value="${m_pw}">
			<c:if test="${m_sex ne '' }">
				<input type="hidden" name = "m_sex" id="m_sex" value="${m_sex}">
			</c:if>
			<c:if test="${m_nm ne '' }">
				<input type="hidden" name = "m_nm" id="m_nm" value="${m_nm}">
			</c:if>
			<c:if test="${m_email ne ''}">
				<input type="hidden" name="m_email" id="m_email" value="${m_email }"/>
			</c:if>
			<input type="hidden" name="m_photo" id="m_photo"/>
			      <table class="table_form mb_t">
			        <tbody>
			          <tr>
			            <td>
			            	<input onfocus="this.placeholder=''" onblur="this.placeholder = 'YYYY'"onkeyup="ymdFocus()" type="number" name="m_birth" id="date1" placeholder="YYYY" class="date1_input" maxlength="4">
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
			          <c:if test="${m_email eq '' }">
				        <tr>
							<td>
								<input onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일(e-mail)'" id ="m_email" name="m_email" type="email" placeholder="이메일(e-mail)">
							</td>
						</tr>
					  </c:if>
			          <tr>
		            <td><p class="guide_text">급수를 선택하세요</p>
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
					</td>
		          </tr>
		          <tr>
			            	<td>
									<div class="col_2input">
										<c:if test="${m_sex eq '' }">
											<div>
												<ul class="list_check">
													<li><input type="radio" class="check_circle" id="check_1" name="m_sex" value="M">
													<label for="check_1">남</label></li>
													<li><input type="radio" class="check_circle" id="check_2" name="m_sex" value="F">
													<label for="check_2">여</label></li>
												</ul>
											</div>
										</c:if>
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
			        </tbody>
			      </table>
	      </form>
	    </div>
	    <!-- content end -->
	    <div class="btn_full pd_lrb">
	      <span class="btn_st" id="iBtn" >회원가입</span>
	    </div>
	    <!-- InstanceEndEditable --> </div>
	  <!-- container end -->
	  <div id="ft_area"><!-- InstanceBeginEditable name="ft_area" --> <!-- InstanceEndEditable --> </div>
	</div>
	<script>
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
		
		$("#iBtn").click(function() {

			var birth = $("input[name=m_birth]").val();
			if(birth == ""){
				swal("민턴in","생년월일을 입력해주세요.");
				$("#m_birth").focus();
				return;
			}
			var yy = new Date().getFullYear().toString().substr(-4)
			if(Number($("#date1").val()) > yy ||Number($("#date1").val()) < 1900 ||Number($("#date2").val()) > 12 ||Number($("#date3").val()) > 31 ){
				swal("민턴in","생년월일을 확인해주세요.");
				$("#m_birth").focus();
				return;
			}
			var phone1 = $("#phone1").val();
			if(phone1 == ""){
				swal("민턴in","휴대전화를 입력해주세요.");
				$("#phone1").focus();
				return;
			}else if(phone1.length < 3){
				swal("민턴in","휴대전화 번호를 확인해주세요.");
				$("#phone1").focus();
				return;
			}
			var phone2 = $("#phone2").val();
			if(phone2 == ""){
				swal("민턴in","휴대전화를 입력해주세요.");
				$("#phone2").focus();
				return;
			}else if(phone2.length < 3){
				swal("민턴in","휴대전화 번호를 확인해주세요.");
				$("#phone1").focus();
				return;
			}
			var phone3 = $("#phone3").val();
			if(phone3 == ""){
				swal("민턴in","휴대전화를 입력해주세요.");
				$("#phone3").focus();
				return;
			}else if(phone3.length < 4){
				swal("민턴in","휴대전화 번호를 확인해주세요.");
				$("#phone1").focus();
				return;
			}
			if("${m_sex}" == ""){
				if(!$("input[name=m_sex]:checked").val()==true){
					swal("민턴in","성별을 선택해해주세요.");
					$("#check_1").focus();
					return;
				}
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
							swal("민턴in","해당 정보로 등록된 아이디가 이미 있습니다.")
							return;
						}
					},
					error : function(error){
						swal("민턴in","error : " + error);
					}
				});
			
		});


		
	});
	function onlyNumber(){
	    if((event.keyCode<48)||(event.keyCode>57))
	       event.returnValue=false;
	}
	</script>
</body>
</html>