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
					
				</div>
				<!-- InstanceEndEditable -->
			</div>
			<!-- head_top end -->
		</header>
		<div id="container">
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
					<li onClick="location.href='/Cfight/CfightEntryType.techni'" class="active_tab"><span>종목별</span></li>
					<li onClick="location.href='/Cfight/CfightEntryClub.techni'"><span>단체별</span></li>
				</ul>
			</div>
			<ul class="accordion_ul">
				<c:forEach items="${list}" var="list">
				<c:set var="i" value="0" />
					<li>
						<ul class="accd_head">
							<li>${list.cf_t_nm }</li>
							<li>${list.group_count }팀</li>
						</ul>
						<div class="accd_a">
							<table class="text_td">
								<c:forEach items="${list2}" var="list2">
									<c:if test="${list.cf_t_idx eq fn:substring(list2.cf_g_idx,0,14)}">
									<c:set var="i" value="${i+1}" />
										<tr>
											<td class="no_td">${i}</td>
											<td class="club_long"><span class="club_name-long">${list2.c_nm }</span></td>
											<td class="n3_rank"><span class="name3">${list2.a1_nm }</span> <span
												class="age_rank">(${list2.a1_age }-${list2.a1_gd })</span></td>
											<td class="n3_rank"><span class="name3">${list2.b1_nm }</span> <span
												class="age_rank">(${list2.b1_age }-${list2.b1_gd })</span></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>	
					</li>
				</c:forEach>
			</ul>
			<!-- InstanceEndEditable -->
		</div>
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
				<li onClick="location.href='/Cfight/CfightEntryType.techni'" class="active_tab"><span>선수</span></li>
				<li onClick="location.href='/Cfight/CfightDetail.techni'"><span>대진표</span></li>
				<li onClick="location.href='/Cfight/CfightMyRank.techni'"><span>순위</span></li>
				<li onClick="location.href='/Board/BoardList.techni'"><span>클럽</span></li>
			</ul>
		</div>
	</div>
	<!-- wrap end -->
</body>
</html>