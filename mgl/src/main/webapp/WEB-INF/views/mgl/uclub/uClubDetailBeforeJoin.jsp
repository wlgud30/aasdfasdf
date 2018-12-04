<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 
	이 파일은 미가입한 클럽 상세보기 화면입니다. (아직 url 매핑 하지 않음)
 -->
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
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="logo_top">
					<img src="/resources/img/logo.svg" alt="MGL" class="logo" onclick="location.href='/UClub/UClubList.techni'">
				</div>
				<div class="tit_top">
					<h1>${data.c_nm}</h1>
				</div>
				<div class="bt_top">
					<span class="btn_st btn_wh" onclick="location.href='/Member/JoinForm.techni'">회원가입</span>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<div class="img_upload_area">
					<div onClick="location.href='#;'" class="img_upload" style="background-image: url(/resources/img/thumbnail_01.jpg)">
						<p>이미지 등록</p>
					</div>
				</div>
				<div class="tit_main cet_lay">
					<ul class="li_col-nol">
						<li class="clubking">김질동</li>
						<li class="people_nb">85명</li>
						<li class="phone_i">000-0000-0000</li>
					</ul>
				</div>
				<hr class="line_div">
				<table class="table_form line_no mob1_td">
					<tr>
						<td class="td_ti td_top"><b>소개</b></td>
						<td>클럽(모임)에 대한 소개를 기재하세요<br>클럽(모임)에 대한 소개를 기재하세요 클럽(모임)에
							대한 소개를 기재하세요
						</td>
					</tr>
				</table>
			</div>
			<!-- content end -->
			<div class="content white_bg">
				<div>
					<table class="table_form">
						<tbody>
							<tr>
								<td>계남다목적체육관</td>
							</tr>
						</tbody>
					</table>
					<div class="map_st">
						<div id="map_area" class="map_style">
							<div id="nv_map"></div>
						</div>
						<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cEFD_UUAu3ZKWFaXt8Cf"></script>
						<script src="/resources/js/nv_map.js"></script>
					</div>
				</div>
			</div>
			<!-- content end -->
			<div class="btn_full pd_lrb">
				<span class="btn_st" onClick="location.href='#'">클럽가입</span>
			</div>
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
				<li onClick="location.href='/Game/GameStateInfo.techni'"><span>게임</span></li>
				<li onClick="location.href='/UClub/UClubMemberInfoList.techni'"><span>랭킹</span></li>
				<li onClick="location.href='/UClub/UClubDetail.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>