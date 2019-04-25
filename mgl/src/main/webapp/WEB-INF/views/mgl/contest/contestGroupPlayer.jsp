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
		<li onClick="location.href='/Contest/ContestEventPlayer.techni'">
			<span>종목별</span>
		</li>
		<li onClick="location.href='/Contest/ContestGroupPlayer.techni'">
			<span>단체별</span>
		</li>
	</ul>
</div>
<ul class="accordion_ul">
	<%-- <c:forEach items="${list }" var="list"> --%>
	<li>
		<ul class="accd_head">
			<li>
				<span class="club_name-long"><%-- ${list. } --%>날개잃은천사</span>
			</li>
			<li><%-- ${list. } --%>4팀
				<span class="side_right"><%-- ${list. } --%>8명</span>
			</li>
		</ul>
		<div class="accd_a">
			<table class="text_td">
				<tr>
					<td class="no_td"><%-- ${list. } --%>1</td>
					<td class="ga_title"><%-- ${list. } --%>혼복-43-왕초</td>
					<td class="n3_rank"><span class="name3"><%-- ${list. } --%>가길</span>
					<span class="age_rank"><%-- ${list. } --%>(20-자강)</span></td>
					<td class="n3_rank"><span class="name3"><%-- ${list. } --%>길동</span>
					<span class="age_rank"><%-- ${list. } --%>(20-자강)</span></td>
				</tr>
			</table>
		</div>
	</li>
	<%-- </c:forEach> --%>
</ul>