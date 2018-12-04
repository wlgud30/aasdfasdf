<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>MGL</title>
<!-- InstanceEndEditable -->
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<script>
	function clubOut(){
		swal({
			title : "MGL",
			text : "클럽을 탈퇴 하시겠습니까?",
			buttons : true
		})
		.then((value) =>{
			if(value){
				$.ajax({
					async : true,
					type : 'post',
					url : "/UClub/UClubOut.techni",
					contentType : "application/json; charset=UTF-8",
					dataType : "json",
					success : function(data){
						if(data.cnt>0){
							swal({
								title : "MGL",
								text : "매니저의 승인 후 탈퇴 됩니다."
							})
							.then((value)=>{
									location.href='/UClub/UClubAllList.techni'
							})
						}else{
							swal("MGL" , "다시 시도해 주세요.")
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
				<div class="btn_back" onClick="location.href='/UClub/UClubUserList.techni'"></div>
				<div class="tit_top">
					<h1>개인정보</h1>
				</div>
				<div class="bt_top">
				<c:if test="${uvo.uc_mng ne '매니저'&& uvo.uc_mng ne '탈퇴대기'}">
					<span class="icon-quit icon-f btn_i i-text" onclick="clubOut()">탈퇴</span>
				</c:if>
					<span class="icon-note btn_i i-text" onclick="location.href='/UClub/UClubMemberUpdate.techni'">수정</span>
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
						<td>
							<i class="icon-f i_font icon-email"></i>
							<c:choose>
								<c:when test="${uvo.u_email == '' }">이메일을 등록해주세요.
								</c:when>
								<c:otherwise>
									${uvo.u_email }
								</c:otherwise>
							</c:choose>
						</td>
						<td class="w10"><i class="icon-f i_font icon-t-size"></i>${uvo.u_tsize }</td>
					</tr>
				</table>
				<hr class="line_div">
				<table class="table_form line_no">
					<tr>
						<td class="td_ti"><b>게임포인트</b></td>
						<td>${uvo.cm_p_total }</td>
						<td class="btn_td"><span class="btn_st btn_wh btn_small"
							onclick="location.href='/Game/PointDetailAll.techni'">내역확인</span></td>
					</tr>
					<!-- <tr>
						<td class="td_ti"><b>대회포인트</b></td>
						<td>13.8P</td>
						<td class="btn_td"><span class="btn_st btn_wh btn_small"
							onclick="location.href='#;'">내역확인</span></td>
					</tr> -->
				</table>
			</div>
			<!-- content end -->
			<div class="content white_bg">
				<div class="bd_cat">
					<h4 class="title_s">월별 게임수</h4>
				</div>
				<ul class="td_6">
					<li onclick="mm(01)"><b>01월</b><a id = "c_01">0회</a><br><b>P</b><a id="t_01">0</a></li>
					<li onclick="mm(02)"><b>02월</b><a id = "c_02">0회</a><br><b>P</b><a id="t_02">0</a></li>
					<li onclick="mm(03)"><b>03월</b><a id = "c_03">0회</a><br><b>P</b><a id="t_03">0</a></li>
					<li onclick="mm(04)"><b>04월</b><a id = "c_04">0회</a><br><b>P</b><a id="t_04">0</a></li>
					<li onclick="mm(05)"><b>05월</b><a id = "c_05">0회</a><br><b>P</b><a id="t_05">0</a></li>
					<li onclick="mm(06)"><b>06월</b><a id = "c_06">0회</a><br><b>P</b><a id="t_06">0</a></li>
					<li onclick="mm(07)"><b>07월</b><a id = "c_07">0회</a><br><b>P</b><a id="t_07">0</a></li>
					<li onclick="mm(08)"><b>08월</b><a id = "c_08">0회</a><br><b>P</b><a id="t_08">0</a></li>
					<li onclick="mm(09)"><b>09월</b><a id = "c_09">0회</a><br><b>P</b><a id="t_09">0</a></li>
					<li onclick="mm(10)"><b>10월</b><a id = "c_10">0회</a><br><b>P</b><a id="t_10">0</a></li>
					<li onclick="mm(11)"><b>11월</b><a id = "c_11">0회</a><br><b>P</b><a id="t_11">0</a></li>
					<li onclick="mm(12)"><b>12월</b><a id = "c_12">0회</a><br><b>P</b><a id="t_12">0</a></li>
				</ul>
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
<script>
var yy = new Date().getFullYear().toString().substr(-2)
	$(document).ready(function(){
		var arr = new Array();
		<c:forEach items="${list}" var = "list">
			arr.push("${list.c_mm}");
			arr.push("${list.c_gameC}")
			arr.push("${list.cm_p_total}")
		</c:forEach>
		var q = arr.length
		q= q/3
		var z = 0;
		for(var i = 0; q >= z;i++){
			var j = (i+1).toString();
			if(j.length==1){
				j="0"+j;
			}
			if(arr[0] == yy+j){
				var a = arr.shift();
				var k = arr.shift();
				var f = arr.shift();
				$("#c_"+j).text(k+"회")
				$("#t_"+j).text(f)
				z++;
			}
			if(z==q){
				break;
			}
		}
		
	})
	function mm(mm){
		mm = mm.toString();
		if(mm.length<2){
			mm="0"+mm.toString();
		}
		if($("#c_"+mm).text()=="0회"){
			
		}else{
			location.href="/Game/PointDetail.techni?ym="+yy+mm;
		}
		
	}
</script>
<!-- InstanceEnd -->
</html>