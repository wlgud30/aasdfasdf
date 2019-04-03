<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
<script>
function onlyNumber(){
    if((event.keyCode<48)||(event.keyCode>57))
       event.returnValue=false;
}
	
	$(document).ready(function(){
		var cd = "${uvo.u_club_gd}"
		var ts = "${uvo.u_tsize}"
		if(cd=="무급"){
			cd= "왕초";
		}
		$("option[value="+cd+"]").attr("selected","selected");
		$("option[value="+ts+"]").attr("selected","selected");
	});
	function fnUpload(){

		$('#file').click();

	}
	function loadImg(value){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function (e){
				$("#loadImg").attr('style','background-image: url('+e.target.result+')');
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	function pwChange(){
		$("#pw").attr("style","display:''");
		$("#pwch").attr("style","display:none")
	}
	function update(){
		var pw = $("#u_pw").val();
		var pwchk=$("#confirm_pw").val();
		if($("#phone1").val() == "" || $("#phone2").val() == "" ||$("#phone3").val() == ""){
			swal("민턴in","전화번호를 입력해 주세요.")
		}else if($("#gd").val()=="클럽 급수"){
			swal("민턴in","클럽 급수를 선택해 주세요.")
		}else if($("#email").val()==""){
			swal("민턴in","이메일을 입력해 주세요.")
		}else if($("#ts").val()=="T사이즈"){
			swal("민턴in","T 사이즈를 선택해 주세요.")
		}else if(pw!=pwchk){
			swal("민턴in","비밀번호가 일치하지 않습니다.")
			$("#u_pw").val("");
			$("#confirm_pw").val("");
		}else if(pw.length != 0 && pw.length < 6){
			swal("민턴in","비밀번호는 6자 이상으로 입력해 주세요.")
		}else{
			var tel = $("#phone1").val()+$("#phone2").val()+$("#phone3").val()
			var form = $("form")[0];
			var formData = new FormData(form);
			formData.append("tel",tel);
			swal({
				title : "민턴in",
				text : "저장 하시겠습니까?",
				buttons : true
			})
			.then((value) =>{
				if(value){
					$.ajax({
						type:'post',
						data : formData,
						url : "/UClub/UserUpdat.techni",
						datatype : "json",
						contentType: false,
					    processData: false, 
						success : function(data){
							if(data.cnt==1){
								swal({
									title : "민턴in",
									text : "수정이 완료되었습니다.",
									type : "success"
								})
								.then((value) =>{
									location.href = "/UClub/UClubMemberDetail.techni"
								})
							}else if(data.cnt==2){
								swal({
									title : "민턴in",
									text : "수정이 완료되었습니다.다시 로그인 해주세요.",
									type : "success"
								})
								.then((value) =>{
									var filter = "win16|win32|win64|mac";
									if(navigator.userAgent.indexOf("TOKEN:") != -1){
										if(navigator.platform){
											if(0 > filter.indexOf(navigator.platform.toLowerCase())){
												window.Android.appcall(0,"null","null");
												location.href="/Member/Logout.techni"
											}else{
												location.href="/Member/Logout.techni"
											}
										}
									}
								})
							}else{
								swal("민턴in","죄송합니다. 다시 시도해 주세요.")
							}
						},
						error : function(error){
							swal("민턴in","error : " + error);
						}
					});
				};
			});
		}
	}
</script>

			<!-- InstanceBeginEditable name="container" -->
			<form id="file_form" method="post" enctype="multipart/form-data">
			<div class="content white_bg">
				<div class="photo-data">
					<div class="img_upload_area">
						<div id="loadImg" class="img_upload"
							style="background-image: url(${uvo.u_photo})"></div>
							 <span class="photo_upload icon-camera" onClick="fnUpload()"></span>
					</div>
					<input name="file" type="file" accept="image/*" id="file" style="display:none" onchange="loadImg(this)"/>
					<!-- img_upload_are end -->
					<div class="tit_main">
						<ul class="li_row">
							<li><i class="icon-f i_font icon-man"></i>${uvo.u_nm}(${uvo.u_age}세/${uvo.u_sex == 'M' ? '남':'여'})</li>
							<li><i class="icon-f i_font icon-member_1"></i>${uvo.uc_mng }</li>
							<li><i class="icon-f i_font icon-enlist"></i>${uvo.u_c_indat }</li>
							<li><i class="icon-f i_font icon-cake"></i>${fn:substring(uvo.u_birth,0,4) }.${fn:substring(uvo.u_birth,4,6) }.${fn:substring(uvo.u_birth,6,8) }</li>
						</ul>
					</div>
				</div>
				<!-- photo-data end -->
				<hr class="line_div">
				<table class="table_form i_font-data">
					<tr>
						<td>
							<i class="icon-f i_font icon-mobile"></i>
							<input type="number" id="phone1" name="u_tel" class="phone_input"  value = "${fn:substring(uvo.u_tel,0,3) }" onkeypress="onlyNumber();" maxlength="3">
							<span class="line_i"></span>
							<input type="number" id="phone2" name="u_tel" class="phone_input"  value = "${fn:substring(uvo.u_tel,3,7) }" onkeypress="onlyNumber();" maxlength="4" >
							<span class="line_i"></span>
							<input type="number" id="phone3" name="u_tel" class="phone_input"  value = "${fn:substring(uvo.u_tel,7,11) }" onkeypress="onlyNumber();" maxlength="4" >
						</td>
						<td class="w10"><i class="icon-f i_font icon-class"></i><select id="gd" name="u_club_gd">
									<option value="클럽 급수">클럽 급수</option>
									<option value="자강" >자강</option>
									<option value="A" >A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="초심">초심</option>
									<option value="왕초">왕초</option>
							</select></td>
					</tr>
					<tr>
						<td><i class="icon-f i_font icon-email"></i><input id="email" class="input_email" type="email" name="u_email" value="${uvo.u_email }" placeholder="이메일을 등록해주세요."></td>
						<td class="w10"><i class="icon-f i_font icon-t-size"></i><select id="ts" name="u_tsize">
									<option value="T사이즈" >T사이즈</option>
													<option value="80">80</option>
													<option value="85">85</option>
													<option value="90">90</option>
													<option value="95">95</option>
													<option value="100">100</option>
													<option value="105">105</option>
													<option value="110">110</option>
													<option value="115">115</option>
													<option value="120">120</option>
							</select></td>
					</tr>
				</table>
						<div class="btn_full"  id="pwch">
							<span class="btn_st" onclick="pwChange()">비밀번호 변경</span>
						</div>
				<table class="table_form mb_t i_font-data" id="pw" style="display:none">  				
					<tr>
					    <td class="icon_td"><i class="i_font icon-key"></i></td>
						<td>
							<input type="password" placeholder="비밀번호 (6자리)" name="u_pw" id="u_pw">
					    </td>
					</tr>
					<tr>
					    <td class="icon_td"><i class="i_font icon-key"></i></td>					    
						<td>
							<input type="password" placeholder="비밀번호 중복입력" id="confirm_pw">
					    </td>
					</tr>
				</table>
			</div>
			</form>
			
			<!-- content end -->
			<!-- <div class="content white_bg">
				<table class="table_form">
					<tr>
						<td><div class="col_2input">
								<div>
									<input type="password" placeholder="비밀번호 (6자리)">
								</div>
								<div>
									<input type="password" placeholder="비밀번호 중복입력">
								</div>
							</div></td>
					</tr>
				</table>
			</div> -->
			<!-- content end -->
			<!-- InstanceEndEditable -->