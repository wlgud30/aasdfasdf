<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li onClick="location.href='/Contest/ContestMyGame.techni'">
			<span>나의 게임</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameEvent.techni'">
			<span>종목</span>
		</li>
		<li class="active_tab" onClick="location.href='/Contest/ContestMyGameTime.techni'">
			<span>시간</span>
		</li>
		<li onClick="location.href='/Contest/ContestMyGameCoat.techni'">
			<span>코트</span>
		</li>
	</ul>
</div>
<div class="pd_lrtb white_bg">
	<%-- <c:forEach items="${list }" var="list"> --%>
	<ul class="li_col-nol">
		<li><b>게임수</b><%-- ${list. } --%>60</li>
		<li><b>완료게임</b><%-- ${list. } --%>21</li>
		<li><b>잔여게임</b><%-- ${list. } --%>449</li>
		<li><b>진행율</b><%-- ${list. } --%>10%</li>
	</ul>
	<%-- </c:forEach> --%>
</div>  
<ul class="accordion_ul">
	<%-- <c:forEach items="${list2 }" var="list2"> --%>
	<li>
		<ul class="accd_head">
			<li><%-- ${list2. } --%>PM 07:00</li>
			<li>
				<span class="guide-left">게임수</span><%-- ${list2. } --%>45
			</li>	
		</ul>
		<div class="accd_a">
			<div class="head-data">
				<div>
					<ul class="li_col-nol impot">
						<li><%-- ${list2. } --%>4코트 230</li>
						<li><%-- ${list2. } --%>혼복-40-자강</li>
						<li><%-- ${list2. } --%>토너먼트</li>
					</ul>
				</div>
				<div>
					<span class="sign-round color3"><%-- ${list2. } --%>완료</span>
				</div>
			</div>
			<!-- head-data end-->
			<table class="line_no td-pt">
				<tr>
					<td class="club_td"><span class="club_name"><%-- ${list2. } --%>TeamB.S.F＆SPROS</span></td>
					<td class="name3-2_td">
						<ul class="name_row">
							<li>
								<span class="name3 name_max"><%-- ${list2. } --%>남길</span>
								<span class="age_rank side_right"><%-- ${list2. } --%>(30-A)</span>
							</li>
							<li>
								<span class="name3 name_max"><%-- ${list2. } --%>남홍</span>
								<span class="age_rank side_right"><%-- ${list2. } --%>(30-자강)</span>
							</li>
						</ul>
					</td>
					<td class="game_score">0</td>
				</tr>
				<tr class="color3">
					<td class="club_td"><span class="club_name"><%-- ${list2. } --%>리더아머마르스</span></td>
					<td class="name3-2_td">
						<ul class="name_row">
							<li>
								<span class="name3 name_max"><%-- ${list2. } --%>남홍길</span>
								<span class="age_rank side_right"><%-- ${list2. } --%>(30-A)</span>
							</li>
							<li>
								<span class="name3 name_max"><%-- ${list2. } --%>김남홍길입니다.</span>
								<span class="age_rank side_right"><%-- ${list2. } --%>(30-자강)</span>
							</li>
						</ul>
					</td>
					<td class="game_score"><%-- ${list2. } --%>30</td>
				</tr>
			</table>
		</div>
		<!-- accd_a end--> 
	</li>
	<%-- </c:forEach> --%>
</ul>