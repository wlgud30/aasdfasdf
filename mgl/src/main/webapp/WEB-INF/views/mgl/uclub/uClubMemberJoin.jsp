<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	var method = method || "post"; 	
	var path = "/UClub/UclubMUserList.techni";
	var form = document.createElement("form");
	var u_id = "${uvo.u_id}";
	var c_idx = "${uvo.c_idx}";
	var u_nm = "${uvo.u_nm}";
	var uc_mng = $("#uc_mng option:selected").val();
	if("${uvo.c_cnt}" >0 && uc_mng == "총무"){
		swal("민턴in","총무는 최대 1명까지 가능합니다.")
		return;
	}
		swal({
			title : "민턴in",
			text : "가입 승인 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
				if(value){
					$.ajax({
						async : true,
						type : 'post',
						data : JSON.stringify({"u_id" : u_id,"c_idx" : c_idx, "uc_mng" : uc_mng,"push_id" : push, "u_nm" : u_nm}),
						url : "/UClub/UClubJoinOK.techni",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data){
							if(data.cnt>0){
								swal({
									title:"민턴in",
									text : "가입이 승인 되었습니다.",
									type : "success"
								})
								.then((value) =>{
									pushTok(push,"${uvo.c_nm } 가입이 승인되었습니다.","${uvo.u_nm}","http://mgl.techni.co.kr:8081/UClub/UClubAllList.techni");
									
									form.setAttribute("method", method);
									form.setAttribute("action", path);
									var hiddenField = document.createElement("input");
									hiddenField.setAttribute("type", "hidden");
									hiddenField.setAttribute("name", "c_idx");
									hiddenField.setAttribute("value", c_idx);
									form.appendChild(hiddenField);
									
									document.body.appendChild(form);
								    form.submit();
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
	});
	
	$("#joinNO").click(function(){
		var method = method || "post"; 	
		var path = "/UClub/UclubMUserList.techni";
		var form = document.createElement("form");
		var u_id = "${uvo.u_id}";
		var c_idx = "${uvo.c_idx}";
			swal({
				title : "민턴in",
				text : "가입 거절 하시겠습니까?",
				buttons : true
			})
			.then((value) =>{
					if(value){
						$.ajax({
							async : true,
							type : 'post',
							data : JSON.stringify({"u_id" : u_id,"c_idx" : c_idx}),
							url : "/UClub/UClubJoinNO.techni",
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data){
								if(data.cnt>0){
									swal({
										title:"민턴in",
										text : "가입이 거절 되었습니다.",
										type : "success"
									})
									.then((value) =>{
									
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
					<span class="icon-approval icon-f btn_i i-text" id="joinOK" >승인 </span>
					<span class="icon-delete icon-f btn_i i-text" id="joinNO" >거절 </span>
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
							<td>${uvo.u_tel }</td>
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
							<td class="td_ti"><b>클럽직위</b></td>
							<td><select name="uc_mng" id="uc_mng">
									<option value="고문">고문</option>
									<option value="회장">회장</option>
									<option value="부회장">부회장</option>
									<option value="감사">감사</option>
									<option value="총무">총무</option>
									<option value="재무">재무</option>
									<option value="경기이사">경기이사</option>
									<option value="관리이사">관리이사</option>
									<option value="홍보이사">홍보이사</option>
									<option value="회원" selected="selected">회원</option>
							</select></td>
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