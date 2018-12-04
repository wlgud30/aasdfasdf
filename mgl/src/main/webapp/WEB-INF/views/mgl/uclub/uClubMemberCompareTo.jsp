<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	var today = new Date();
	var mm = "${m}";
	var yyyy = today.getFullYear();
	
	$("#ym").text(yyyy+"년"+mm+"월")
});	

</script>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="btn_back" onClick="history.back();"></div>
				<div class="tit_top">
					<h1>${uvo.c_nm }</h1>
				</div>
				<div class="bt_top">
					
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->
			<div class="content white_bg">
				<c:choose>
					<c:when test="${uvo.my_ap ne null }">
				
				<table class="mix_img_col3 head_td_img">
					<tr>
						<td class="img_td"><b>${my_rank}/${total }</b>
							<div class="photo_area"
								style="background-image: url(/resources/img/thumbnail_01.jpg)"></div>
							<h4>${uvo.my_nm} ${uvo.my_age }/${uvo.my_gd }</h4>
							<div class="divide_text">
								<span>${uvo.my_cm_p_total } P</span><span>${uvo.my_cm_p_total_m }P</span>
							</div></td>
						<td class="td_th">VS</td>
						<td class="img_td"><b>${you_rank}/${total }</b>
							<div class="photo_area"
								style="background-image: url(/resources/img/thumbnail_01.jpg)"></div>
							<h4>${uvo.you_nm} ${uvo.you_age }/${uvo.you_gd }</h4>
							<div class="divide_text">
								<span>${uvo.you_cm_p_total } P</span><span>${uvo.you_cm_p_total_m }P</span>
							</div></td>
					</tr>
				</table>
				<table class="game_td mix_img_col3 bt_line_td">
					<tr>
						<td colspan="3" class="score_head"><span id = "ym"></span>
						<h3>${uvo.my_win } 승 ${uvo.my_lose } 패</h3></td>
					</tr>
					<tr>
						<td>${uvo.my_gr }</td>
						<td class="td_th">손실공력</td>
						<td>${uvo.you_gr }</td>
					</tr>
					<tr>
						<td>${uvo.my_gap }</td>
						<td class="td_th">점수차</td>
						<td>${uvo.you_gap }</td>
					</tr>
					<tr>
						<td>${uvo.my_pp }</td>
						<td class="td_th">점수포인트</td>
						<td>${uvo.you_pp }</td>
					</tr>
					<tr>
						<td>${uvo.my_ap }</td>
						<td class="td_th">획득포인트</td>
						<td>${uvo.you_ap }</td>
					</tr>
				</table>
				</c:when>
					<c:otherwise>
							<h3 class="guide_big space_guide">
	 							<span class="icon-outline_4"></span>서로 게임한적이 없습니다.
	 						</h3>
					</c:otherwise>
				</c:choose>
			</div>
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
				<li onClick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
			</ul>

		</div>
	</div>
	<!-- wrap end -->
</body>
<!-- InstanceEnd -->
</html>