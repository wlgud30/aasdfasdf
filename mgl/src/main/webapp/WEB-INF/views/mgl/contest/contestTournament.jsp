<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="fix_top bg_gray">
	<div id="swiper_nav" class="gray_bg fix-top">
		<!-- Swiper -->
		<div
			class="swiper-container swiper-container-initialized swiper-container-horizontal">
			<div class="swiper-wrapper">
				<c:forEach items="${listG}" var="list">
				<c:choose>
					<c:when test="${fn:substring(list.ct_g_idx,14,15) eq 'w' }">
						<c:if test="${fn:substring(list.ct_g_idx,14,18) eq 'win1'}"><div class="swiper-slide active_hash" onClick="frm('${fn:substring(list.ct_g_idx,0,13)}')">본선</div></c:if>
					</c:when>
					<c:otherwise>
						
						<c:choose>
							<c:when test="${fn:length(list.ct_g_idx) eq 15 }"><div class="swiper-slide" onclick="groupC('${fn:substring(list.ct_g_idx,14,15)}')">${fn:substring(list.ct_g_idx,14,15)}G</div></c:when>
							<c:when test="${fn:length(list.ct_g_idx) eq 16 }"><div class="swiper-slide" onclick="groupC('${fn:substring(list.ct_g_idx,14,16)}')">${fn:substring(list.ct_g_idx,14,16)}G</div></c:when>
						</c:choose>
						
						
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
			<!-- Add Arrows -->
			<div class="swiper-btn-next swiper-button-disabled" tabindex="0"
				role="button" aria-label="Next slide" aria-disabled="true"></div>
			<div class="swiper-btn-prev" tabindex="0" role="button"
				aria-label="Previous slide" aria-disabled="false"></div>
			<span class="swiper-notification" aria-live="assertive"
				aria-atomic="true"></span>
		</div>
	</div>
	<!-- Swiper JS -->

	<script src="/resources/ct_js/swiper.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#sub_title").text("종목 : ${ct_k_nm}")
	})
		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 5,
			spaceBetween : 1,
			hashNavigation : {
				watchState : true,
			},
			navigation : {
				nextEl : '.swiper-btn-next',
				prevEl : '.swiper-btn-prev',
			},
		});
	</script>
</div>
<!-- fix_top end -->
<div class="cat_s_area white_bg" style="margin-top: 31.6667px;">
	<h4 class="title_ms tit_dot">본선</h4>
</div>
<c:choose>
	<c:when test="${fn:length(list1) eq 2}">

<div class="tourna_area white_bg">
	<!-- 2개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b win_st"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>


</div>
</c:when>
<c:when test="${fn:length(list1) eq 3}">
<div class="tourna_area white_bg">
	<!-- 3개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b win_st"><p class="el_date">${list2[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l line_b"></td>
					<td class="club_ne win_st"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 4}">
<div class="tourna_area white_bg">
	<!-- 4개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b win_st"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 5}">
<div class="tourna_area white_bg">
	<!-- 5개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>

					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_21 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 6}">
<div class="tourna_area white_bg">
	<!-- 6개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_1 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2}</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 7}">
<div class="tourna_area white_bg">
	<!-- 7개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_1 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>




					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 8}">
<div class="tourna_area white_bg">
	<!-- 8개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_1 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>




					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[3].nm_1 }</span> <span
						class="name3">${list2[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 9}">
<div class="tourna_area white_bg">
	<!-- 9개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b win_st"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>

					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b win_st"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b win_st"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_1 }</span></td>


					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b win_st"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[2].nm_1 }</span> <span
						class="name3">${list3[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[1].nm_1 }</span> <span
						class="name3">${list4[1].nm_2 }</span></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> <span
						class="name3">${list3[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 10}">
<div class="tourna_area white_bg">
	<!-- 10개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2}</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[2].nm_1 }</span> <span
						class="name3">${list3[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[1].nm_1 }</span> <span
						class="name3">${list4[1].nm_2 }</span></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm}</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[9].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> <span
						class="name3">${list3[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[9].nm_1 }</span> <span
						class="name3">${list1[9].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>

		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 11}">
<div class="tourna_area white_bg">
	<!-- 11개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[2].nm_1 }</span> <span
						class="name3">${list3[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[9].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[1].nm_1 }</span> <span
						class="name3">${list4[1].nm_2 }</span></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[9].nm_1 }</span> <span
						class="name3">${list1[9].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[10].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> <span
						class="name3">${list3[3].nm_2}</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[10].nm_1 }</span> <span
						class="name3">${list1[10].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 12}">
<div class="tourna_area white_bg">
	<!-- 12개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[3].nm_1 }</span> <span
						class="name3">${list2[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_1 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[9].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[2].nm_1 }</span> <span
						class="name3">${list3[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[9].nm_1 }</span> <span
						class="name3">${list1[9].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[10].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[10].nm_1 }</span> <span
						class="name3">${list1[10].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[11].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> <span
						class="name3">${list3[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[11].nm_1 }</span> <span
						class="name3">${list1[11].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 13}">
<div class="tourna_area white_bg">
	<!-- 13개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[3].nm_1 }</span> <span
						class="name3">${list2[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[4].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[9].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[4].nm_1 }</span> <span
						class="name3">${list2[4].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[9].nm_1 }</span> <span
						class="name3">${list1[9].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[10].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[2].nm_1 }</span> <span
						class="name3">${list3[2].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[10].nm_1 }</span> <span
						class="name3">${list1[10].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[11].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[1].nm_1 }</span> <span
						class="name3">${list4[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[11].nm_1 }</span> <span
						class="name3">${list1[11].nm_1 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[12].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>

					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> <span
						class="name3">${list3[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[12].nm_1 }</span> <span
						class="name3">${list1[12].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 14}">
<div class="tourna_area white_bg">
	<!-- 14개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[3].nm_1 }</span> <span
						class="name3">${list2[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[4].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[9].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[4].nm_1 }</span> <span
						class="name3">${list2[4].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[9].nm_1 }</span> <span
						class="name3">${list1[9].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[10].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[10].nm_1 }</span> <span
						class="name3">${list1[10].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[5].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[11].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[5].nm_1 }</span> <span
						class="name3">${list2[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[11].nm_1 }</span> <span
						class="name3">${list1[11].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[12].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[1].nm_1 }</span> <span
						class="name3">${list4[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[12].nm_1 }</span> <span
						class="name3">${list1[12].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[13].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> <span
						class="name3">${list3[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[13].nm_1 }</span> <span
						class="name3">${list1[13].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 15}">
<div class="tourna_area white_bg">
	<!-- 15개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[3].nm_1 }</span> <span
						class="name3">${list2[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[4].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[9].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[4].nm_1 }</span> <span
						class="name3">${list2[4].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[9].nm_1 }</span> <span
						class="name3">${list1[9].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[10].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[10].nm_1 }</span> <span
						class="name3">${list1[10].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[5].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[11].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[5].nm_1 }</span> <span
						class="name3">${list2[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[11].nm_1 }</span> <span
						class="name3">${list1[11].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[12].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[1].nm_1 }</span> <span
						class="name3">${list4[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[12].nm_1 }</span> <span
						class="name3">${list1[12].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>




					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[13].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[6].nm_1 }</span> <span
						class="name3">${list2[6].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[13].nm_1 }</span> <span
						class="name3">${list1[13].nm_1 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[14].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> <span
						class="name3">${list3[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[14].nm_1 }</span> <span
						class="name3">${list1[14].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
<c:when test="${fn:length(list1) eq 16}">
<div class="tourna_area white_bg">
	<!-- 16개 -->
	<div class="tourna_scroll">
		<table class="tourna_td">
			<tbody>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[0].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[0].nm_1 }</span> <span
						class="name3">${list1[0].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[1].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[0].nm_1 }</span> <span
						class="name3">${list2[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[1].nm_1 }</span> <span
						class="name3">${list1[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[0].nm_1 }</span> <span
						class="name3">${list3[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[2].nm_1 }</span> <span
						class="name3">${list1[2].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[3].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[1].nm_1 }</span> <span
						class="name3">${list2[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[3].nm_1 }</span> <span
						class="name3">${list1[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[4].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[0].nm_1 }</span> <span
						class="name3">${list4[0].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[4].nm_1 }</span> <span
						class="name3">${list1[4].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[5].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[2].nm_1 }</span> <span
						class="name3">${list2[2].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[5].nm_1 }</span> <span
						class="name3">${list1[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[6].nm_1 }</span> <span
						class="name3">${list1[6].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[7].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[3].nm_1 }</span> <span
						class="name3">${list2[3].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[7].nm_1 }</span> <span
						class="name3">${list1[7].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list5[0].team_nm }</p></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[8].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list5[0].nm_1 }</span> <span
						class="name3">${list5[0].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[8].nm_1 }</span> <span
						class="name3">${list1[8].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[4].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[9].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[4].nm_1 }</span> <span
						class="name3">${list2[4].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[9].nm_1 }</span> <span
						class="name3">${list1[9].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[2].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[10].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[1].nm_1 }</span> <span
						class="name3">${list3[1].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[10].nm_1 }</span> <span
						class="name3">${list1[10].nm_2 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[5].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne win_st"><p class="el_date">${list1[11].team_nm }</p></td>
					<td class="match_line line_b"></td>



					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[5].nm_1 }</span> <span
						class="name3">${list2[5].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[11].nm_1 }</span> <span
						class="name3">${list1[11].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list4[1].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[12].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list4[1].nm_1 }</span> <span
						class="name3">${list4[1].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[12].nm_1 }</span> <span
						class="name3">${list1[12].nm_2 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[6].team_nm }</p></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>




					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_t"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[13].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[6].nm_1 }</span> <span
						class="name3">${list2[6].nm_1 }</span></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[13].nm_1 }</span> <span
						class="name3">${list1[13].nm_1 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list3[3].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[14].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list3[3].nm_1 }</span> 
					<span class="name3">${list3[3].nm_2 }</span></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[14].nm_1 }</span> 
					<span class="name3">${list1[14].nm_1 }</span></td>
					<td class="match_line line_t"></td>
					<td class="match_line line_l"></td>
					<td class="club_ne mv_b"><p class="el_date">${list2[7].team_nm }</p></td>
					<td></td>
					<td class="match_line line_l"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="match_line line_l line_c"></td>
					<td></td>
					<td class="match_line line_c"></td>
					<td class="match_line line_l half_b"></td>
				</tr>
				<tr>
					<td class="club_ne"><p class="el_date">${list1[15].team_nm }</p></td>
					<td class="match_line line_b"></td>
					<td class="match_line line_l"></td>
					<td class="td_ne mv_t"><span class="name3">${list2[7].nm_1 }</span> <span
						class="name3">${list2[7].nm_2 }</span></td>
					<td></td>
				</tr>
				<tr>
					<td class="td_ne"><span class="name3">${list1[15].nm_1 }</span> <span
						class="name3">${list1[15].nm_2 }</span></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</div>
</c:when>
</c:choose>
<script>
function frm(ct_k_idx) {
	var form = document.createElement("form");
	form.setAttribute("method", "POST");
	form.setAttribute("action", "/Contest/ContestTournament.techni");
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "ct_k_idx");
	hiddenField.setAttribute("value", ct_k_idx);
	form.appendChild(hiddenField);
	document.body.appendChild(form);
	form.submit();
}
function groupC(idx){
	var ct_g_idx = "${ct_g_idx}"+idx
	appendForm('/Contest/ContestMyGameEventDetail.techni','ct_g_idx',ct_g_idx);
}
</script>