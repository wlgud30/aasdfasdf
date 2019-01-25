<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

			<!-- InstanceBeginEditable name="container" -->
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
					<li onClick="location.href='/Cfight/CfightMyRank.techni'"><span>나의 순위</span></li>
					<li onClick="location.href='/Cfight/CfightTypeRank.techni'"><span>종목별 순위</span></li>
					<li onClick="location.href='/Cfight/CfightClubRank.techni'" class="active_tab"><span>클럽별 순위</span></li>
				</ul>
			</div>
			<div class="content white_bg">
				<table class="game_td">
			<c:forEach items="${list}" var="list">
				<c:set var="i" value="${i+1}" />				
							<tr>
									<td class="no_td">${i}</td>
									<td class="club_td"><span class="club_name">${list.c_nm }</span></td>
									<td class="point_td">
										<c:choose>
											<c:when test="${list.sum_aptn eq null }">0</c:when>
											<c:otherwise>${list.sum_aptn }</c:otherwise>
										</c:choose>
									</td>
							</tr>
			</c:forEach>							
				</table>
			</div>
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