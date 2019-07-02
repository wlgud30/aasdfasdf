<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b"><!-- 
		<li onClick="location.href='/Contest/ContestMyGame.techni'">
			<span>나의 게임</span>
		</li> -->
		<li class="active_tab" onClick="location.href='/Contest/ContestMyGameEvent.techni'">
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
	<ul class="li_col-nol">
		<li><b>게임수</b>${all_game}</li>
		<li><b>완료게임</b>${end_game }</li>
		<li><b>잔여게임</b>${all_game - end_game }</li>
		<li><b>진행율</b>${persent}%</li>
	</ul>
</div>  
<div class="content white_bg mb_ts">
	<table class="game_td cet_lay link_tr td_pd_l0">
	<c:forEach items="${list }" var="list">
		<tr onClick="appendForm('/Contest/ContestMyGameEventDetail.techni','ct_g_idx','${fn:substring(list.ct_g_idx,0,14)}1')">
			<td class="ga_title">${list.ct_k_nm }</td>
			<td class="w10">${list.group_count}팀
			<span class="side_right">${list.group_count*2 }명</span></td>
		</tr>
	</c:forEach>
	</table>
</div>
<script>

</script>