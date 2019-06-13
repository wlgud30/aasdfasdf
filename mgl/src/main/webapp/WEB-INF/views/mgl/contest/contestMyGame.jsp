<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li class="active_tab" onClick="location.href='/Contest/ContestMyGame.techni'">
			<span>나의 게임</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameEvent.techni'">
			<span>종목</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameTime.techni'">
			<span>시간</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameCoat.techni'">
			<span>코트</span>
		</li>
	</ul>
</div>
<c:if test="${fn:length(listA) > 0}">
<div class="content white_bg match_cont">
	<ul class="divide_li">
		<li>
			<h4 class="title_m">예선(리그전)</h4>
		</li>
		<li>
			<h4 class="title_m">${listA[0].ct_k_nm }</h4>
		</li>
	</ul>
	<!--divide_li end-->
	<c:forEach items="${listA}" var="list">
	<div class="line2_dark">
		<div class="head-data">
			<div>
				<ul class="li_dot li_inline impot">
					<li>${fn:substring(list.ct_w_dat,0,5)}</li>
					<li>${fn:substring(list.ct_gidx,15,16)}조</li>
					<li>${list.ct_court }코트 <fmt:parseNumber var="pages" integerOnly="true" value="${list.ct_no/all_court+(1-(list.ct_no/all_court%1))%1}"/>
									${pages }</li>
				</ul>
			</div>
			<div>
				<c:choose>
					<c:when test="${list.ct_status eq '대기' }">
						<span class="sign-round color2">${list.ct_status }</span>
					</c:when>
					<c:otherwise>
						<span class="sign-round color3">${list.ct_status }</span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
<!-- head-data end-->
		<table class="line_no td-pt">
			<tr>
				<td class="club_td"><span class="club_name">${list.team_a_nm }</span></td>
				<td class="name3-2_td">
					<ul class="name_row">
						<li>
							<span class="name3 name_max">${list.a1_id }</span>
							<span class="age_rank side_right">(${list.a1_age }-${list.a1_gd })</span>
						</li>
						<li>
							<span class="name3 name_max">${list.a2_id }</span>
							<span class="age_rank side_right">(${list.a2_age }-${list.a2_gd })</span>
						</li>
					</ul>
				</td>
				<td class="game_score">
					<c:choose>
						<c:when test="${list.team_a_score ne null }">${list.team_a_score }</c:when>
						<c:otherwise>0</c:otherwise>
					</c:choose></td>
			</tr>
			<tr class="color3">
				<td class="club_td"><span class="club_name">${list.team_b_nm }리더아머마르스</span></td>
				<td class="name3-2_td">
					<ul class="name_row">
						<li>
							<span class="name3 name_max">${list.b1_id }</span>
							<span class="age_rank side_right">(${list.b1_age }-${list.b1_gd })</span>
						</li>
						<li>
							<span class="name3 name_max">${list.b2_id }</span>
							<span class="age_rank side_right">(${list.b2_age }-${list.b2_gd })</span>
						</li>
					</ul>
				</td>
				<td class="game_score">
					<c:choose>
						<c:when test="${list.team_b_score ne null }">${list.team_b_score }</c:when>
						<c:otherwise>0</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</div>
	</c:forEach>
	<!-- line_dark end--> 
</div>
</c:if>
<!-- match_cont end-->
<!-- <div class="content white_bg match_cont">
	<ul class="divide_li">
		<li>
			<h4 class="title_m">예선(리그전)</h4>
		</li>
		<li>
			<h4 class="title_m">혼복-40-A</h4>
		</li>
	</ul>
  	divide_li end
	<div class="line2_dark">
		<div class="head-data">
			<div>
				<ul class="li_dot li_inline impot">
					<li>13:00</li>
					<li>2조</li>
					<li>4코트 23</li>
				</ul>
			</div>
			<div>
				<span class="sign-round color3">완료</span>
			</div>
		</div>
  		head-data end
		<table class="line_no td-pt">
			<tr>	
				<td class="club_td"><span class="club_name">TeamB.S.F＆SPROS</span></td>
				<td class="name3-2_td">
					<ul class="name_row">
						<li>
							<span class="name3 name_max">남길</span>
							<span class="age_rank side_right">(30-A)</span>
						</li>
						<li>
							<span class="name3 name_max">남홍</span>
							<span class="age_rank side_right">(30-자강)</span>
						</li>
					</ul></td>
				<td class="game_score">0</td>
			</tr>
			<tr class="color3">
				<td class="club_td"><span class="club_name">리더아머마르스</span></td>
				<td class="name3-2_td">
					<ul class="name_row">
						<li>
							<span class="name3 name_max">남홍길</span>
							<span class="age_rank side_right">(30-A)</span>
						</li>
						<li>
							<span class="name3 name_max">김남홍길입니다.</span>
							<span class="age_rank side_right">(30-자강)</span>
						</li>
					</ul></td>
				<td class="game_score">30</td>
			</tr>
		</table>
	</div>
line_dark end 
</div> -->