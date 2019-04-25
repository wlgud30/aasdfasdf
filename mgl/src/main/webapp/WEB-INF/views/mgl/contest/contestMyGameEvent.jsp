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
<div class="content white_bg mb_ts">
	<table class="game_td cet_lay link_tr td_pd_l0">
	<%-- <c:forEach items="${list2 }" var="list2"> --%>
		<tr onClick="location.href='/Contest/ContestMyGameEventDetail.techni'">
			<td class="ga_title"><%-- ${list2. } --%>혼복-20,30-초심</td>
			<td class="w10"><%-- ${list2. } --%>4팀
			<span class="side_right"><%-- ${list2. } --%>8명</span></td>
		</tr>
	<%-- </c:forEach> --%>
	</table>
</div>