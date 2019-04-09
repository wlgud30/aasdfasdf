<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			<script>
				$(document).ready(function() {
					var aa = $(location).attr('pathname').slice(-8, -7);
					$('.tab_btn_b').navi_depth({
						pageNum : aa
					});
				});
			</script>
			<div class="tab_btn_b_area">
				<ul class="tab_btn_b">
					<li onClick="location.href='/Cfight/CfightDetail.techni'"><span>나의게임</span></li>
					<li onClick="location.href='/Cfight/CfightTypeList.techni'"><span>종목</span></li>
					<li onClick="location.href='/Cfight/CfightTimeList.techni'"><span>시간</span></li>
					<li onClick="location.href='/Cfight/CfightCourtList.techni'" class="active_tab"><span>코트</span></li>
				</ul>
			</div>
			<ul class="accordion_ul">
			<c:forEach items="${list }" var="list">
				<li><ul class="accd_head">
						<li>${list.cf_court } 코트</li>
					</ul>
					<div class="accd_a">
						<c:forEach items="${list2}" var="list2">
							<c:if test="${list.cf_court eq list2.cf_court }">
								<div class="head-data">
									<div>
										<ul class="li_col-nol impot">
											<li>${fn:substring(list2.cf_w_date,0,5)}</li>
											<fmt:parseNumber var="pages" integerOnly="true" value="${list2.cf_no/all_court+(1-(list2.cf_no/all_court%1))%1}"/>
											<li>${pages}경기</li>
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
											<td class="name3-2_td"><ul class="name_row">
													<li><span class="name3 name_max">${list2.a1_id }</span> <span
														class="age_rank side_right">(${list2.a1_age }-${list2.a1_gd })</span></li>
													<li><span class="name3 name_max">${list2.a2_id }</span> <span
														class="age_rank side_right">(${list2.a2_age }-${list2.a2_gd })</span></li>
												</ul></td>
											<td class="game_score">
												<c:choose>
													<c:when test="${list2.team_a_score ne null }">${list2.team_a_score }</c:when>
													<c:otherwise>0</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td class="club_td"><span class="club_name">${list2.team_b_nm }</span></td>
											<td class="name3-2_td"><ul class="name_row">
													<li><span class="name3 name_max">${list2.b1_id }</span> <span
														class="age_rank side_right">(${list2.b1_age }-${list2.b1_gd })</span></li>
													<li><span class="name3 name_max">${list2.b2_id }</span> <span
														class="age_rank side_right">(${list2.b2_age }-${list2.b2_gd })</span></li>
												</ul></td>
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
					</li>
				</c:forEach>
			</ul>
			<!-- InstanceEndEditable -->
		<!-- container end -->
		<div id="ft_area">
			<!-- InstanceBeginEditable name="ft_tag" -->
			<!-- InstanceEndEditable -->
			<script>
				$(document).ready(function() {
					var ft_nv = $(location).attr('pathname').slice(-6, -5);
					$('.ft_menu').navi_depth({
						pageNum : ft_nv
					})
				});
			</script>
			<ul id="ft_nv2" class="ft_menu">
				<li onClick="location.href='/Cfight/CfightSummary.techni'"><span>개요</span></li>
				<li onClick="location.href='/Cfight/CfightEntryType.techni'"><span>선수</span></li>
				<li onClick="location.href='/Cfight/CfightDetail.techni'" class="active_tab"><span>대진표</span></li>
				<li onClick="location.href='/Cfight/CfightMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>