<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="fix_top bg_gray">
	<div id="swiper_nav" class="gray_bg fix-top"> 
	<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
			<c:forEach items="${listG}" var="list">
				<c:choose>
					<c:when test="${fn:substring(list.ct_g_idx,14,15) eq 'w' }">
						<c:if test="${fn:substring(list.ct_g_idx,14,18) eq 'win1'}"><div class="swiper-slide " onClick="frm('${fn:substring(list.ct_g_idx,0,13)}')">본선</div></c:if>
					</c:when>
					<c:otherwise>
						<div class="swiper-slide" onClick="group('${list.ct_g_idx}',this)">
						<c:choose>
							<c:when test="${fn:length(list.ct_g_idx) eq 15 }">${fn:substring(list.ct_g_idx,14,15)}G</c:when>
							<c:when test="${fn:length(list.ct_g_idx) eq 16 }">${fn:substring(list.ct_g_idx,14,16)}G</c:when>
						</c:choose>
						
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
<!-- Add Arrows -->
		<div class="swiper-btn-next"></div>
		<div class="swiper-btn-prev"></div>
	</div>
</div>
<link rel="stylesheet" href="/resources/ct_css/swiper.css">
<script src="/resources/ct_js/swiper.min.js?ver1"></script>
<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView:5,
		spaceBetween: 1,
		navigation: {
			nextEl: '.swiper-btn-next',
			prevEl: '.swiper-btn-prev',
		},
	});
</script> 
</div>
<!-- fix_top end -->
	<div class="content white_bg pt_00">
		<div class="cat_s_area">
			<h4 class="title_ms">랭킹</h4>
		</div>
	<table class="td_small cet_lay">
		<thead class="pd_left0">
			<tr>
				<th>순위</th>
				<th>소속</th>
				<th>선수</th>
				<th>승</th>
				<th>패</th>
				<th>득</th>
				<th>실</th>
				<th>차</th>
			</tr>
		</thead>
		<tbody id="add2">
		<c:forEach items="${list}" var="list">
						<c:set var="i" value="${i+1}" />
						<tr>
							<td class="no_td"><c:choose>
								<c:when test="${list.total_sum eq null || list.total_sum eq ''}">-</c:when>
								<c:otherwise>${i}</c:otherwise>
							</c:choose></td>
							<td class="club_td"><span class="club_name">${list.ct_club_nm }</span></td>
							<td class="na_row_td"><span class="name3">${list.a1_id }</span><span class="name3">${list.b1_id }</span></td>
							<td class="td_1"><fmt:parseNumber var="var3" value="${list.win_count/2}" integerOnly="true" />${var3 }</td>
							<td class="td_1"><fmt:parseNumber var="var3" value="${list.lose_count/2}" integerOnly="true" />${var3 }</td>
							<td class="td_2"><fmt:parseNumber var="var3" value="${list.total_sum/2}" integerOnly="true" />${var3 }</td>
							<td class="td_2"><fmt:parseNumber var="var3" value="${list.total_sum/2-list.gap_sum/2}" integerOnly="true" />${var3 }</td>
							<td class="td_2"><fmt:parseNumber var="var3" value="${list.gap_sum/2}" integerOnly="true" />${var3 }</td>
						</tr>
					</c:forEach>
		</tbody>
	</table>
</div>
<!-- content end-->
<!-- <div class="cat_s_area white_bg">
	<h4 class="title_ms">대진표</h4>
</div>
<div class="match-figure_area white_bg">
	<div class="match-figure figure5">
		<dl class="club-player">
			<dt>
				<span class="club_name">Adidas Power</span>
			</dt>
			<dd>
				<span class="name3">가길동입니다.</span>
			</dd>
			<dd>
				<span class="name3">나길동</span>
			</dd>
		</dl>
		<div class="match_data">
			<ol class="time-court">
				<li class="time_s">08:40</li>
				<li>22-400</li>
			</ol>
			<p class="win_lose lose_mark">패:19</p>
			<p class="win_lose win_mark">승:25</p>
		</div>
	</div>
match-figure end 
</div> -->
<!-- content end-->
<div class="cat_s_area white_bg">
	<h4 class="title_ms">일정</h4>
</div>
<div class="content white_bg pt_00" id="add">
	<c:forEach items="${list2}" var="list2">
				<div class="head-data">
							<div>
								<ul class="li_col-nol impot">
									<fmt:parseNumber var="pages" integerOnly="true" value="${list2.ct_num/all_court+(1-(list2.ct_num/all_court%1))%1}"/>
									<li>${fn:substring(list2.ct_w_dat,0,5) }</li>
									<li>${list2.ct_court }코트</li>
									<li>${pages}경기</li>
									<li><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise> ${fn:substring(list2.ct_gidx,14,15)}그룹</c:otherwise> </c:choose></li>						
									<li>${list2.ct_kind}</li>
								</ul>
							</div>
							<div>
								<c:choose>
									<c:when test="${list2.ct_status eq '대기' }">
										<span class="sign-round color2">${list2.ct_status }</span>
									</c:when>
									<c:otherwise>
										<span class="sign-round color3">${list2.ct_status }</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- head-data end-->
						<table class="line_no td-pt">
							<tr>
								<td class="club_td"><span ><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"> ${fn:substring(list2.team_a_idx,14,15)+1}그룹 1위</c:when><c:otherwise>${list2.team_a_nm }</c:otherwise> </c:choose></span></td>
								<td class="name3-2_td">
									<ul class="name_row">
										<li>
											<span class="name3 name_max">${list2.a1_nm }</span> 
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.a1_age,0,1)}0-${list2.a1_gd })</c:otherwise> </c:choose></span>
										</li>
										<li>
											<span class="name3 name_max">${list2.a2_nm }</span>
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.a2_age,0,1)}0-${list2.a2_gd })</c:otherwise> </c:choose></span>
										</li>
									</ul>
								</td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list2.team_a_score ne null }">${list2.team_a_score }</c:when>
										<c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="club_td">
									<span ><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }">${fn:substring(list2.team_b_idx,14,15)+1}그룹 1위</c:when><c:otherwise>${list2.team_b_nm }</c:otherwise></c:choose> </span>
								</td>
								<td class="name3-2_td">
									<ul class="name_row">
										<li>
											<span class="name3 name_max">${list2.b1_nm }</span>
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.b1_age,0,1)}0-${list2.b2_gd })</c:otherwise> </c:choose></span>
										</li>
										<li>
											<span class="name3 name_max">${list2.b2_nm }</span>
											<span class="age_rank side_right"><c:choose><c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when><c:otherwise>(${fn:substring(list2.b2_age,0,1)}0-${list2.b2_gd })</c:otherwise> </c:choose></span>
										</li>
									</ul>
								</td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list2.team_b_score ne null }">${list2.team_b_score }</c:when>
										<c:when test="${fn:substring(list2.ct_gidx,14,15) eq 'w' }"></c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
	</c:forEach>
</div>
<script>
$(document).ready(function() {
	$("#sub_title").text("종목 : ${list2[0].ct_k_nm}")
	var i = Number("${g_num}")
	$(".swiper-slide").eq(i-1).attr("class","swiper-slide active_hash");
})
function group(idx,me){
	$.ajax({
		async : true,
		type:"post",
		data : idx,
		url : "/Contest/ContestMyGameEventDetail2.techni",
		datatype : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$("#add").empty();
			$("#add").append(data.str);
			$("#add2").empty();
			$("#add2").append(data.str2);
			
			$(".swiper-slide").each(function(){
				$(".swiper-slide").attr("class","swiper-slide");
			})
			$(me).attr("class","swiper-slide active_hash");
		},
		error : function(error){
			swal("민턴in","error : "+error);
		}
	}) 
}
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
</script>