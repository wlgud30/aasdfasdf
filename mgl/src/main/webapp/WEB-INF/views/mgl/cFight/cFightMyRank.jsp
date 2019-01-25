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
					<li onClick="location.href='/Cfight/CfightMyRank.techni'" class="active_tab"><span>나의 순위</span></li>
					<li onClick="location.href='/Cfight/CfightTypeRank.techni'"><span>종목별 순위</span></li>
					<li onClick="location.href='/Cfight/CfightClubRank.techni'"><span>클럽별 순위</span></li>
				</ul>
			</div>
			<c:forEach items="${list2}" var="list2">
				<c:set var="i" value="0" />
				<c:set var="i" value="${i+1}" />
				<div class="content white_bg pt_00">
				<div class="cet_lay title_bar">
					<h4 class="title_m">${list2.cf_t_nm }</h4>
				</div>
				<table class="text_td">
					<c:forEach items="${list }" var="list">
						<c:if test="${list.cf_t_nm eq list2.cf_t_nm }">
							<c:if test="${list.cf_team_a_id eq u_id || list.cf_team_b_id eq u_id }">
								<tr class="top_bg">
									<td class="no_td" id="${list.cf_t_idx}_${u_id}"></td>
									<td class="club_td"><span class="club_name">${list.c_nm }</span></td>
									<td class="n3_rank"><span class="name3">${list.a1_id }</span> <span
									class="age_rank">(${list.a1_age }-${list.a1_gd })</span></td>
									<td class="n3_rank"><span class="name3">${list.b1_id }</span> <span
									class="age_rank">(${list.b1_age }-${list.b1_gd })</span></td>
									<td class="point_td">
										<c:choose>
											<c:when test="${list.sum_aptn eq null }">0</c:when>
											<c:otherwise>${list.sum_aptn }</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:if>
						</c:if>
					</c:forEach>
					<c:forEach items="${list }" var="list">
					<c:if test="${list.cf_t_nm eq list2.cf_t_nm }">
							<tr>
								<td class="no_td" id="aa">${i}
									<input type="hidden" value="${i}" name="${list.cf_t_idx}_${list.cf_team_a_id}" >
									<input type="hidden" value="${i}" name="${list.cf_t_idx}_${list.cf_team_b_id}" >
								</td>
								<td class="club_td"><span class="club_name">${list.c_nm }</span></td>
								<td class="n3_rank"><span class="name3">${list.a1_id }</span> <span class="age_rank">(${list.a1_age }-${list.a1_gd })</span></td>
								<td class="n3_rank"><span class="name3">${list.b1_id }</span> <span
									class="age_rank">(${list.b1_age }-${list.b1_gd })</span></td>
								<td class="point_td">
									<c:choose>
										<c:when test="${list.sum_aptn eq null }">0</c:when>
										<c:otherwise>${list.sum_aptn }</c:otherwise>
									</c:choose>
								</td>
								<c:set var="i" value="${i+1}" />
							</tr>
						</c:if>
					</c:forEach>
				</table>
				</div>
			</c:forEach>
			<!-- content end-->
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
				<li onClick="location.href='/Cfight/CfightDetail.techni'" ><span>대진표</span></li>
				<li onClick="location.href='/Cfight/CfightMyRank.techni'" class="active_tab"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>
	<!-- wrap end -->
	<script type="text/javascript">
	$(document).ready(function() {
		if(${fn:length(list2)} == 1){
			$("#${list2[0].cf_t_idx}_${u_id}").text($("input[name=${list2[0].cf_t_idx}_${u_id}]").val());
		}
		if(${fn:length(list2)} == 2){
			$("#${list2[0].cf_t_idx}_${u_id}").text($("input[name=${list2[0].cf_t_idx}_${u_id}]").val());
			$("#${list2[1].cf_t_idx}_${u_id}").text($("input[name=${list2[1].cf_t_idx}_${u_id}]").val());
		}
	})
	</script>