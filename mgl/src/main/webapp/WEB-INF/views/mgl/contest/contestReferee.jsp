<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="pd_lrb">
	<table class="table_form">
		<tr>
			<td><b class="item_divide">코트선택</b>
				<select onchange="if(this.value) location.href=(this.value);">
					<option value="https://m.naver.com/">2</option>
					<option value="https://www.nate.com/">3</option>            
				</select></td>
			<td class="td_2"><b class="item_divide">심판명</b></td>
			<td class="w20"><input type="text"></td>
		</tr>
	</table>
</div>
<%-- <c:forEach items="${list }" var="list"> --%>
<div class="content white_bg pd_0 cet_lay">
	<div class="line_dark pd_0">
		<ul class="li_col-nol impot_bg">
			<li><%-- ${list. } --%>07:00</li>
			<li><%-- ${list. } --%>1코트 230</li>
			<li><%-- ${list. } --%>혼복-40,30-왕초</li>
			<li><%-- ${list. } --%>토너먼트</li>
		</ul>
		<table class="line_no td-pt score-result3">
			<tr>
				<td class="club_name32"><span class="club_name"><%-- ${list. } --%>리더아머마르스</span>
					<ul class="name_col">
						<li>
							<span class="name3"><%-- ${list. } --%>남홍길</span>
							<span class="age_rank"><%-- ${list. } --%>(40-왕초)</span>
						</li>
						<li>
							<span class="name3"><%-- ${list. } --%>김남홍길입니다.</span>
							<span class="age_rank"><%-- ${list. } --%>(40-A)</span>
						</li>
					</ul>
					<div class="score_input_area">
						<input type="text" placeholder="18" class="box_input cet_lay">
					</div></td>
				<td class="score2_td"><span class="sign-round color3"><%-- ${list. } --%>진행</span></td>
				<td class="club_name32"><span class="club_name"><%-- ${list. } --%>TeamB.S.F＆SPROS</span>
					<ul class="name_col">
						<li>
							<span class="name3"><%-- ${list. } --%>남홍길</span>
							<span class="age_rank"><%-- ${list. } --%>(40-자강)</span>
						</li>
						<li>
							<span class="name3"><%-- ${list. } --%>김남</span>
							<span class="age_rank"><%-- ${list. } --%>(40-왕초)</span>
						</li>
					</ul>
					<div class="score_input_area">
						<input type="text" placeholder="24" class="box_input cet_lay">
					</div></td>
			</tr>
		</table>
		<div class="btn_full pd_lrb">
			<span class="btn_st" onclick="location.href='09-02_score-check.html'">점수 등록</span>
		</div>
	</div>
<!-- line_dark end-->
	<ul class="li_col-nol impot_bg">
		<li><%-- ${list. } --%>07:00</li>
		<li><%-- ${list. } --%>1코트 230</li>
		<li><%-- ${list. } --%>혼복-40,30-왕초</li>
		<li><%-- ${list. } --%>토너먼트</li>
	</ul>
	<table class="line_no td-pt score-result3">
		<tr>
			<td class="club_name32"><span class="club_name"><%-- ${list. } --%>리더아머마르스</span>
				<ul class="name_col">
					<li>
						<span class="name3"><%-- ${list. } --%>남홍i길</span>
						<span class="age_rank"><%-- ${list. } --%>(30-왕초)</span>
					</li>
					<li>
						<span class="name3"><%-- ${list. } --%>김남A홍길입니다.</span>
						<span class="age_rank"><%-- ${list. } --%>(30-C)</span>
					</li>
				</ul>
			</td>
			<td class="score2_td"><span class="sign-round color2"><%-- ${list. } --%>예정</span></td>
			<td class="club_name32"><span class="club_name"><%-- ${list. } --%>TeamB.S.F＆SPROS</span>
				<ul class="name_col">
					<li>
						<span class="name3"><%-- ${list. } --%>남홍길</span>
						<span class="age_rank"><%-- ${list. } --%>(40-왕초)</span>
					</li>
					<li>
						<span class="name3"><%-- ${list. } --%>김남</span>
						<span class="age_rank"><%-- ${list. } --%>(30-A)</span>
					</li>
				</ul>
			</td>
		</tr>
	</table>
</div>
<%-- </c:forEach> --%>
<!-- content end--> 