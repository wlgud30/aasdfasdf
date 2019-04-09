<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>

$(document).ready(function() {
	$("option[value=${uvo.uc_mng}]").attr("selected","selected")
	$("option[value=${uvo.u_club_gd}]").attr("selected","selected")
})

function userMngGd(){
	if("${uvo.c_cnt}" >0 && $("#uc_mng").val() == "총무"	){
		swal("민턴in","회장은 최대 1명까지 가능합니다.")
		return;
	}
	swal({
		title : "민턴in",
		text : "저장 하시겠습니까?",
		buttons : true
	})
	.then ((value) => {
			if(value){
				$.ajax({
					type : "post",
					data : JSON.stringify({"uc_mng" : $("#uc_mng").val() , "u_club_gd" : $("#u_club_gd").val()	, "u_id" : "${uvo.u_id}"}),
					url : "/UClub/UClubMemberViewUpdateProc.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							if($("#uc_mng").val() == "매니저"){
								location.href="/UClub/UClubUserList.techni"
							}else{
								location.href="/UClub/UclubMUserList.techni"
							}
						}else{
							swal("민턴in","죄송합니다. 다시 시도해 주세요.")
						}
					},
					error : function(error){
						swal("민턴in","error : " + error);
					}			
				})
			}
	})
}
function clubOut(){
	swal({
		title : "민턴in",
		text : "추방 하시겠습니까?",
		buttons : true
	})
	.then((value) =>{
			if(value){
				$.ajax({
					async : true,
					type : 'post',
					data : JSON.stringify({"u_id" : "${uvo.u_id}","u_mng" : "탈퇴"}),
					url : "/UClub/UClubOut.techni",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data){
						if(data.cnt>0){
							swal({
								title:"민턴in",
								text : "추방 되었습니다."
							})
							.then((value) =>{
								location.href='/UClub/UclubMUserList.techni'
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

</script>


<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="history.back();"></div>
				<div class="tit_top">
					<h1>회원정보 수정</h1>
				</div>
				<div class="bt_top">
					<c:if test="${uvo.uc_mng ne '매니저' }">
						<span class="icon-deport icon-f btn_i i-text" onclick="clubOut()">추방</span>
						<span class="icon-save icon-f btn_i i-text" onclick="userMngGd()">저장</span>
					</c:if>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<div class="photo-data">
					<div class="img_upload_area">
						<div onClick="location.href='#;'" class="img_upload"
							style="background-image: url(${uvo.u_photo})"></div>
					</div>
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
						<td><i class="icon-f i_font icon-mobile"></i>${fn:substring(uvo.u_tel,0,3) }<span class="line_i"></span>
								${fn:substring(uvo.u_tel,3,7) }<span class="line_i"></span>
								${fn:substring(uvo.u_tel,7,11) }
						</td>
						<td class="w10"><i class="icon-f i_font icon-class"></i>${uvo.u_club_gd }</td>
					</tr>
					<tr>
						<td><i class="icon-f i_font icon-email"></i>${uvo.u_email }</td>
						<td class="w10"><i class="icon-f i_font icon-t-size"></i>${uvo.u_tsize }</td>
					</tr>
				</table>
			<!-- content end -->
			<c:if test="${uvo.uc_mng ne '매니저' }">
				<table class="table_form">
					<tbody>
						<tr>
							<td><div class="col_2input wauto">
									<div>
										<select name="select" id = "uc_mng">
											<option value="클럽 지위">클럽 지위</option>
											<option value="고문">고문</option>
											<option value="회장">회장</option>
											<option value="부회장">부회장</option>
											<option value="감사">감사</option>
											<option value="총무">총무</option>
											<option value="재무">재무</option>
											<option value="경기이사">경기이사</option>
											<option value="관리이사">관리이사</option>
											<option value="홍보이사">홍보이사</option>
											<option value="회원">회원</option>
											<option value="매니저">매니저</option>
										</select>
									</div>
									<div>
										<select name="select" id = "u_club_gd">
											<option value="클럽 급수">클럽 급수</option>
											<option value="자강">자강</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
											<option value="초심">초심</option>
											<option value="왕초">왕초</option>
										</select>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_area" -->
			<!-- InstanceEndEditable -->
		</div>
	</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>