<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(document).ready(
			function() {
				("#bt_top")
				var today = new Date();
				var mm = "${m}";
				var yyyy = today.getFullYear();
				$("#bt_top").append(
						"<span class='title_g dark_font'>" + yyyy + "년" + mm
								+ "월</span>");
			});
</script>

<!-- InstanceBeginEditable name="container" -->

<c:choose>
	<c:when test="${uvo.my_ap ne null }">
		<div class="content white_bg">
			<%-- <table class="mix_img_col3 head_td_img">
				<tr>
					<td class="img_td"><b>${my_rank}/${total }</b>
						<div class="photo_area"
							style="background-image: url(/resources/img/thumbnail_01.jpg)"></div>
						<h4>${uvo.my_nm}${uvo.my_age }/${uvo.my_gd }</h4>
						<div class="divide_text">
							<span>${uvo.my_cm_p_total } P</span><span>${uvo.my_cm_p_total_m }P</span>
						</div></td>
					<td class="td_th">VS</td>
					<td class="img_td"><b>${you_rank}/${total }</b>
						<div class="photo_area"
							style="background-image: url(/resources/img/thumbnail_01.jpg)"></div>
						<h4>${uvo.you_nm}${uvo.you_age }/${uvo.you_gd }</h4>
						<div class="divide_text">
							<span>${uvo.you_cm_p_total } P</span><span>${uvo.you_cm_p_total_m }P</span>
						</div></td>
				</tr>
			</table>
			<table class="game_td mix_img_col3 bt_line_td">
				<tr>
					<td colspan="3" class="score_head"><span id="ym"></span>
						<h3>${uvo.my_win }승 ${uvo.my_lose } 패</h3></td>
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
			</table> --%>
			<table class="game_td mix_img_col3 bt_line_td thead_td">
				<tr>
					<td><div class="photo_area"
							style="background-image: url(${uvo.my_photo})"></div>
						<h4>
							<span class="name3">${uvo.my_nm}</span>
						</h4>
						<p class="age_rank">(${fn:substring(uvo.my_age,0,1)}0-${uvo.my_gd})</p></td>
					<td class="td_th"><h3>
							<span class="item_divide">승</span> ${uvo.my_win}
						</h3>
						<h3>
							<span class="item_divide">패</span> ${uvo.my_lose }
						</h3></td>
					<td><div class="photo_area"
							style="background-image: url(${uvo.you_photo})"></div>
						<h4>
							<span class="name3">${uvo.you_nm}</span>
						</h4>
						<p class="age_rank">(${fn:substring(uvo.you_age,0,1)}0-${uvo.you_gd})</p></td>
				</tr>
				<tr>
					<td>${uvo.my_cm_p_total }</td>
					<td class="td_th">전체포인트</td>
					<td>${uvo.you_cm_p_total }</td>
				</tr>
				<tr>
					<td>${uvo.my_pp }</td>
					<td class="td_th">월 점수포인트</td>
					<td>${uvo.you_pp }</td>
				</tr>
				<tr>
					<td>${uvo.my_cm_p_total_m }</td>
					<td class="td_th">월 획득포인트</td>
					<td>${uvo.you_cm_p_total_m }</td>
				</tr>
			</table>
		</div>
		<div class="content white_bg pt_00">
			<table class="mix3_td">
				<tbody>
					<c:forEach items="${list2 }" var="listc" varStatus="status">
					<c:set var="i" value="${i+1}" />
					<tr>
						<td class="cot2">${i} 게임<span class="game_no"></span></td>
						<td class="ga_title" <c:if test="${list[status.index].cm_total ne 0 }"></c:if>>
						<ul class="col_21">
						<c:forEach items="${listc }" var="listv" varStatus="status2">
							<c:if test="${status2.index eq 0 }"><li></c:if>
							<c:if test="${status2.index eq 2 }"></li><li></c:if>
									<div class="photo_name">
										<div class="thum_area">
											<div class="thum" style="background-image: url(${listv.u_photo});"></div>
										</div>
										<div class="text_area">
											<span class="name3">${listv.u_nm }</span>
										</div>
									</div>
									<c:if test="${status2.index eq 3 || status2.index eq 1 }">
									<c:if test="${listv.cm_total != 0 }">
									<div class="divide_text bold_text">
											<span>${listv.cm_total }</span><span>${listv.cm_win }</span>
									</div>
									</c:if>
									</c:if>
								<c:if test="${status2.index eq 3 }"></li></c:if>
						</c:forEach>
						</ul>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:when>
	<c:otherwise>
		<div class="content white_bg">
			<h3 class="guide_big space_guide">
				<span class="icon-outline_4"></span>서로 게임한적이 없습니다.
			</h3>
		</div>
	</c:otherwise>
</c:choose>

<!-- content end -->
<!-- InstanceEndEditable -->
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
		<li class='active_tab'
			onClick="location.href='/UClub/UClubUserList.techni'"><span>랭킹</span></li>
		<li onClick="location.href='/Club/ClubDetailMy.techni'"><span>클럽</span></li>
	</ul>

</div>