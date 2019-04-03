<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
	DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd ");
	Calendar cal = Calendar.getInstance();
	String Today = dateFormat.format(cal.getTime());
%>

<script type="text/javascript">
function ref(){
	if(parent.document.referrer.includes("/Game/PointDetailAll.techni")){
		history.back();
	}else if(parent.document.referrer.includes("/Game/PointDetail.techni")){
		history.back();
	}else{
		location.href="/Game/EndGame.techni"
	}
}

</script>
		<div class="content white_bg">
				<div class="bd_cat col_2-1">
					<div>
						<h4 class="title_m">${list[0].cm_order}코트</h4>
					</div>
					<div>
						<ul class="li_small">
							<li><b>날짜</b>${list[0].cm_match_date }</li>
							<li><b>시작</b>${list[0].cm_start}</li>
							<li><b>종료</b>${list[0].cm_end}</li>
						</ul>
					</div>
				</div>
				<table class="col_score">
					<tr>
						<td rowspan="2" class="team_td">A 팀</td>
						<td class="player_td">
						 <div class="photo_name">
						  <div class="thum_area"><div class="thum" style="background-image:url(${list[0].u_photo});"></div></div>
						  <div class="text_area"><span class="name3">${list[0].u_nm }</span>
						                                 <span class="age_rank"><c:choose><c:when test="${list[0].u_club_gd ne null}">(${list[0].u_club_gd }-${list[0].u_age })</c:when><c:otherwise></c:otherwise></c:choose></span></div>
						 </div>
						</td>
						<td class="victory_td">${list[0].cm_total }(${list[0].cm_win }) ${list[0].cm_sc_gap }</td>
						<td class="point_td">+${list[0].cm_aptn }</td>
					</tr>
					<tr>
						<td class="player_td">
						 <div class="photo_name">
						  <div class="thum_area"><div class="thum" style="background-image:url(${list[1].u_photo});"></div></div>
						  <div class="text_area"><span class="name3">${list[1].u_nm }</span>
						                                 <span class="age_rank"><c:choose><c:when test="${list[1].u_club_gd ne null}">(${list[1].u_club_gd }-${list[1].u_age })</c:when><c:otherwise></c:otherwise></c:choose></span></div>
						 </div>
						</td>
						<td class="victory_td">${list[1].cm_total }(${list[1].cm_win }) ${list[1].cm_sc_gap }</td>
						<td class="point_td">+${list[1].cm_aptn }</td>
					</tr>
					<tr>
						<td rowspan="2" class="team_td">B 팀</td>
						<td class="player_td">
						 <div class="photo_name">
						  <div class="thum_area"><div class="thum" style="background-image:url(${list[2].u_photo});"></div></div>
						  <div class="text_area"><span class="name3">${list[2].u_nm }</span>
						                                 <span class="age_rank"><c:choose><c:when test="${list[2].u_club_gd ne null}">(${list[2].u_club_gd }-${list[3].u_age })</c:when><c:otherwise></c:otherwise></c:choose></span></div>
						 </div>
						</td>
						<td class="victory_td">${list[2].cm_total }(${list[2].cm_win }) ${list[2].cm_sc_gap }</td>
						<td class="point_td">+${list[2].cm_aptn }</td>
					</tr>
					<tr>
						<td class="player_td">
						 <div class="photo_name">
						  <div class="thum_area"><div class="thum" style="background-image:url(${list[3].u_photo});"></div></div>
						  <div class="text_area"><span class="name3">${list[3].u_nm }</span>
						                                 <span class="age_rank"><c:choose><c:when test="${list[3].u_club_gd ne null}">(${list[3].u_club_gd }-${list[3].u_age })</c:when><c:otherwise></c:otherwise></c:choose></span></div>
						</div>
						</td>
						<td class="victory_td">${list[3].cm_total }(${list[3].cm_win }) ${list[3].cm_sc_gap }</td>
						<td class="point_td">+${list[3].cm_aptn }</td>
					</tr>
				</table>
				<div class="btn_full">
					<span class="btn_st" onclick="ref()">확인</span>
				</div>
			</div>