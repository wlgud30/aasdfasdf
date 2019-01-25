<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Game/selfMatchDetail.techni'"><span>나의게임</span></li>
					<li onClick="location.href='/Game/selfMatchTypeList.techni'"><span>종목</span></li>
					<li onClick="location.href='/Game/selfMatchTimeList.techni'" class="active_tab"><span>시간</span></li>
					<li onClick="location.href='/Game/selfMatchCourtList.techni'"><span>코트</span></li>
				</ul>
			</div>
			<ul class="accordion_ul">
			<c:forEach items="${list }" var="list">
				<li>
					<ul class="accd_head">
						<li>${fn:substring(list.cs_w_date,0,5)}</li>
					</ul>
					<div class="accd_a">
					<c:forEach items="${list2}" var="list2">
					<c:if test="${list.cs_w_date eq list2.cs_w_date }">
						<div class="head-data">
							<div>
								<ul class="li_col-nol impot">
									<li>${list2.cs_court }코트</li>
									<li>${list2.cs_no}경기</li>
									<li>${list2.cs_k_nm }</li>
									<li>토너먼트</li>
								</ul>
							</div>
							<div>
								<c:choose>
									<c:when test="${list2.cs_status eq '대기' }">
										<span class="sign-round color2">${list2.cs_status }</span>
									</c:when>
									<c:otherwise>
										<span class="sign-round color3">${list2.cs_status }</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- head-data end-->
						<table class="line_no td-pt">
							<tr>
								<td class="club_td"><span class="club_name"></span></td>
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
									<span class="club_name"></span>
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
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Cfight/CfightSummary.techni'"><span>개요</span></li>
				<li onClick="location.href='/Game/selfMatchEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Game/selfMatchDetail.techni'" class="active_tab"><span>대진표</span></li>
				<li onClick="location.href='/Game/selfMatchMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>
	<!-- wrap end -->