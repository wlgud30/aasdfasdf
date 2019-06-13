<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div class="tab_btn_b_area">
	<ul class="tab_btn_b">
		<li onClick="location.href='/Contest/ContestEventPlayer.techni'">
			<span>종목별</span>
		</li>
		<li class="active_tab" onClick="location.href='/Contest/ContestGroupPlayer.techni'">
			<span>단체별</span>
		</li>
	</ul>
</div>
<ul class="accordion_ul">
	<c:forEach items="${ct_club_nm2}" var="list">
		<c:set var="i" value="0" />
		<li>
			<ul class="accd_head">
				<li>
					<span class="club_name-long">${list.ct_club_nm}</span>
				</li>
				<li><fmt:parseNumber var="percent" value="${list.group_count/2}" integerOnly="true" />${percent}팀
					<span class="side_right">${list.group_count}명</span>
				</li>
			</ul>
			<div class="accd_a">
				<table class="text_td">
					<c:forEach items="${ct_k_idx2}" var="list1">
						<c:if test="${list.ct_club_nm eq list1.ct_club_nm}">
							<c:set var="i" value="${i+1}" />
							<tr>
								<td class="no_td">${i }</td>
								<td class="ga_title">${list1.ct_k_nm}</td>
								<td class="n3_rank"><span class="name3">${list1.ct_u_nm1}</span>
								<span class="age_rank">(${fn:substring(list1.ct_k_nm, 0, 2)}-${list1.ct_u_gd1})</span></td>
								<td class="n3_rank"><span class="name3">${list1.ct_u_nm2}</span>
								<span class="age_rank">(${fn:substring(list1.ct_k_nm, 0, 2)}-${list1.ct_u_gd2})</span></td>
							</tr>
							</c:if>
					</c:forEach>
				</table>
			</div>
		</li>
	</c:forEach>
</ul>