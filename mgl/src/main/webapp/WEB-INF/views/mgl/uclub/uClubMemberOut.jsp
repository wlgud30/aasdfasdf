<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp"/>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script>
$(document).ready(function() {
	var push = "${uvo.u_push}";
	
	$("#joinOK").click(function(){
	var u_id = "${uvo.u_id}";
	var c_idx = "${uvo.c_idx}";
	var uc_mng = $("#uc_mng option:selected").val();
	
		swal({
			title : "MGL",
			text : "탈퇴 승인 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						data : JSON.stringify({"u_id" : u_id,"u_mng" : "탈퇴"}),
						url : "/UClub/UClubOut.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt>0){
								swal({
									title:"MGL",
									text : "탈퇴 승인 되었습니다."
								})
								.then((value) =>{
									location.href='/UClub/UclubMUserList.techni'
								})
							}else{
								swal("MGL","죄송합니다. 다시 시도해 주세요.")
							}
							
						},
		error : function(error){
			swal("MGL","error : " + error);
		}
	});
		};
	});
	});
	
	$("#joinNO").click(function(){
		var u_id = "${uvo.u_id}";
		var c_idx = "${uvo.c_idx}";
			swal({
				title : "MGL",
				text : "탈퇴 거절 하시겠습니까?",
				buttons : true
			})
			.then((value) =>{
					if(value){
						$.ajax({
							async : true,
							type : 'post',
							data : JSON.stringify({"u_id" : u_id,"u_mng" : "회원"}),
							url : "/UClub/UClubOut.techni",
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data){
								if(data.cnt>0){
									swal({
										title:"MGL",
										text : "탈퇴 거절 되었습니다."
									})
									.then((value) =>{
										location.href='/UClub/UclubMUserList.techni'
									})
								}else{
									swal("MGL","죄송합니다. 다시 시도해 주세요.")
								}
								
							},
			error : function(error){
				swal("MGL","error : " + error);
			}
		});
			};
		});
			});
});

</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onclick="history.back();"></div>
				<div class="tit_top">
					<h1><a href='/Board/BoardList.techni'>${uvo.c_nm }</a></h1>
				</div>
				<div class="bt_top">
					<span class="btn_st btn_wh" id="joinOK" >승인</span>
					<span class="btn_st btn_wh" id="joinNO" >거절</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
			<form action="/UClub/UClubJoinOK.techni" method="post" id="join">
				<input type="hidden" value="${uvo.c_idx }" name="c_idx">
				<input type="hidden" value="${uvo.u_id }" name="u_id">
					<table class="table_form line_no">
						<tr>
							<td class="td_ti"><b>소속클럽</b></td>
							<td>${uvo.c_nm }</td>
						</tr>
						<tr>							
							<td class="td_ti"><b>가입일자</b></td>
							<td>${uvo.u_join_date }</td>
						</tr>
						<tr>
							<td class="td_ti"><b>이 름</b></td>
							<td>${uvo.u_nm }</td>
						</tr>
						<tr>							
							<td class="td_ti"><b>생년월일</b></td>
							<td>${uvo.u_birth }</td>
						</tr>
						<tr>
							<td class="td_ti"><b>휴대전화</b></td>
							<td>${fn:substring(uvo.u_tel,0,3) }<span class="line_i"></span>
								${fn:substring(uvo.u_tel,3,7) }<span class="line_i"></span>
								${fn:substring(uvo.u_tel,7,11) }</td>
						</tr>
						<tr>							
							<td class="td_ti"><b>이메일</b></td>
							<td>${uvo.u_email }</td>
						</tr>
						<tr>
							<td class="td_ti"><b>T사이즈</b></td>
							<td>${uvo.u_tsize }</td>
						</tr>
						<tr>
							<td class="td_ti"><b>급수</b></td>
							<td>${uvo.u_club_gd }</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- content end -->
			<!-- content end -->
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-6, -5);
					$('.ft_menu').navi_depth({
						pageNum : aa
					})
				});
			</script>
			<ul class="ft_menu">
				<li onClick="location.href='/Board/BoardList.techni'"><span>공지</span></li>
				<li onClick="location.href='/Game/GameState.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
				<li onclick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>