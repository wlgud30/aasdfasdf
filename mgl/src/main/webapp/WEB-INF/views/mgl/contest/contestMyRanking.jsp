<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script>	
	$(document).ready(function(){	
		var aa = $(location).attr('pathname').slice(-6, -5); 
		$('.tab_btn_b').navi_depth({pageNum:aa});		
	});
</script>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li onClick="location.href='/Contest/ContestMyRanking.techni'">
			<span>나의 순위</span>
		</li>
		<li onClick="location.href='/Contest/ContestEventRanking.techni'">
			<span>종목별 순위</span>
		</li>
		<li onClick="location.href='/Contest/ContestClubRanking.techni'">
			<span>클럽 순위</span>
		</li>
	</ul>
</div>
<%-- <c:forEach items="${list }" var="list"> --%>
<div class="content white_bg pd_b0">
	<div class="title_bar">
		<h4 class="title_ms"><%-- ${list. } --%>혼복-40-A</h4>
	</div>
	<table class="text_td">
		<tr class="top_bg">
			<td class="no_td"><%-- ${list. } --%>10</td>
			<td class="club_td"><span class="club_name"><%-- ${list. } --%>리더아머마르스</span></td>
			<td class="n3_rank"><span class="name3"><%-- ${list. } --%>가길동</span>
			<span class="age_rank"><%-- ${list. } --%>(20-자강)</span></td>
			<td class="n3_rank"><span class="name3"><%-- ${list. } --%>남동</span>
			<span class="age_rank"><%-- ${list. } --%>(20-자강)</span></td>
			<td class="point_td"><%-- ${list. } --%>7.96</td>
		</tr>
		<tr>
			<td class="no_td">1</td>
			<td class="club_td"><span class="club_name">아이사랑클럽</span></td>
			<td class="n3_rank"><span class="name3">가길동</span>
			<span class="age_rank">(20-자강)</span></td>
			<td class="n3_rank"><span class="name3">남동</span>
			<span class="age_rank">(20-자강)</span></td>
			<td class="point_td">7.96</td>
		</tr>
	</table>
</div>
<%-- </c:forEach> --%>