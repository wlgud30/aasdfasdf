<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<script>	
	$(document).ready(function(){	
		var aa = $(location).attr('pathname').slice(-8, -7); 
		$('.tab_btn_b').navi_depth({pageNum:aa});		
	});
</script>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li onClick="location.href='/Contest/ContestMyGame.techni'">
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
<div class="content white_bg match_cont">
	<ul class="divide_li">
		<li>
			<h4 class="title_m">예선(리그전)</h4>
		</li>
		<li>
			<h4 class="title_m">혼복-40-A</h4>
		</li>
	</ul>
	<!--divide_li end-->
	<%-- <c:forEach items="${list }" var="list"> --%>
	<div class="line2_dark">
		<div class="head-data">
			<div>
				<ul class="li_dot li_inline impot">
					<li><%-- ${list. } --%>13:00</li>
					<li><%-- ${list. } --%>2조</li>
					<li><%-- ${list. } --%>4코트 23</li>
				</ul>
			</div>
			<div>
				<span class="sign-round color3"><%-- ${list. } --%>완료</span>
			</div>
		</div>
<!-- head-data end-->
		<table class="line_no td-pt">
			<tr>
				<td class="club_td"><span class="club_name"><%-- ${list. } --%>TeamB.S.F＆SPROS</span></td>
				<td class="name3-2_td">
					<ul class="name_row">
						<li>
							<span class="name3 name_max"><%-- ${list. } --%>남길</span>
							<span class="age_rank side_right"><%-- ${list. } --%>(30-A)</span>
						</li>
						<li>
							<span class="name3 name_max"><%-- ${list. } --%>남홍</span>
							<span class="age_rank side_right"><%-- ${list. } --%>(30-자강)</span>
						</li>
					</ul>
				</td>
				<td class="game_score">0</td>
			</tr>
			<tr class="color3">
				<td class="club_td"><span class="club_name"><%-- ${list. } --%>리더아머마르스</span></td>
				<td class="name3-2_td">
					<ul class="name_row">
						<li>
							<span class="name3 name_max"><%-- ${list. } --%>남홍길</span>
							<span class="age_rank side_right"><%-- ${list. } --%>(30-A)</span>
						</li>
						<li>
							<span class="name3 name_max"><%-- ${list. } --%>김남홍길입니다.</span>
							<span class="age_rank side_right"><%-- ${list. } --%>(30-자강)</span>
						</li>
					</ul>
				</td>
				<td class="game_score"><%-- ${list. } --%>30</td>
			</tr>
		</table>
	</div>
	<%-- </c:forEach> --%>
	<!-- line_dark end--> 
</div>
<!-- match_cont end-->
<div class="content white_bg match_cont">
	<ul class="divide_li">
		<li>
			<h4 class="title_m">예선(리그전)</h4>
		</li>
		<li>
			<h4 class="title_m">혼복-40-A</h4>
		</li>
	</ul>
  	<!--divide_li end-->
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
  		<!-- head-data end-->
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
<!-- line_dark end--> 
</div>