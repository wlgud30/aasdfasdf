<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<!-- InstanceBegin template="/Templates/layout_sub1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<jsp:include page="/WEB-INF/views/mgl/ajax/header.jsp" />
</head>
<body>
	<div id="wrap">
		<header>
			<div class="head_top">
				<!-- InstanceBeginEditable name="head_top" -->
				<div class="tit_top">
					<h1 class="game_title">${list[0].cf_nm }</h1>
				</div>
				<div class="bt_top">
					<span class="icon-score icon-f btn_i i-text" onClick="location.href='/Cfight/CfightReferee.techni'">심판</span>
					<c:if test="${cfm eq '매니저' }">
						<span class="icon-excel icon-f btn_i i-text" onclick="location.href='/Cfight/ExcelTimeDownload.techni'">엑셀</span>
					</c:if>
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
			<!-- InstanceBeginEditable name="container" -->

			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Cfight/CfightDetail.techni'"><span>나의게임</span></li>
					<li onClick="location.href='/Cfight/CfightTypeList.techni'"><span>종목</span></li>
					<li onClick="location.href='/Cfight/CfightTimeList.techni'" class="active_tab"><span>시간</span></li>
					<li onClick="location.href='/Cfight/CfightCourtList.techni'"><span>코트</span></li>
				</ul>
			</div>
			<ul class="accordion_ul">
			<c:forEach items="${list }" var="list">
				<li>
					<ul class="accd_head">
						<li>${fn:substring(list.cf_w_date,0,5)}</li>
					</ul>
					<div class="accd_a">
					<c:forEach items="${list2}" var="list2">
					<c:if test="${list.cf_w_date eq list2.cf_w_date }">
						<div class="head-data">
							<div>
								<ul class="li_col-nol impot">
									<li>${list2.cf_court }코트</li>
									<li>${list2.cf_no}경기</li>
									<li>${list2.cf_t_nm } - ${fn:substring(list2.cf_gidx,15,16)}조</li>
									<li>토너먼트</li>
								</ul>
							</div>
							<div>
								<c:choose>
									<c:when test="${list2.cf_status eq '대기' }">
										<span class="sign-round color2">${list2.cf_status }</span>
									</c:when>
									<c:otherwise>
										<span class="sign-round color3">${list2.cf_status }</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- head-data end-->
						<table class="line_no td-pt">
							<tr>
								<td class="club_td"><span class="club_name">${list2.team_a_nm }</span></td>
								<td class="name3-2_td">
									<ul class="name_row">
										<li>
											<span class="name3 name_max">${list2.a1_id }</span> 
											<span class="age_rank side_right">(${list2.a1_age }-${list2.a1_gd })</span>
										</li>
										<li>
											<span class="name3 name_max">${list2.a2_id }</span>
											<span class="age_rank side_right">(${list2.a2_age }-${list2.a2_gd })</span>
										</li>
									</ul>
								</td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list2.team_a_score ne null }">${list2.team_a_score }</c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="club_td">
									<span class="club_name">${list2.team_b_nm }</span>
								</td>
								<td class="name3-2_td">
									<ul class="name_row">
										<li>
											<span class="name3 name_max">${list2.b1_id }</span>
											<span class="age_rank side_right">(${list2.b1_age }-${list2.b2_gd })</span>
										</li>
										<li>
											<span class="name3 name_max">${list2.b2_id }</span>
											<span class="age_rank side_right">(${list2.b2_age }-${list2.b2_gd })</span>
										</li>
									</ul>
								</td>
								<td class="game_score">
									<c:choose>
										<c:when test="${list2.team_b_score ne null }">${list2.team_b_score }</c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
						</c:if>
						</c:forEach>
					</div>
					<!-- accd_a end-->
				</li>
				</c:forEach>
			</ul>
			<!-- InstanceEndEditable -->
		</div>
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Cfight/CfightSummary.techni'"><span>개요</span></li>
				<li onClick="location.href='/Cfight/CfightEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Cfight/CfightDetail.techni'" class="active_tab"><span>대진표</span></li>
				<li onClick="location.href='/Cfight/CfightMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
</html>