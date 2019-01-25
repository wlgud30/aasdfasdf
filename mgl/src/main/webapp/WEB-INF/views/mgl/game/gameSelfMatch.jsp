<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
	
});
var q = 1


function formSubmit(){
	alert($("#frm").serialize());
	if($("#cs_nm").val()=="" || $("#cs_nm").val()==null){
		swal("MGL","대회 명을 입력해 주세요.");
		return false;
	}
	if($("#cs_start").val()=="" || $("#cs_start").val()==null){
		swal("MGL","대회 일자를 입력해 주세요.");
		return false;
	}
	if($("#cs_sTime1").val()=="" || $("#cs_sTime1").val()==null ||$("#cs_sTime2").val()=="" || $("#cs_sTime2").val()==null){
		swal("MGL","대회 시간을 입력해 주세요.");
		return false;
	}
	if($("#cs_eTime1").val()=="" || $("#cs_eTime1").val()==null ||$("#cs_eTime2").val()=="" || $("#cs_eTime2").val()==null){
		swal("MGL","대회 시간을 입력해 주세요.");
		return false;
	}
	if($("#cs_point").val()=="" || $("#cs_point").val()==null){
		swal("MGL","점수를 입력해 주세요.");
		return false;
	}
	if($("#cs_time").val()=="" || $("#cs_time").val()==null){
		swal("MGL","소요시간을 입력해 주세요.");
		return false;
	}
	if($("#cs_end").val()=="" || $("#cs_end").val()==null){
		swal("MGL","등록마감 시간을 입력해 주세요.");
		return false;
	}
	if($("#cs_cnm").val()=="" || $("#cs_cnm").val()==null){
		swal("MGL","체육관 명을 입력해 주세요.");
		return false;
	}
	if($("#cs_location").val()=="" || $("#cs_location").val()==null){
		swal("MGL","체육관 위치를 입력해 주세요.");
		return false;
	}
	if(!$('input:radio[name=cs_meth]').is(':checked')){
		swal("MGL","대회 방식을 선택해 주세요.");
		return false;
	}
	if($("#cs_body").val()=="" || $("#cs_body").val()==null){
		swal("MGL","대회 소개를 입력해 주세요.");
		return false;
	}
	
	var fs = $("#frm").serialize();
	swal({
		title : "MGL",
		text : "자체대회를 등록하시겠습니까?",
		buttons : {
			confirm : "OK",
			cancel : "NO"
		}
	})
	.then((value) => {
		if(value){
			$.ajax({
				type:"post",
				data : fs,
				url : "/Game/selfMatchInsert.techni",
				datatype : "json",
				success : function(data){
					if(data.cnt>0){
						swal({
							title : "MGL",
							text : "자체대회가 등록되었습니다.",
							type : "success"
						})
						.then((value) =>{
							 location.href="/Board/BoardList.techni";
						})
					}else{
						swal("MGL","죄송합니다. 다시 시도해 주세요.")
					}
				},
				error : function(error){
					swal("MGL","error : "+error);
				}
			}) 
		}
	})
}

</script>
<body>
	<div id="wrap">
		<header>
		<div class="head_top">
			<!-- InstanceBeginEditable name="head_top" -->
			<div class="btn_back" onClick="history.back();"></div>
			<div class="tit_top">
				<h1>대회생성</h1>
			</div>
			<div class="bt_top">
				<!-- <span class="icon-match icon-f btn_i i-text">대진표생성</span>  -->
				<span class="icon-save icon-f btn_i i-text" onclick="formSubmit()">등록</span>
			</div>
			<!-- InstanceEndEditable -->
		</div>
		<!-- head_top end --> </header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<form id="frm"  method="post" action="/Game/selfMatchInsert.techni">
				<div class="content white_bg">
					<table class="table_form">
						<tr>
							<td><input type="text" placeholder="대회명" name="cs_nm" id="cs_nm"></td>
						</tr>
						<tr>
							<td><div class="col_2input">
									<div>
										<p class="guide_text">대회일자</p>
										<input type="text" class="date_pick" name="cs_start" id="cs_start">
										<span class="date_icon_btn" onclick="location.href='#;'"></span>
									</div>
									<div>
										<p class="guide_text">대회시간</p>
										<input type="text" name="cs_sTime1" id="cs_sTime1" class="time_input" placeholder="00" maxlength="2">
										<span class="second_i"></span>
										<input type="text" name="cs_sTime2" id="cs_sTime2"class="time_input" placeholder="00" maxlength="2">
										<span class="time_line_i"></span>
										<input type="text" name="cs_eTime1" id="cs_eTime1"class="time_input" placeholder="00" maxlength="2">
										<span class="second_i"></span>
										<input type="text" name="cs_eTime2" id="cs_eTime2"class="time_input" placeholder="00" maxlength="2">
									</div>
								</div></td>
						</tr>
						<tr>
							<td><div class="col_2input wauto">
									<div>
										<span class="guide_text left_guide">점수</span>
										<input type="text" name="cs_point" id="cs_point"class="time_input" placeholder="00" maxlength="2">
									</div>
									<div>
										<span class="guide_text left_guide">소요분</span>
										<input name="cs_time" id="cs_time"type="text" class="time_input" placeholder="00" maxlength="2">
									</div>
								</div></td>
						</tr>
						<tr>
							<td><span class="guide_text left_guide">등록마감</span>
							<input type="text" name="cs_end" id="cs_end" class="date_pick">
							<span class="date_icon_btn" onclick="location.href='#;'"></span></td>
						</tr>
						<tr>
							<td><input type="text" name="cs_cnm" id="cs_cnm" placeholder="대회 체육관"></td>
						</tr>
						<tr>
							<td><input type="text" name="cs_location" id="cs_location" placeholder="체육관 위치"></td>
						</tr>
						<tr>
							<td><span class="guide_text left_guide">전체코트수</span> 
							<select name="cs_court">
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
							</select></td>
						</tr>
						<tr>
							<td><p class="guide_text">대회방식</p>
								<ul class="list_check">
									<li><input type="radio" name="cs_meth" class="check_circle"  id="check_1" value="청백전"><label for="check_1">청백전</label></li>
									<li><input type="radio" name="cs_meth" class="check_circle"  id="check_2" value="개인리그전"><label for="check_2">개인리그전</label></li>
									<li><input type="radio" name="cs_meth" class="check_circle"  id="check_3" value="팀리그전"><label for="check_3">팀리그전</label></li>
								</ul></td>
						</tr>
					</table>
	
					
					<table class="table_form line_no mob1_td">
						<tr>
							<td class="td_ti td_top"><b>소개</b></td>
							<td><textarea class="texbox" name="cs_body" id="cs_body" placeholder="클럽 자체 대회에 대한 간단한 소개"></textarea></td>
						</tr>
					</table>
				</div>
			<!-- content end -->
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